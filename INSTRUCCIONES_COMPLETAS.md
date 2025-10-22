# GUÍA COMPLETA DE CONFIGURACIÓN - ESCAPE ROOM GODOT 4

## 📋 PASO 1: CONFIGURAR AUTOLOAD (GameState)

1. Abre Godot 4
2. Ve a **Project → Project Settings**
3. Ve a la pestaña **Autoload**
4. Haz clic en el ícono de carpeta para seleccionar script
5. Selecciona `res://scripts/GameState.gd`
6. Nombre del nodo: `GameState`
7. Haz clic en **Add**
8. Cierra Project Settings

✅ Esto hace que GameState esté disponible globalmente en todos los scripts.

---

## 📋 PASO 2: CONFIGURAR INPUT MAP

1. Ve a **Project → Project Settings**
2. Ve a la pestaña **Input Map**
3. Crea las siguientes acciones:

### Movimiento:
- **move_forward**
  - Añadir: W
  
- **move_back**
  - Añadir: S
  
- **move_left**
  - Añadir: A
  
- **move_right**
  - Añadir: D

### Interacción:
- **interact**
  - Añadir: E

4. Cierra Project Settings

✅ Los controles ya están configurados.

---

## 📋 PASO 3: CREAR LA ESCENA MAIN (HABITACIÓN)

La escena Main.tscn ya está creada, pero necesitas añadir materiales visuales:

### Materiales para objetos (opcional pero recomendado):

1. **Floor (Suelo)**:
   - Selecciona el nodo `Room/Floor`
   - En el Inspector, en la propiedad Material, crea un nuevo StandardMaterial3D
   - Ajusta el color (gris oscuro: #404040)

2. **Paredes**:
   - Similar al suelo, color gris medio (#808080)

3. **Objetos interactivos** (para distinguirlos):
   - **Destornillador**: Color amarillo (#FFD700)
   - **Fusible**: Color rojo (#FF0000)
   - **Rejilla**: Color gris metálico (#A0A0A0)
   - **Cuadro de fusibles**: Color negro (#000000)
   - **Nota**: Color amarillo claro (#FFFF99)
   - **Teclado**: Color azul (#0080FF)
   - **Puerta**: Color marrón (#8B4513)

---

## 📋 PASO 4: ESTRUCTURA DE NODOS COMPLETA

```
Main (Node3D)
├── Environment
│   ├── DirectionalLight3D
│   └── WorldEnvironment
├── Room
│   ├── Floor (CSGBox3D con StaticBody3D + CollisionShape3D)
│   ├── Ceiling (CSGBox3D)
│   ├── WallNorth (CSGBox3D)
│   ├── WallSouth (CSGBox3D)
│   ├── WallEast (CSGBox3D)
│   └── WallWest (CSGBox3D)
├── Interactables
│   ├── Screwdriver (StaticBody3D) → script: Pickup.gd
│   │   ├── MeshInstance3D (Cylinder)
│   │   └── CollisionShape3D
│   ├── Vent (StaticBody3D) → script: Vent.gd
│   │   ├── MeshInstance3D (Box)
│   │   └── CollisionShape3D
│   ├── FuseItem (StaticBody3D) → script: Pickup.gd
│   │   ├── MeshInstance3D (Cylinder)
│   │   └── CollisionShape3D
│   ├── FuseBox (StaticBody3D) → script: FuseBox.gd
│   │   ├── MeshInstance3D (Box)
│   │   └── CollisionShape3D
│   ├── Note (StaticBody3D) → script: Note.gd
│   │   ├── MeshInstance3D (Box)
│   │   └── CollisionShape3D
│   ├── Keypad (StaticBody3D) → script: Keypad.gd
│   │   ├── MeshInstance3D (Box)
│   │   └── CollisionShape3D
│   └── Door (StaticBody3D) → script: Door.gd
│       ├── MeshInstance3D (Box)
│       └── CollisionShape3D
├── Player (CharacterBody3D) → script: Player.gd
│   ├── CollisionShape3D (Capsule)
│   └── Camera3D
│       └── RayCast3D (target_position: 0, 0, -3)
└── UI
    ├── HUD (CanvasLayer)
    └── KeypadPrompt (CanvasLayer)
```

---

## 📋 PASO 5: CONFIGURACIÓN DE SCRIPTS EN NODOS

### Objetos Recogibles (Pickup.gd):

1. **Screwdriver**:
   - Script: `res://scripts/Pickup.gd`
   - Export var `item_name`: `"destornillador"`

2. **FuseItem**:
   - Script: `res://scripts/Pickup.gd`
   - Export var `item_name`: `"fusible"`

### Objetos Interactivos:

3. **Vent** (Rejilla):
   - Script: `res://scripts/Vent.gd`
   - Export var `revealed_node`: Arrastra el nodo `FuseItem`

4. **FuseBox** (Cuadro de fusibles):
   - Script: `res://scripts/FuseBox.gd`

5. **Note** (Nota con pista):
   - Script: `res://scripts/Note.gd`
   - Export var `note_text`: Ya tiene el texto del código César

6. **Keypad** (Teclado numérico):
   - Script: `res://scripts/Keypad.gd`
   - Export var `keypad_prompt`: Arrastra el nodo `UI/KeypadPrompt`

7. **Door** (Puerta):
   - Script: `res://scripts/Door.gd`
   - Export var `next_scene`: `"res://scenes/Corridor.tscn"`

---

## 📋 PASO 6: CONFIGURACIÓN DEL PLAYER

1. **Player** (CharacterBody3D):
   - Script: `res://scripts/Player.gd`
   - Collision Layer: Layer 1
   - Collision Mask: Layer 1

2. **Camera3D**:
   - Position: (0, 0.6, 0)
   - Current: ✅ Activado

3. **RayCast3D** (hijo de Camera3D):
   - Enabled: ✅ Activado
   - Target Position: (0, 0, -3)
   - Collision Mask: Layers 1 y 2
   - Collide With Bodies: ✅ Activado

---

## 📋 PASO 7: CONFIGURACIÓN DE COLISIONES

Para cada objeto interactivo (Screwdriver, Vent, FuseBox, Note, Keypad, Door):

1. El nodo raíz debe ser **StaticBody3D**
2. Debe tener un hijo **CollisionShape3D**
3. En CollisionShape3D, asigna una forma (BoxShape3D o similar)
4. Collision Layer: Layer 2 (para que el raycast los detecte)

---

## 🎮 PASO 8: PROBAR EL JUEGO

Presiona **F5** o el botón de Play

### Controles:
- **WASD**: Movimiento
- **Mouse**: Mirar alrededor
- **E**: Interactuar con objetos
- **ESC**: Liberar/capturar ratón

### Flujo del juego:
1. ✅ Recoge el **destornillador** (visible desde el inicio)
2. ✅ Ve a la **rejilla** y usa E (consume destornillador, revela fusible)
3. ✅ Recoge el **fusible**
4. ✅ Ve al **cuadro de fusibles** y usa E (consume fusible, activa energía)
5. ✅ Lee la **nota** para obtener la pista (código 2507 → 4729)
6. ✅ Ve al **teclado** y usa E (abre popup)
7. ✅ Introduce **4729** y presiona ACEPTAR
8. ✅ Ve a la **puerta** y usa E (cambio a escena Corridor)

---

## 🎨 RECURSOS A DESCARGAR (CC0/Gratis uso comercial)

### 📦 OBJETOS INTERACTIVOS:

#### Destornillador:
1. **Pixabay Vector**: https://pixabay.com/vectors/screwdriver-screw-driver-tool-29367/
2. **OpenGameArt Tool Icons**: https://opengameart.org/content/tool-icons
3. **Kenney Game Icons**: https://kenney.nl/assets/game-icons
   - Formato: SVG/PNG
   - Tamaño: 128x128 o 256x256
   - Uso: Icono de inventario o sprite 2D

#### Fusible:
1. **Pixabay Fuse Vector**: https://pixabay.com/vectors/electric-fuse-fuse-high-voltage-155785/
2. **OpenGameArt Electronics**: https://opengameart.org/content/electronics-parts
3. **Game-Icons.net Fuse**: https://game-icons.net/
   - Formato: SVG/PNG
   - Tamaño: 64x64 o 128x128
   - Uso: Sprite pequeño o icono

### 🏗️ ELEMENTOS DE ENTORNO:

#### Rejilla de Ventilación:
1. **OpenGameArt Vent**: https://opengameart.org/content/office-air-vent
2. **Pixabay Vent Vector**: Buscar "ventilation grid"
3. **Kenney Industrial Pack**: https://kenney.nl/assets/platformer-pack-industrial
   - Formato: PNG con transparencia
   - Tamaño: 256x256
   - Uso: Textura para plano 3D

#### Cuadro Eléctrico:
1. **Pixabay Control Panel**: https://pixabay.com/vectors/control-panel-control-panel-4782826/
2. **OpenGameArt Panels**: https://opengameart.org/content/ui-panels
3. **Kenney UI Pack**: https://kenney.nl/assets/ui-pack-sci-fi
   - Formato: PNG/SVG
   - Tamaño: 512x512
   - Uso: Textura o sprite 2D

#### Puerta:
1. **OpenGameArt Sci-Fi Door**: https://opengameart.org/content/scifi-door-sprite
2. **Kenney Modular Buildings**: https://kenney.nl/assets/modular-buildings
3. **Sketchfab CC0 Door Models**: https://sketchfab.com/search?q=door&licenses=322a749bcfa841b29dff1e8a1bb74b0b&type=models
   - Formato: PNG sprite o FBX/GLTF (3D)
   - Tamaño: 512x512 (sprite) o low-poly (3D)
   - Uso: Sprite o modelo 3D simple

#### Monitor/PC:
1. **Pixabay LCD Monitor**: https://pixabay.com/vectors/lcd-monitor-computer-32872/
2. **OpenGameArt Computer**: https://opengameart.org/content/computer-and-monitors
3. **Game-Icons.net**: https://game-icons.net/
   - Formato: SVG/PNG
   - Tamaño: 256x256
   - Uso: Sprite 2D para la nota

### 🎨 UI PARA TECLADO:

#### Botones y Paneles:
1. **Kenney UI Pack**: https://kenney.nl/assets/ui-pack
2. **Kenney UI Pack Sci-Fi**: https://kenney.nl/assets/ui-pack-sci-fi
3. **OpenGameArt UI Buttons**: https://opengameart.org/content/ui-buttons
   - Formato: PNG transparente
   - Tamaño: 64x64 para botones, 512x512 para paneles
   - Uso: UI del teclado numérico

#### Teclado Numérico:
1. **Pixabay Keypad**: https://pixabay.com/vectors/keypad-numbers-keyboard-access-146161/
2. **Kenney Input Prompts**: https://kenney.nl/assets/input-prompts
3. **OpenGameArt Number Buttons**: Buscar "number buttons"
   - Formato: PNG/SVG
   - Tamaño: 512x512
   - Uso: Base visual para el popup

### 🔊 EFECTOS DE SONIDO:

#### Sonidos de UI:
1. **Kenney Interface Sounds**: https://kenney.nl/assets/interface-sounds
2. **OpenGameArt UI Sounds**: https://opengameart.org/content/50-cc0-ui-sfx
3. **Freesound CC0**: https://freesound.org/browse/tags/ui/?license=Creative+Commons+0
   - Formato: OGG o WAV
   - Frecuencia: 44.1kHz
   - Uso: Click, beep correcto, beep error

#### Sonido de Puerta:
1. **Freesound Door Open**: https://freesound.org/search/?q=door+open&f=license:%22Creative+Commons+0%22
2. **OpenGameArt Door Sounds**: https://opengameart.org/content/door-open-door-close-set
3. **Kenney Impact Sounds**: https://kenney.nl/assets/impact-sounds
   - Formato: OGG
   - Tamaño: ~50-100KB
   - Uso: Sonido al abrir la puerta

---

## ✅ CRITERIOS DE ACEPTACIÓN (QA 2 MINUTOS)

### Test rápido:

1. ✅ **Movimiento**: WASD funciona, mouse mira alrededor
2. ✅ **Recoger destornillador**: Presiona E cerca, desaparece, inventario actualizado
3. ✅ **Abrir rejilla**: Requiere destornillador, revela fusible
4. ✅ **Recoger fusible**: Presiona E, añadido al inventario
5. ✅ **Activar energía**: Usar fusible en cuadro, mensaje "energía activada"
6. ✅ **Leer nota**: Muestra pista César +2, código 2507 → 4729
7. ✅ **Teclado sin energía**: Mensaje "no tiene energía"
8. ✅ **Teclado con energía**: Abre popup
9. ✅ **Código incorrecto**: Mensaje "código incorrecto"
10. ✅ **Código correcto (4729)**: Mensaje "puerta desbloqueada"
11. ✅ **Abrir puerta**: Cambia a escena Corridor o mensaje de victoria

---

## 🚨 PLAN B (SI VAS JUSTO DE TIEMPO)

### Simplificaciones seguras:

1. **Eliminar rejilla**:
   - Deja el fusible visible desde el inicio
   - Elimina el nodo Vent
   - Solo necesitas: destornillador (opcional), fusible, cuadro, nota, teclado, puerta

2. **Autodesbloqueo**:
   - En `Keypad.gd`, línea ~30, cambia:
   ```gdscript
   if GameState.flags.power_on:
       GameState.flags.door_unlocked = true
       GameState.say("Energía activada, puerta desbloqueada automáticamente")
   ```

3. **Sin segunda escena**:
   - En `Door.gd`, línea ~15, cambia:
   ```gdscript
   GameState.say("¡FELICIDADES! Has completado el escape room")
   get_tree().quit()  # O simplemente no cambiar escena
   ```

4. **Inventario en consola**:
   - Si el HUD falla, el inventario se imprime en Output (F4)

---

## 🔧 TROUBLESHOOTING COMÚN

### Problema: "GameState no declarado"
- **Solución**: Configurar Autoload (Paso 1)

### Problema: "No puedo moverme"
- **Solución**: Configurar Input Map (Paso 2)

### Problema: "El raycast no detecta objetos"
- **Solución**: 
  - RayCast3D debe estar Enabled
  - Collision Mask debe incluir Layer 2
  - Los objetos deben tener StaticBody3D en Layer 2

### Problema: "No se captura el mouse"
- **Solución**: Click en la ventana del juego, o presiona ESC dos veces

### Problema: "La puerta no se abre"
- **Solución**: 
  - Verifica que `GameState.flags.door_unlocked = true`
  - Verifica que el código sea exactamente "4729"
  - Revisa la Output (F4) para ver mensajes

---

## 📝 NOTAS FINALES

- Todo el código está listo para copiar/pegar
- Los scripts están en la carpeta `scripts/`
- Las escenas están en la carpeta `scenes/`
- La UI está en la carpeta `ui/`
- GameState es el cerebro del juego (inventario y flags)
- El Player tiene movimiento FPS + raycast de interacción
- Todos los objetos interactivos tienen método `interact()`

### Orden de desarrollo recomendado:
1. ✅ Configurar Autoload y Input Map
2. ✅ Abrir Main.tscn y configurar materiales
3. ✅ Asignar scripts a los nodos
4. ✅ Configurar export variables (item_name, revealed_node, etc.)
5. ✅ Testear paso a paso cada interacción
6. ✅ Descargar y añadir assets visuales (opcional)
7. ✅ Añadir sonidos (opcional)

¡Suerte con el directo "vibe coding"! 🚀
