# 🎮 ASSETS LISTOS PARA USAR

## ✅ LO QUE YA TIENES (100% funcional):

### 📦 En `assets/props/` (8 archivos):
- ✅ `screwdriver.png` - Destornillador (OpenClipart, CC0)
- ✅ `fuse.svg` - Fusible (Wikimedia, CC0)
- ✅ `control_panel.png` - Panel eléctrico (OpenClipart, CC0)
- ✅ `monitor.png` - Monitor/PC (OpenClipart, CC0)
- ✅ `keycard.png` - Tarjeta RFID (OpenGameArt, CC0)
- ✅ `note.png` - Nota adhesiva (OpenGameArt, CC0)
- ✅ `vent.png` - Rejilla de ventilación (OpenGameArt, CC0)
- ✅ `door.png` - Puerta Sci-Fi (OpenGameArt, CC0)

### 🎨 En `assets/ui/` (1 archivo):
- ✅ `keypad.png` - Teclado numérico (OpenClipart, CC0)

---

## ⚠️ LO QUE FALTA (Opcional):

### 🎨 Pack de UI (botones, paneles):
**Opción 1 - Manual (Recomendado):**
1. Ve a: https://kenney.nl/assets/ui-pack
2. Haz clic en "Download" (botón naranja)
3. Extrae el ZIP en `assets/ui/`

**Opción 2 - Usa lo que tienes:**
El juego ya tiene UI funcional (Label, Button, Panel nativos de Godot). Los packs de Kenney son solo para embellecer.

### 🔊 Sonidos de interfaz:
**Opción 1 - Manual:**
1. Ve a: https://kenney.nl/assets/interface-sounds
2. Haz clic en "Download"
3. Extrae el ZIP en `assets/sfx/`

**Opción 2 - Sin sonido:**
El juego funciona perfectamente sin sonido. Puedes agregarlo después.

---

## 🚀 CÓMO USAR LOS ASSETS EN GODOT

### Para objetos 3D (destornillador, fusible, etc.):

#### Método 1: Sprite3D (Recomendado - estilo retro)
```gdscript
# Cambia el CSGBox3D por Sprite3D
1. Abre scenes/Main.tscn
2. Selecciona el objeto (ej: Screwdriver)
3. Click derecho → "Change Type" → Sprite3D
4. En Inspector:
   - Texture → Arrastra assets/props/screwdriver.png
   - Billboard → BILLBOARD_ENABLED
   - Pixel Size → 0.01 (ajusta tamaño)
```

#### Método 2: Textura en CSGBox3D (estilo texturizado)
```gdscript
# Mantén el CSGBox3D y aplica textura
1. Selecciona el CSGBox3D
2. En Material → New StandardMaterial3D
3. Albedo → Texture → Arrastra assets/props/screwdriver.png
4. Transparency → Alpha
```

### Para la UI (HUD, popup):
```gdscript
# En ui/HUD.tscn o ui/KeypadPrompt.tscn
1. Selecciona el Panel
2. En Theme Overrides → Styles → Normal
3. New StyleBoxTexture
4. Texture → Arrastra un panel del pack de Kenney
```

### Para los sonidos:
```gdscript
# En cualquier script
var sound_click = preload("res://assets/sfx/click1.ogg")

func _on_button_pressed():
    $AudioStreamPlayer.stream = sound_click
    $AudioStreamPlayer.play()
```

---

## 💡 ESTADO ACTUAL DEL PROYECTO

### ✅ 100% Funcional SIN descargar nada más:
- ✅ Movimiento FPS (WASD + ratón)
- ✅ Interacción con RayCast (tecla E)
- ✅ Sistema de inventario global
- ✅ Puzzles encadenados (7 objetos)
- ✅ UI completa (HUD + popup keypad)
- ✅ Validación de código (4729)
- ✅ Cambio de escena (puerta → pasillo)
- ✅ Assets visuales para TODOS los objetos

### 🎨 Opcional (mejora estética):
- Pack de UI de Kenney (descarga manual)
- Sonidos de interfaz (descarga manual)

---

## 🎯 PRÓXIMOS PASOS:

### Opción A: Jugar AHORA (sin más descargas)
```
1. Abre Godot 4
2. Presiona F5
3. ¡Juega con los assets que ya tienes!
```

### Opción B: Aplicar texturas (5 minutos)
```
1. Abre scenes/Main.tscn
2. Convierte los objetos a Sprite3D (ver arriba)
3. Arrastra los PNG a las texturas
4. Presiona F5 y disfruta
```

### Opción C: Completar con UI/sonidos (15 minutos)
```
1. Descarga los packs de Kenney (manual)
2. Aplica texturas a los objetos
3. Cambia los paneles de la UI
4. Añade sonidos a los botones
5. ¡Proyecto 100% pulido!
```

---

## 📄 LICENCIAS (Todos CC0 / Dominio Público):

- **OpenClipart**: CC0 (dominio público)
- **Wikimedia Commons**: CC0 (dominio público)
- **OpenGameArt** (estos assets): CC0
- **Kenney.nl** (si lo descargas): CC0

**Puedes usar este proyecto comercialmente sin atribución** gracias a las licencias CC0.

---

## 🐛 TROUBLESHOOTING:

### "No veo las texturas en Godot"
1. Presiona F2 (modo 2D) → F3 (modo 3D) para refrescar
2. Project → Reimport Assets
3. Asegúrate de que los PNG están en `res://assets/props/`

### "Los sprites se ven pixelados"
1. Selecciona el asset en FileSystem
2. Import → Filter = Nearest
3. Reimport

### "El fusible es SVG, no PNG"
1. Abre `fuse.svg` en Inkscape o un visor web
2. Exporta como PNG 256x256
3. Guarda como `fuse.png`

---

**¡El proyecto está listo para usar!** 🎉

Los assets adicionales de Kenney son solo "polish", el juego ya funciona perfectamente.
