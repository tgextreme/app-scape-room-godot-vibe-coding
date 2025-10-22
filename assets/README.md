# 📦 Assets Folder

Esta carpeta está vacía intencionalmente. El proyecto funciona completamente con placeholders (CSG boxes).

## Estructura sugerida:

### `/props`
Modelos 3D o sprites 2D para objetos interactivos:
- `screwdriver.png` o `screwdriver.gltf`
- `fuse.png` o `fuse.fbx`
- `vent_grill.png`
- `fuse_box.png`
- `note.png`
- `keypad.png`
- `door.png`

### `/ui`
Iconos para interfaz:
- `icon_screwdriver.png` (64x64 o 128x128)
- `icon_fuse.png`
- Botones para teclado numérico
- Paneles para UI

### `/sfx`
Efectos de sonido:
- `pickup.ogg` - Al recoger items
- `click.ogg` - Al presionar botones
- `beep_correct.ogg` - Código correcto
- `beep_error.ogg` - Código incorrecto
- `door_open.ogg` - Puerta abriendo
- `vent_open.ogg` - Rejilla abriendo

## ¿Dónde conseguir assets gratuitos?

Ver **INSTRUCCIONES_COMPLETAS.md** o **RECURSOS_Y_MEJORAS.md** para:
- Enlaces directos a Kenney.nl (CC0)
- OpenGameArt.org (CC0)
- Pixabay (Pixabay License)
- Freesound.org (CC0)

## Formatos recomendados:

### Imágenes:
- PNG con transparencia (para sprites 2D)
- Tamaños: 64x64, 128x128, 256x256, 512x512

### Modelos 3D:
- GLTF (.gltf, .glb) - Recomendado para Godot 4
- FBX - También compatible
- OBJ - Formato simple

### Sonidos:
- OGG Vorbis - Formato recomendado para Godot
- WAV - Para convertir a OGG

## Nota:

El juego es **completamente funcional sin assets adicionales**. Los assets son solo para mejorar el aspecto visual y audio.

Los placeholders CSG con colores funcionan perfectamente para prototipar o para un estilo minimalista.
