# CHECKLIST DE CONEXIÓN - ESCAPE ROOM

## ✅ 1. CONFIGURACIÓN INICIAL DE GODOT

### Autoload:
- [ ] Project → Project Settings → Autoload
- [ ] Añadir `res://scripts/GameState.gd` como `GameState`

### Input Map:
- [ ] Project → Project Settings → Input Map
- [ ] Crear acciones:
  - `move_forward` → W
  - `move_back` → S
  - `move_left` → A
  - `move_right` → D
  - `interact` → E

---

## ✅ 2. ESTRUCTURA DE CARPETAS

```
res://
├── scenes/
│   ├── Main.tscn ✅
│   └── Corridor.tscn ✅
├── scripts/
│   ├── GameState.gd ✅
│   ├── Player.gd ✅
│   ├── Pickup.gd ✅
│   ├── Vent.gd ✅
│   ├── FuseBox.gd ✅
│   ├── Note.gd ✅
│   ├── Keypad.gd ✅
│   └── Door.gd ✅
├── ui/
│   ├── KeypadPrompt.tscn ✅
│   ├── KeypadPrompt.gd ✅
│   ├── HUD.tscn ✅
│   └── HUD.gd ✅
└── assets/
    ├── props/
    ├── ui/
    └── sfx/
```

---

## ✅ 3. CONFIGURACIÓN DE NODOS EN MAIN.TSCN

### A. PLAYER (CharacterBody3D)
- [ ] Script: `res://scripts/Player.gd`
- [ ] Collision Layer: 1
- [ ] Collision Mask: 1
- [ ] Hijo: **CollisionShape3D** → Shape: CapsuleShape3D (radius: 0.5, height: 2.0)
- [ ] Hijo: **Camera3D** 
  - Position: (0, 0.6, 0)
  - Current: ✅ Activado
  - [ ] Hijo: **RayCast3D**
    - Enabled: ✅
    - Target Position: (0, 0, -3)
    - Collision Mask: Layers 1 y 2
    - Collide With Bodies: ✅

---

### B. INTERACTABLES

#### 🔧 Screwdriver (StaticBody3D)
- [ ] Script: `res://scripts/Pickup.gd`
- [ ] Export var `item_name`: `"destornillador"`
- [ ] Collision Layer: 2
- [ ] Hijo: **MeshInstance3D** → Mesh: CylinderMesh (escala 0.3, 0.3, 1)
- [ ] Hijo: **CollisionShape3D** → Shape: BoxShape3D
- [ ] Position sugerida: (-3, 0.5, -3)

#### 🪟 Vent (StaticBody3D) - Rejilla
- [ ] Script: `res://scripts/Vent.gd`
- [ ] Export var `revealed_node`: **ARRASTRA** el nodo `FuseItem` aquí
- [ ] Collision Layer: 2
- [ ] Hijo: **MeshInstance3D** → Mesh: BoxMesh (escala 1, 0.5, 1)
- [ ] Hijo: **CollisionShape3D** → Shape: BoxShape3D
- [ ] Position sugerida: (3, 2, -4.8)

#### ⚡ FuseItem (StaticBody3D) - Fusible
- [ ] Script: `res://scripts/Pickup.gd`
- [ ] Export var `item_name`: `"fusible"`
- [ ] Collision Layer: 2
- [ ] Hijo: **MeshInstance3D** → Mesh: CylinderMesh (escala 0.2, 0.5, 0.2)
- [ ] Hijo: **CollisionShape3D** → Shape: BoxShape3D
- [ ] Position sugerida: (3, 1.5, -4.5)
- [ ] **IMPORTANTE**: Este nodo debe estar inicialmente INVISIBLE (se revela al abrir Vent)

#### 📦 FuseBox (StaticBody3D) - Cuadro de fusibles
- [ ] Script: `res://scripts/FuseBox.gd`
- [ ] Collision Layer: 2
- [ ] Hijo: **MeshInstance3D** → Mesh: BoxMesh (escala 0.8, 1, 0.3)
- [ ] Hijo: **CollisionShape3D** → Shape: BoxShape3D
- [ ] Position sugerida: (-4.5, 2, 0)

#### 📝 Note (StaticBody3D) - Nota
- [ ] Script: `res://scripts/Note.gd`
- [ ] Export var `note_text`: (Ya configurado en el script)
- [ ] Collision Layer: 2
- [ ] Hijo: **MeshInstance3D** → Mesh: BoxMesh (escala 0.8, 0.01, 0.6)
- [ ] Hijo: **CollisionShape3D** → Shape: BoxShape3D
- [ ] Position sugerida: (0, 1.5, 3)
- [ ] Rotation: (0, 90, 0) para que esté de pie

#### 🔢 Keypad (StaticBody3D) - Teclado
- [ ] Script: `res://scripts/Keypad.gd`
- [ ] Export var `keypad_prompt`: **ARRASTRA** el nodo `UI/KeypadPrompt` aquí
- [ ] Collision Layer: 2
- [ ] Hijo: **MeshInstance3D** → Mesh: BoxMesh (escala 0.5, 0.5, 0.1)
- [ ] Hijo: **CollisionShape3D** → Shape: BoxShape3D
- [ ] Position sugerida: (4.5, 2, 2)

#### 🚪 Door (StaticBody3D) - Puerta
- [ ] Script: `res://scripts/Door.gd`
- [ ] Export var `next_scene`: `"res://scenes/Corridor.tscn"`
- [ ] Collision Layer: 2
- [ ] Hijo: **MeshInstance3D** → Mesh: BoxMesh (escala 2, 3, 0.2)
- [ ] Hijo: **CollisionShape3D** → Shape: BoxShape3D
- [ ] Position sugerida: (0, 1.5, 4.8)

---

### C. HABITACIÓN (Room)

#### Floor (Suelo)
- [ ] Nodo: **CSGBox3D**
- [ ] Size: (10, 1, 10)
- [ ] Position: (0, -0.5, 0)
- [ ] Material: StandardMaterial3D, Color gris oscuro (#404040)
- [ ] Hijo: **StaticBody3D**
  - [ ] Hijo: **CollisionShape3D** → BoxShape3D

#### Ceiling (Techo)
- [ ] Nodo: **CSGBox3D**
- [ ] Size: (10, 1, 10)
- [ ] Position: (0, 4.5, 0)

#### Paredes (WallNorth, WallSouth, WallEast, WallWest)
- [ ] **WallNorth**: Size (10, 5, 0.5), Position (0, 2, -5)
- [ ] **WallSouth**: Size (10, 5, 0.5), Position (0, 2, 5)
- [ ] **WallEast**: Size (0.5, 5, 10), Position (5, 2, 0)
- [ ] **WallWest**: Size (0.5, 5, 10), Position (-5, 2, 0)
- [ ] Material: StandardMaterial3D, Color gris (#808080)

---

### D. UI

#### HUD
- [ ] Nodo: **CanvasLayer** (instancia de `ui/HUD.tscn`)
- [ ] Script: Ya asignado automáticamente
- [ ] Verificar que `MessageLabel` e `InventoryLabel` existen

#### KeypadPrompt
- [ ] Nodo: **CanvasLayer** (instancia de `ui/KeypadPrompt.tscn`)
- [ ] Script: Ya asignado automáticamente
- [ ] Propiedad `visible`: DESACTIVADO (empieza oculto)

---

## ✅ 4. VERIFICACIÓN DE EXPORT VARIABLES

Verifica que estas variables exportadas estén correctamente asignadas:

### Pickup.gd (2 instancias):
- [ ] `Screwdriver.item_name` = `"destornillador"`
- [ ] `FuseItem.item_name` = `"fusible"`

### Vent.gd:
- [ ] `Vent.revealed_node` → **NodePath** a `Interactables/FuseItem`

### Keypad.gd:
- [ ] `Keypad.keypad_prompt` → **NodePath** a `UI/KeypadPrompt`

### Door.gd:
- [ ] `Door.next_scene` = `"res://scenes/Corridor.tscn"`

---

## ✅ 5. COLLISION LAYERS

### Configuración recomendada:

- **Layer 1**: Jugador y entorno (suelo, paredes)
- **Layer 2**: Objetos interactivos

### Aplicar:
- [ ] **Player**: Collision Layer 1, Collision Mask 1
- [ ] **Suelo/Paredes**: Collision Layer 1
- [ ] **Todos los interactivos**: Collision Layer 2
- [ ] **RayCast3D**: Collision Mask Layers 1 y 2

---

## ✅ 6. TESTEO PASO A PASO

### Test 1: Movimiento básico
- [ ] Presiona F5
- [ ] WASD mueve al jugador
- [ ] Mouse mira alrededor
- [ ] ESC libera/captura el mouse

### Test 2: Recoger destornillador
- [ ] Acércate al destornillador (cubo amarillo)
- [ ] Presiona E
- [ ] Debe desaparecer
- [ ] Inventario muestra "destornillador x1"

### Test 3: Abrir rejilla
- [ ] Ve a la rejilla (pared norte, arriba)
- [ ] Presiona E
- [ ] Mensaje: "Usas el destornillador..."
- [ ] Aparece el fusible

### Test 4: Recoger fusible
- [ ] Presiona E cerca del fusible
- [ ] Debe desaparecer
- [ ] Inventario muestra "fusible x1"

### Test 5: Activar energía
- [ ] Ve al cuadro de fusibles (pared oeste)
- [ ] Presiona E
- [ ] Mensaje: "¡Has instalado el fusible! La energía está activada"

### Test 6: Leer nota
- [ ] Ve a la nota (pared sur)
- [ ] Presiona E
- [ ] Mensaje con pista César +2, código 2507 → 4729

### Test 7: Teclado (antes de energía)
- [ ] Ve al teclado (pared este)
- [ ] Si presionas E antes de activar energía:
  - Mensaje: "El teclado no tiene energía"

### Test 8: Teclado (después de energía)
- [ ] Presiona E en el teclado
- [ ] Se abre popup con LineEdit
- [ ] Escribe "4729"
- [ ] Presiona ACEPTAR
- [ ] Mensaje: "¡CÓDIGO CORRECTO! La puerta se ha desbloqueado"

### Test 9: Abrir puerta
- [ ] Ve a la puerta (pared sur, centro)
- [ ] Presiona E
- [ ] Mensaje: "¡La puerta se abre! ¡Has escapado!"
- [ ] Cambia a escena Corridor (o mensaje de victoria)

---

## ✅ 7. DEBUGGING

Si algo no funciona:

### Ver Output:
- [ ] Presiona F4 para ver la consola Output
- [ ] Verifica mensajes de `print()` y `say()`

### Verificar GameState:
- [ ] En consola, verifica: "GameState initialized"
- [ ] Al recoger items: "Inventory: {destornillador: 1}"
- [ ] Al activar flags: "flags.power_on = true"

### Verificar RayCast:
- [ ] Si no interactúa: Verifica que RayCast3D esté Enabled
- [ ] Verifica que los objetos tengan StaticBody3D
- [ ] Verifica Collision Mask del raycast

---

## ✅ 8. MATERIALES Y COLORES (OPCIONAL)

Para hacer los objetos más visibles:

### Colores sugeridos:
- [ ] **Destornillador**: Amarillo (#FFD700)
- [ ] **Fusible**: Rojo (#FF0000)
- [ ] **Rejilla**: Gris metálico (#C0C0C0)
- [ ] **Cuadro de fusibles**: Negro (#202020)
- [ ] **Nota**: Amarillo claro (#FFFF99)
- [ ] **Teclado**: Azul (#4080FF)
- [ ] **Puerta**: Marrón (#8B4513)

### Aplicar:
1. Selecciona el MeshInstance3D del objeto
2. En Inspector → Material Override → New StandardMaterial3D
3. Albedo → Color → Elige el color

---

## ✅ 9. ASSETS VISUALES (OPCIONAL)

Si quieres añadir sprites/texturas:

### Descargar:
- [ ] Kenney UI Pack: https://kenney.nl/assets/ui-pack
- [ ] Kenney Game Icons: https://kenney.nl/assets/game-icons
- [ ] OpenGameArt Props: https://opengameart.org/

### Importar:
1. Coloca PNG en `res://assets/props/` o `res://assets/ui/`
2. En el MeshInstance3D → Material → Albedo Texture → Carga el PNG
3. O crea Sprite3D con el PNG

---

## 🎉 COMPLETADO

Si todos los tests pasan, ¡el escape room está funcional!

### Próximos pasos opcionales:
- [ ] Añadir modelos 3D
- [ ] Añadir texturas
- [ ] Añadir sonidos (Kenney Interface Sounds)
- [ ] Añadir iluminación ambiente
- [ ] Añadir partículas para efectos
- [ ] Mejorar UI del teclado con botones numéricos

---

**Tiempo estimado de configuración**: 15-30 minutos
**Tiempo de test completo**: 2 minutos
