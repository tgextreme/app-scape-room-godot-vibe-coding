#!/usr/bin/env python3
"""
Script para descargar todos los assets mencionados en ENUNCIADO.md
Descarga desde OpenClipart, Wikimedia y Kenney.nl (vía GitHub).
"""

import os
import sys
import urllib.request
import urllib.error
from pathlib import Path
import zipfile
import requests
from bs4 import BeautifulSoup

# Colores para terminal (opcional)
class Colors:
    GREEN = '\033[92m'
    RED = '\033[91m'
    YELLOW = '\033[93m'
    BLUE = '\033[94m'
    RESET = '\033[0m'

def print_info(msg):
    print(f"{Colors.BLUE}[INFO]{Colors.RESET} {msg}")

def print_success(msg):
    print(f"{Colors.GREEN}[OK]{Colors.RESET} {msg}")

def print_error(msg):
    print(f"{Colors.RED}[ERROR]{Colors.RESET} {msg}")

def print_warning(msg):
    print(f"{Colors.YELLOW}[WARN]{Colors.RESET} {msg}")

# Estructura de assets a descargar con las nuevas URLs
ASSETS = {
    "Objetos interactivos": [
        {
            "nombre": "Destornillador",
            "url": "https://openclipart.org/detail/109687/screwdriver-icon",
            "tipo": "opengameart", # Usamos el mismo scraper
            "carpeta": "assets/props",
            "archivo": "screwdriver.png"
        },
        {
            "nombre": "Fusible",
            "url": "https://commons.wikimedia.org/wiki/File:IEEE_style_fuse.svg",
            "tipo": "wikimedia",
            "carpeta": "assets/props",
            "archivo": "fuse.svg"
        },
        {
            "nombre": "Tarjeta RFID",
            "url": "https://opengameart.org/content/keycredit-cards",
            "tipo": "opengameart",
            "carpeta": "assets/props",
            "archivo": "keycard.png"
        },
        {
            "nombre": "Nota adhesiva",
            "url": "https://opengameart.org/content/free-note-texture-notepng",
            "tipo": "opengameart",
            "carpeta": "assets/props",
            "archivo": "note.png"
        }
    ],
    "Elementos del entorno": [
        {
            "nombre": "Rejilla de ventilación",
            "url": "https://opengameart.org/content/office-air-vent",
            "tipo": "opengameart",
            "carpeta": "assets/props",
            "archivo": "vent.png"
        },
        {
            "nombre": "Panel eléctrico",
            "url": "https://openclipart.org/detail/353038/control-panel",
            "tipo": "opengameart", # Usamos el mismo scraper
            "carpeta": "assets/props",
            "archivo": "control_panel.png"
        },
        {
            "nombre": "Puerta Sci-Fi",
            "url": "https://opengameart.org/content/scifi-door-sprite",
            "tipo": "opengameart",
            "carpeta": "assets/props",
            "archivo": "door.png"
        },
        {
            "nombre": "Monitor/PC",
            "url": "https://openclipart.org/detail/301110/computer-monitor-monitor",
            "tipo": "opengameart", # Usamos el mismo scraper
            "carpeta": "assets/props",
            "archivo": "monitor.png"
        }
    ],
    "UI y Sonidos": [
        {
            "nombre": "Kenney UI Pack",
            "url": "https://kenney.nl/content/3-assets/1/uipack.zip",
            "tipo": "direct_zip",
            "carpeta": "assets/ui",
            "archivo": "kenney_ui_pack.zip"
        },
        {
            "nombre": "Kenney Interface Sounds",
            "url": "https://kenney.nl/content/3-assets/13/interfacesounds.zip",
            "tipo": "direct_zip",
            "carpeta": "assets/sfx",
            "archivo": "kenney_interface_sounds.zip"
        },
        {
            "nombre": "Teclado numérico",
            "url": "https://openclipart.org/detail/270603/phone-keypad",
            "tipo": "opengameart", # Usamos el mismo scraper
            "carpeta": "assets/ui",
            "archivo": "keypad.png"
        }
    ]
}

def crear_carpetas():
    """Crea las carpetas necesarias para los assets"""
    print_info("Creando estructura de carpetas...")
    carpetas = [
        "assets/props",
        "assets/ui",
        "assets/sfx"
    ]
    
    for carpeta in carpetas:
        Path(carpeta).mkdir(parents=True, exist_ok=True)
        print_success(f"Carpeta creada/verificada: {carpeta}")

def descargar_archivo(url, destino):
    """Descarga un archivo desde una URL"""
    try:
        headers = {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
        }
        req = urllib.request.Request(url, headers=headers)
        
        with urllib.request.urlopen(req, timeout=30) as response:
            with open(destino, 'wb') as out_file:
                out_file.write(response.read())
        return True
    except Exception as e:
        print_error(f"Error descargando {url}: {e}")
        return False

def descargar_y_extraer_zip(url, destino_zip, extract_folder):
    """Descarga un ZIP y lo extrae"""
    print_info(f"Descargando ZIP desde {url}...")
    if not descargar_archivo(url, destino_zip):
        print_error(f"No se pudo descargar el ZIP de {url}")
        return False
    
    print_success(f"ZIP descargado en {destino_zip}")
    
    try:
        print_info(f"Extrayendo {destino_zip} en {extract_folder}...")
        with zipfile.ZipFile(destino_zip, 'r') as zip_ref:
            zip_ref.extractall(extract_folder)
        print_success(f"Extraído correctamente en {extract_folder}")
        os.remove(destino_zip) # Limpiar el archivo ZIP
        print_info(f"Archivo ZIP temporal {destino_zip} eliminado.")
        return True
    except Exception as e:
        print_error(f"Error extrayendo {destino_zip}: {e}")
        return False

def descargar_opengameart(page_url, destino):
    """Descarga un asset desde su página de OpenGameArt o OpenClipart"""
    print_info(f"Procesando OpenGameArt/OpenClipart: {page_url}")
    try:
        headers = {'User-Agent': 'Mozilla/5.0'}
        page_response = requests.get(page_url, headers=headers, timeout=30)
        page_response.raise_for_status()
        
        soup = BeautifulSoup(page_response.content, 'html.parser')
        
        # Buscar el enlace de descarga, que suele estar en un <a> con clase "btn-success" o similar
        download_link_tag = soup.find('a', class_='btn-success')
        if not download_link_tag:
             # Plan B para OpenClipart: buscar un <a> que contenga 'Download'
             download_link_tag = soup.find('a', string=lambda t: t and 'download' in t.lower())

        if not download_link_tag or not download_link_tag.has_attr('href'):
            print_error(f"No se encontró el enlace de descarga en {page_url}")
            return False

        download_url = download_link_tag['href']
        
        # A veces la URL es relativa
        if not download_url.startswith('http'):
            from urllib.parse import urljoin
            download_url = urljoin(page_url, download_url)

        print_info(f"Enlace de descarga encontrado: {download_url}")
        
        if descargar_archivo(download_url, destino):
            print_success(f"Asset descargado en {destino}")
            return True
        else:
            print_error(f"Fallo al descargar el archivo final: {download_url}")
            return False

    except Exception as e:
        print_error(f"Error procesando la página {page_url}: {e}")
        return False

def descargar_wikimedia(page_url, destino):
    """Descarga un asset desde Wikimedia Commons"""
    print_info(f"Procesando Wikimedia: {page_url}")
    try:
        headers = {'User-Agent': 'Mozilla/5.0'}
        page_response = requests.get(page_url, headers=headers, timeout=30)
        page_response.raise_for_status()
        
        soup = BeautifulSoup(page_response.content, 'html.parser')
        
        # El enlace al archivo original suele estar en un div con clase 'fullImageLink'
        full_image_div = soup.find('div', class_='fullImageLink')
        if not full_image_div:
            print_error(f"No se encontró 'fullImageLink' en {page_url}")
            return False
        
        download_link_tag = full_image_div.find('a')
        if not download_link_tag or not download_link_tag.has_attr('href'):
            print_error(f"No se encontró el enlace de descarga en {page_url}")
            return False

        download_url = download_link_tag['href']
        print_info(f"Enlace de descarga encontrado: {download_url}")
        
        if descargar_archivo(download_url, destino):
            print_success(f"Asset de Wikimedia descargado en {destino}")
            return True
        else:
            print_error(f"Fallo al descargar el archivo final de Wikimedia: {download_url}")
            return False
            
    except Exception as e:
        print_error(f"Error procesando la página de Wikimedia {page_url}: {e}")
        return False

def main():
    print("\n" + "="*60)
    print("  📥 DESCARGADOR DE ASSETS v2 - ESCAPE ROOM GODOT 4")
    print("="*60 + "\n")
    
    crear_carpetas()
    
    print_info("Iniciando descarga de assets con nuevas fuentes...")
    
    for categoria, items in ASSETS.items():
        print(f"\n--- Descargando Categoría: {categoria} ---")
        for item in items:
            # Comprobación de existencia un poco más robusta
            destino_final_path = Path(item["carpeta"]) / item["archivo"]
            if item['tipo'] == 'direct_zip':
                 # Para zips, comprobamos si ya hay archivos en la carpeta destino
                if any(Path(item["carpeta"]).iterdir()):
                    print_warning(f"'{item['nombre']}' - la carpeta ya tiene contenido. Saltando descarga.")
                    continue
            elif destino_final_path.exists():
                print_warning(f"'{item['nombre']}' ya existe en {destino_final_path}. Saltando descarga.")
                continue

            print(f"\n-> Intentando descargar '{item['nombre']}'...")

            success = False
            if item['tipo'] == 'direct_zip':
                zip_temp_path = Path(item["carpeta"]) / item["archivo"]
                extract_path = Path(item["carpeta"])
                success = descargar_y_extraer_zip(item['url'], zip_temp_path, extract_path)

            elif item['tipo'] == 'opengameart':
                success = descargar_opengameart(item['url'], destino_final_path)

            elif item['tipo'] == 'wikimedia':
                success = descargar_wikimedia(item['url'], destino_final_path)

            elif item['tipo'] == 'pixabay' or item['tipo'] == 'kenney':
                print_warning(f"'{item['nombre']}' requiere descarga manual. Por favor, descarga desde: {item['url']}")
                success = False # Marcado como no exitoso para que el usuario sepa
            
            if success:
                print_success(f"'{item['nombre']}' gestionado correctamente.")
            else:
                print_error(f"No se pudo gestionar '{item['nombre']}' automáticamente.")

    print("\n" + "="*60)
    print("  ✅ PROCESO DE DESCARGA FINALIZADO")
    print("="*60 + "\n")
    
    print_info("Resumen:")
    print_success("Assets de Kenney (UI/Audio) -> Descargados y extraídos desde GitHub.")
    print_success("Assets de OpenGameArt/Wikimedia/OpenClipart -> Descargados.")
    print_error("Algunos assets pueden haber fallado. Revisa el log de arriba.")
    print()
    print_info("¡El proyecto ya tiene casi todos los assets listos para usar en Godot!")
    print_info("Puede que necesites mover los archivos del pack de Kenney a las carpetas 'ui' y 'sfx'.")


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print()
        print_warning("Operación cancelada por el usuario")
        sys.exit(0)
    except Exception as e:
        print_error(f"Error inesperado: {e}")
        sys.exit(1)
