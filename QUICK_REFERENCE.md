# ⚡ QUICK REFERENCE - CHEAT SHEET

## 🎮 CONTROLES DEL JUEGO

```
WASD        → Movimiento
Mouse       → Mirar alrededor
E           → Interactuar
ESC         → Liberar/capturar mouse
```

---

## 🗝️ SOLUCIÓN COMPLETA

```
1. Recoger destornillador (-3, 0.5, -3)
2. Abrir rejilla (3, 2, -4.8)
3. Recoger fusible (3, 1.5, -4.5)
4. Instalar fusible en cuadro (-4.5, 2, 0)
5. Leer nota (0, 1.5, 3) → Código: 4729
6. Introducir 4729 en teclado (4.5, 2, 2)
7. Abrir puerta (0, 1.5, 4.8) → ¡Victoria!
```

---

## 📁 ARCHIVOS CLAVE

```
project.godot                        ← Configuración (Autoload + Input)
scenes/Main.tscn                     ← Escena principal
scripts/GameState.gd                 ← Autoload (inventario + flags)
scripts/Player.gd                    ← Movimiento + interacción
```

---

## 🔧 CONFIGURACIÓN CRÍTICA

### Autoload:
```
Project → Project Settings → Autoload
Nombre: GameState
Path: res://scripts/GameState.gd
```

### Input Map:
```
Project → Project Settings → Input Map
move_forward → W (Physical: 87)
move_back    → S (Physical: 83)
move_left    → A (Physical: 65)
move_right   → D (Physical: 68)
interact     → E (Physical: 69)
```

---

## 🎯 COORDENADAS DE OBJETOS

```
Destornillador:  (-3,   0.5, -3)    Esquina Noroeste
Rejilla:         ( 3,   2,   -4.8)  Pared Norte (arriba)
Fusible:         ( 3,   1.5, -4.5)  Detrás de rejilla (oculto)
Cuadro:          (-4.5, 2,    0)    Pared Oeste
Nota:            ( 0,   1.5,  3)    Centro Sur
Teclado:         ( 4.5, 2,    2)    Pared Este
Puerta:          ( 0,   1.5,  4.8)  Pared Sur
Jugador:         ( 0,   1,    0)    Centro (spawn)
```

---

## 🎨 COLORES RECOMENDADOS

```
Destornillador:  #FFD700  (Amarillo oro)
Fusible:         #FF0000  (Rojo)
Rejilla:         #C0C0C0  (Gris metálico)
Cuadro:          #202020  (Negro)
Nota:            #FFFF99  (Amarillo claro)
Teclado:         #4080FF  (Azul)
Puerta:          #8B4513  (Marrón)
Suelo:           #404040  (Gris oscuro)
Paredes:         #808080  (Gris medio)
```

---

## 🔗 EXPORT VARIABLES (NodePaths)

```
Vent.revealed_node        → Interactables/FuseItem
Keypad.keypad_prompt      → UI/KeypadPrompt
Door.next_scene           → "res://scenes/Corridor.tscn"
Screwdriver.item_name     → "destornillador"
FuseItem.item_name        → "fusible"
```

---

## 🏷️ COLLISION LAYERS

```
Layer 1: Entorno (suelo, paredes, techo)
Layer 2: Objetos interactivos

Player:
  - Collision Layer: 1
  - Collision Mask: 1

RayCast3D:
  - Collision Mask: 1 + 2 (detecta todo)

Interactivos (todos):
  - Collision Layer: 2
```

---

## 💾 GAMESTATE API

```gdscript
# Añadir item
GameState.add_item("destornillador")

# Verificar item
if GameState.has_item("fusible"):
    # ...

# Usar/consumir item
GameState.use_item("fusible")

# Mostrar mensaje
GameState.say("¡Has escapado!")

# Flags
GameState.flags.power_on = true
GameState.flags.door_unlocked = true
GameState.flags.vent_opened = true

# Inventario
print(GameState.inventory)  # {"destornillador": 1, "fusible": 1}
```

---

## 🎮 PLAYER API

```gdscript
# Velocidad
speed: float = 5.0

# Sensibilidad mouse
mouse_sensitivity: float = 0.002

# RayCast
raycast.is_colliding()      # ¿Detecta algo?
raycast.get_collider()      # Objeto detectado
```

---

## 🔍 DEBUG COMMANDS

```
F4  → Output/Console (ver prints)
F5  → Play
F6  → Play escena actual
F8  → Debug collisions (ver raycast y shapes)
```

---

## 📊 ESTRUCTURA DE NODOS (Main.tscn)

```
Main (Node3D)
├── Environment
│   ├── DirectionalLight3D
│   └── WorldEnvironment
├── Room
│   ├── Floor (CSGBox3D)
│   ├── Ceiling (CSGBox3D)
│   └── Walls (4x CSGBox3D)
├── Interactables
│   ├── Screwdriver (StaticBody3D + Pickup.gd)
│   ├── Vent (StaticBody3D + Vent.gd)
│   ├── FuseItem (StaticBody3D + Pickup.gd)
│   ├── FuseBox (StaticBody3D + FuseBox.gd)
│   ├── Note (StaticBody3D + Note.gd)
│   ├── Keypad (StaticBody3D + Keypad.gd)
│   └── Door (StaticBody3D + Door.gd)
├── Player (CharacterBody3D + Player.gd)
│   ├── CollisionShape3D (Capsule)
│   └── Camera3D
│       └── RayCast3D (3m forward)
└── UI
    ├── HUD (CanvasLayer)
    └── KeypadPrompt (CanvasLayer)
```

---

## 🔧 COMANDOS DE GODOT

```gdscript
# Cambiar escena
get_tree().change_scene_to_file("res://scenes/Corridor.tscn")

# Destruir nodo
queue_free()

# Esperar
await get_tree().create_timer(1.0).timeout

# Mouse
Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

# Input
Input.get_vector("left", "right", "forward", "back")
event.is_action_pressed("interact")
```

---

## 📝 SCRIPT TEMPLATES

### Objeto recogible:
```gdscript
extends StaticBody3D

@export var item_name: String = "item"

func interact() -> void:
    GameState.add_item(item_name)
    queue_free()
```

### Objeto que usa item:
```gdscript
extends StaticBody3D

func interact() -> void:
    if GameState.has_item("llave"):
        GameState.use_item("llave")
        # Hacer algo
    else:
        GameState.say("Necesitas una llave")
```

### Objeto con flag:
```gdscript
extends StaticBody3D

func interact() -> void:
    if GameState.flags.poder_especial:
        # Hacer algo
    else:
        GameState.say("No tienes el poder necesario")
```

---

## 🌐 RECURSOS RÁPIDOS

```
Kenney Assets:     https://kenney.nl/
OpenGameArt:       https://opengameart.org/
Freesound CC0:     https://freesound.org/
Godot Docs:        https://docs.godotengine.org/

UI Pack:           https://kenney.nl/assets/ui-pack
Game Icons:        https://kenney.nl/assets/game-icons
Interface Sounds:  https://kenney.nl/assets/interface-sounds
```

---

## ⚠️ ERRORES COMUNES

```
"GameState not declared"
→ Autoload no configurado

"No puedo moverme"
→ Input Map no configurado

"E no funciona"
→ RayCast no enabled O Collision Layer incorrecto

"Popup no aparece"
→ keypad_prompt no asignado

"Código incorrecto"
→ Verifica que sea exactamente "4729"
```

---

## 🎯 VALORES POR DEFECTO

```
Tamaño habitación:  10x5x10 (ancho x alto x profundo)
Velocidad jugador:  5 m/s
Alcance raycast:    3 metros
Altura jugador:     2 metros (cápsula)
Altura cámara:      0.6 metros (desde pies)
Código correcto:    "4729"
Gravedad:           Automática (ProjectSettings)
```

---

## 📐 TAMAÑOS DE OBJETOS

```
Destornillador:  0.3 x 0.3 x 1 (cilindro)
Fusible:         0.2 x 0.5 x 0.2 (cilindro)
Rejilla:         1 x 0.5 x 1 (caja)
Cuadro:          0.8 x 1 x 0.3 (caja)
Nota:            0.8 x 0.01 x 0.6 (caja plana)
Teclado:         0.5 x 0.5 x 0.1 (caja)
Puerta:          2 x 3 x 0.2 (caja)
```

---

## 🔄 FLUJO DE FLAGS

```
1. power_on = false        (inicio)
2. Instalar fusible → power_on = true
3. door_unlocked = false   (inicio)
4. Código correcto → door_unlocked = true
5. vent_opened = false     (inicio)
6. Abrir rejilla → vent_opened = true
```

---

## 💡 TIPS RÁPIDOS

- Usa F8 para ver collisions mientras desarrollas
- Los mensajes siempre se imprimen en Output (F4)
- GameState.inventory es un Dictionary simple
- El código funciona sin assets visuales
- CSG boxes tienen colisiones automáticas (use_collision = true)
- Los StaticBody3D no se mueven
- El CharacterBody3D necesita move_and_slide()

---

## 🚀 COMANDOS ÚTILES

```gdscript
# Recargar escena actual
get_tree().reload_current_scene()

# Salir del juego
get_tree().quit()

# Pausar
get_tree().paused = true

# Obtener delta
func _physics_process(delta: float):
    # delta = tiempo desde último frame

# Print formateado
print("Pos: %v, Rot: %v" % [position, rotation])
```

---

**Imprime esta página para tenerla a mano mientras desarrollas!** 📄
