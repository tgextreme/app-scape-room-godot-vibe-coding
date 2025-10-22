# CONFIGURACIÓN RÁPIDA DE MAIN.TSCN

Si Main.tscn tiene errores al abrirlo, sigue estos pasos para recrearlo:

## PASO 1: Crear escena base

1. Abre Godot 4
2. Scene → New Scene → Other Node → Node3D
3. Renombra a "Main"
4. Guarda como `res://scenes/Main.tscn`

---

## PASO 2: Crear el entorno

### Luz y ambiente:
1. Añade hijo a Main: **DirectionalLight3D**
   - Transform → Rotation: (-45, -45, 0)
   - Shadow Enabled: ✅

2. Añade hijo a Main: **WorldEnvironment**
   - Environment: New Environment
   - Background → Mode: Sky o Color

---

## PASO 3: Crear la habitación (con CSG)

1. Añade hijo a Main: **Node3D** (renombra a "Room")

### Suelo:
2. Añade hijo a Room: **CSGBox3D** (renombra a "Floor")
   - Transform → Position: (0, -0.5, 0)
   - Size: (10, 1, 10)
   - Material: New StandardMaterial3D → Albedo Color: gris oscuro

3. Añade hijo a Floor: **StaticBody3D**
   - Añade hijo: **CollisionShape3D**
     - Shape: New BoxShape3D
     - Size: (10, 1, 10)

### Techo:
4. Añade hijo a Room: **CSGBox3D** (renombra a "Ceiling")
   - Position: (0, 4.5, 0)
   - Size: (10, 1, 10)

### Paredes:
5. Añade 4 hijos CSGBox3D a Room:
   - **WallNorth**: Size (10, 5, 0.5), Position (0, 2, -5)
   - **WallSouth**: Size (10, 5, 0.5), Position (0, 2, 5)
   - **WallEast**: Size (0.5, 5, 10), Position (5, 2, 0)
   - **WallWest**: Size (0.5, 5, 10), Position (-5, 2, 0)

---

## PASO 4: Crear el jugador

1. Añade hijo a Main: **CharacterBody3D** (renombra a "Player")
   - Position: (0, 1, 0)
   - Script: `res://scripts/Player.gd`

2. Añade hijo a Player: **CollisionShape3D**
   - Shape: New CapsuleShape3D
     - Radius: 0.5
     - Height: 2.0

3. Añade hijo a Player: **Camera3D**
   - Position: (0, 0.6, 0)
   - Current: ✅

4. Añade hijo a Camera3D: **RayCast3D**
   - Enabled: ✅
   - Target Position: (0, 0, -3)
   - Collision Mask: Layers 1 y 2

---

## PASO 5: Crear objetos interactivos

1. Añade hijo a Main: **Node3D** (renombra a "Interactables")

### DESTORNILLADOR:
2. Añade hijo a Interactables: **StaticBody3D** (renombra a "Screwdriver")
   - Position: (-3, 0.5, -3)
   - Script: `res://scripts/Pickup.gd`
   - Export var `item_name`: `"destornillador"`
   - Collision Layer: 2

3. Añade hijo a Screwdriver:
   - **MeshInstance3D**: Mesh = New CylinderMesh, Scale (0.3, 0.3, 1)
   - **CollisionShape3D**: Shape = New BoxShape3D, Size (0.5, 0.5, 0.5)

### REJILLA:
4. Añade hijo a Interactables: **StaticBody3D** (renombra a "Vent")
   - Position: (3, 2, -4.8)
   - Script: `res://scripts/Vent.gd`
   - Collision Layer: 2

5. Añade hijo a Vent:
   - **MeshInstance3D**: Mesh = New BoxMesh, Scale (1, 0.5, 1)
   - **CollisionShape3D**: Shape = New BoxShape3D

### FUSIBLE:
6. Añade hijo a Interactables: **StaticBody3D** (renombra a "FuseItem")
   - Position: (3, 1.5, -4.5)
   - Script: `res://scripts/Pickup.gd`
   - Export var `item_name`: `"fusible"`
   - Collision Layer: 2
   - **Visible: ❌ DESACTIVADO** (se revela al abrir rejilla)

7. Añade hijo a FuseItem:
   - **MeshInstance3D**: Mesh = New CylinderMesh, Scale (0.2, 0.5, 0.2)
   - **CollisionShape3D**: Shape = New BoxShape3D

8. **IMPORTANTE**: En Vent, Export var `revealed_node` → Arrastra FuseItem aquí

### CUADRO DE FUSIBLES:
9. Añade hijo a Interactables: **StaticBody3D** (renombra a "FuseBox")
   - Position: (-4.5, 2, 0)
   - Script: `res://scripts/FuseBox.gd`
   - Collision Layer: 2

10. Añade hijo a FuseBox:
    - **MeshInstance3D**: Mesh = New BoxMesh, Scale (0.8, 1, 0.3)
    - **CollisionShape3D**: Shape = New BoxShape3D

### NOTA:
11. Añade hijo a Interactables: **StaticBody3D** (renombra a "Note")
    - Position: (0, 1.5, 3)
    - Script: `res://scripts/Note.gd`
    - Collision Layer: 2

12. Añade hijo a Note:
    - **MeshInstance3D**: Mesh = New BoxMesh, Scale (0.8, 0.01, 0.6)
    - **CollisionShape3D**: Shape = New BoxShape3D

### TECLADO:
13. Añade hijo a Interactables: **StaticBody3D** (renombra a "Keypad")
    - Position: (4.5, 2, 2)
    - Script: `res://scripts/Keypad.gd`
    - Collision Layer: 2

14. Añade hijo a Keypad:
    - **MeshInstance3D**: Mesh = New BoxMesh, Scale (0.5, 0.5, 0.1)
    - **CollisionShape3D**: Shape = New BoxShape3D

### PUERTA:
15. Añade hijo a Interactables: **StaticBody3D** (renombra a "Door")
    - Position: (0, 1.5, 4.8)
    - Script: `res://scripts/Door.gd`
    - Export var `next_scene`: `"res://scenes/Corridor.tscn"`
    - Collision Layer: 2

16. Añade hijo a Door:
    - **MeshInstance3D**: Mesh = New BoxMesh, Scale (2, 3, 0.2)
    - **CollisionShape3D**: Shape = New BoxShape3D

---

## PASO 6: Añadir UI

1. Añade hijo a Main: **Node** (renombra a "UI")

2. Añade hijo a UI: Scene → Instance Child Scene → `res://ui/HUD.tscn`

3. Añade hijo a UI: Scene → Instance Child Scene → `res://ui/KeypadPrompt.tscn`
   - Selecciona KeypadPrompt
   - En Inspector: Visible = ❌ DESACTIVADO

4. **IMPORTANTE**: En Keypad, Export var `keypad_prompt` → Arrastra UI/KeypadPrompt aquí

---

## PASO 7: Verificación final

### Verifica estos NodePaths:
- [ ] Vent.revealed_node → Interactables/FuseItem
- [ ] Keypad.keypad_prompt → UI/KeypadPrompt
- [ ] Door.next_scene = "res://scenes/Corridor.tscn"

### Verifica Export vars:
- [ ] Screwdriver.item_name = "destornillador"
- [ ] FuseItem.item_name = "fusible"

### Verifica visibilidad:
- [ ] FuseItem.visible = ❌ (inicia oculto)
- [ ] KeypadPrompt.visible = ❌ (inicia oculto)

---

## PASO 8: Guardar y testear

1. Scene → Save Scene (Ctrl+S)
2. Presiona F5 para probar
3. Si hay errores, verifica:
   - Autoload configurado (GameState)
   - Input Map configurado
   - Scripts asignados correctamente

---

## MATERIALES OPCIONALES (para mejor visualización)

Añade colores a los objetos para distinguirlos mejor:

1. Selecciona MeshInstance3D del objeto
2. Inspector → Material Override → New StandardMaterial3D
3. Albedo → Color:
   - Destornillador: Amarillo (#FFD700)
   - Fusible: Rojo (#FF0000)
   - Rejilla: Gris claro (#C0C0C0)
   - Cuadro: Negro (#202020)
   - Nota: Amarillo claro (#FFFF99)
   - Teclado: Azul (#4080FF)
   - Puerta: Marrón (#8B4513)

---

¡Listo! Ahora deberías tener una escena Main funcional.
