#!/usr/bin/env python3
"""
Script simplificado para descargar packs de Kenney.nl
"""

import requests
from bs4 import BeautifulSoup
import zipfile
from pathlib import Path

def descargar_kenney_pack(url_pagina, carpeta_destino, nombre_pack):
    """Descarga un pack de Kenney.nl desde su página"""
    print(f"\n📦 Descargando {nombre_pack}...")
    print(f"   Desde: {url_pagina}")
    
    try:
        # Obtener la página
        headers = {'User-Agent': 'Mozilla/5.0'}
        response = requests.get(url_pagina, headers=headers, timeout=30)
        response.raise_for_status()
        
        soup = BeautifulSoup(response.content, 'html.parser')
        
        # Buscar el botón de descarga
        download_link = soup.find('a', class_='donate-download')
        if not download_link:
            print(f"❌ No se encontró el enlace de descarga en {url_pagina}")
            return False
        
        download_url = download_link['href']
        if not download_url.startswith('http'):
            download_url = 'https://kenney.nl' + download_url
        
        print(f"   Enlace encontrado: {download_url}")
        
        # Descargar el ZIP
        zip_path = Path(carpeta_destino) / f"{nombre_pack}.zip"
        print(f"   Descargando ZIP...")
        
        zip_response = requests.get(download_url, headers=headers, timeout=60)
        zip_response.raise_for_status()
        
        with open(zip_path, 'wb') as f:
            f.write(zip_response.content)
        
        print(f"   ✅ ZIP descargado: {zip_path}")
        
        # Extraer el ZIP
        print(f"   Extrayendo archivos...")
        with zipfile.ZipFile(zip_path, 'r') as zip_ref:
            zip_ref.extractall(carpeta_destino)
        
        print(f"   ✅ Archivos extraídos en: {carpeta_destino}")
        
        # Eliminar el ZIP
        zip_path.unlink()
        print(f"   🧹 ZIP temporal eliminado")
        
        return True
        
    except Exception as e:
        print(f"❌ Error: {e}")
        return False

def main():
    print("\n" + "="*60)
    print("  📥 DESCARGADOR DE KENNEY ASSETS")
    print("="*60)
    
    # Crear carpetas
    Path("assets/ui").mkdir(parents=True, exist_ok=True)
    Path("assets/sfx").mkdir(parents=True, exist_ok=True)
    
    # Descargar UI Pack
    ui_success = descargar_kenney_pack(
        "https://kenney.nl/assets/ui-pack",
        "assets/ui",
        "kenney_ui_pack"
    )
    
    # Descargar Interface Sounds
    sfx_success = descargar_kenney_pack(
        "https://kenney.nl/assets/interface-sounds",
        "assets/sfx",
        "kenney_interface_sounds"
    )
    
    print("\n" + "="*60)
    print("  📊 RESUMEN")
    print("="*60)
    
    if ui_success:
        print("✅ UI Pack descargado en assets/ui/")
    else:
        print("❌ UI Pack - Error en descarga")
    
    if sfx_success:
        print("✅ Interface Sounds descargado en assets/sfx/")
    else:
        print("❌ Interface Sounds - Error en descarga")
    
    print("\n💡 Ahora abre Godot y los assets estarán listos para usar!")

if __name__ == "__main__":
    main()
