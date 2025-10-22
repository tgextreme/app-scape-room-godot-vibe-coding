# 🔧 TROUBLESHOOTING - SOLUCIÓN DE PROBLEMAS

## 🚨 PROBLEMAS COMUNES Y SOLUCIONES

### ❌ Error: "Identifier 'GameState' not declared"

**Causa**: GameState no está configurado como Autoload.

**Solución**:
1. Cierra Godot completamente
2. Abre el proyecto de nuevo
3. Ve a Project → Project Settings → Autoload
4. Verifica que `GameState` aparece en la lista con ruta `res://scripts/GameState.gd`
5. Si no está, añádelo manualmente:
   - Path: `res://scripts/GameState.gd`
   - Node Name: `GameState`
   - Enable: ✅
   - Click "Add"

**Alternativa**: El `project.godot` ya tiene la configuración, pero a veces Godot necesita recargar:
- Editor → Reload Current Project

---

### ❌ No puedo moverme con WASD

**Causa**: Input Map no está configurado.

**Solución**:
1. Project → Project Settings → Input Map
2. Verifica que existen estas acciones:
   - `move_forward` → W (Physical Keycode: 87)
   - `move_back` → S (Physical Keycode: 83)
   - `move_left` → A (Physical Keycode: 65)
   - `move_right` → D (Physical Keycode: 68)
   - `interact` → E (Physical Keycode: 69)

**Si no existen**, el `project.godot` debería tenerlas. Intenta:
- Cerrar y reabrir Godot
- O añádelas manualmente en Input Map

---

### ❌ No puedo mirar alrededor con el mouse

**Causa**: El mouse no está capturado.

**Solución**:
- Haz click en la ventana del juego para capturar el mouse
- O presiona ESC dos veces (libera y vuelve a capturar)

**Verificación**: En `Player.gd`, línea 18:
```gdscript
Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
```

Si ves el cursor → mouse no capturado
Si no ves cursor → mouse capturado ✅

---

### ❌ Presiono E y no pasa nada

**Múltiples causas posibles**:

#### Causa 1: RayCast no está detectando
**Verificación**:
1. Presiona F8 mientras juegas
2. Verás las collision shapes y el raycast (línea roja/verde)
3. El raycast debe cambiar de color al apuntar a un objeto

**Solución**:
- Ve a Player → Camera3D → RayCast3D
- Enabled: ✅ (debe estar activado)
- Target Position: (0, 0, -3)
- Collision Mask: Layers 1 y 2 ✅

#### Causa 2: Objetos no tienen collision layer correcto
**Solución**:
- Todos los objetos interactivos deben ser **StaticBody3D**
- Collision Layer: **2** (no 1)
- Deben tener un hijo **CollisionShape3D** con una forma asignada

#### Causa 3: Objetos no tienen método interact()
**Verificación**:
- Cada objeto interactivo debe tener un script asignado
- El script debe tener la función: `func interact() -> void:`

#### Causa 4: Estás muy lejos del objeto
**Solución**:
- El raycast solo detecta a 3 metros
- Acércate más al objeto

---

### ❌ Error al abrir Main.tscn o Corridor.tscn

**Causa**: Referencias de escenas o UIDs incorrectos.

**Solución 1**: Reimportar escenas
1. Cierra Godot
2. Borra la carpeta `.godot/` (carpeta oculta en el proyecto)
3. Abre Godot de nuevo
4. Espera a que reimporte todo

**Solución 2**: Recrear Main.tscn manualmente
- Sigue la guía en **COMO_CREAR_MAIN.md**

---

### ❌ El fusible no aparece después de abrir la rejilla

**Causa**: Export variable `revealed_node` no está configurada.

**Solución**:
1. Abre Main.tscn
2. Selecciona el nodo `Vent`
3. En Inspector, busca la propiedad `Revealed Node`
4. Arrastra el nodo `FuseItem` a esa propiedad
5. Guarda la escena (Ctrl+S)

**Verificación**: La propiedad debe mostrar: `NodePath("../FuseItem")`

---

### ❌ El popup del teclado no aparece

**Causa 1**: Export variable `keypad_prompt` no configurada.

**Solución**:
1. Abre Main.tscn
2. Selecciona el nodo `Keypad`
3. En Inspector, busca `Keypad Prompt`
4. Arrastra el nodo `UI/KeypadPrompt` a esa propiedad
5. Guarda

**Causa 2**: KeypadPrompt está visible desde inicio.

**Solución**:
1. Selecciona el nodo `UI/KeypadPrompt`
2. En Inspector: Visible = ❌ (desactivado)
3. Solo debe mostrarse al interactuar con el teclado

---

### ❌ El teclado dice "no tiene energía" aunque instalé el fusible

**Causa**: Flag `power_on` no se activó.

**Verificación**:
1. Presiona F4 para ver Output
2. Busca el mensaje: "¡Has instalado el fusible! La energía está activada"
3. Debe aparecer al interactuar con FuseBox

**Solución**:
- Verifica que FuseBox tiene el script `FuseBox.gd`
- Verifica que tienes el fusible en inventario (Output debe mostrar "Inventory: {fusible: 1}")
- Intenta recoger el fusible de nuevo e instalarlo

---

### ❌ Introduzco 4729 y dice "código incorrecto"

**Causas posibles**:

#### Causa 1: Espacios en el código
**Solución**: Introduce solo los números, sin espacios: `4729`

#### Causa 2: El LineEdit tiene caracteres invisibles
**Solución**: 
- Borra todo con Backspace
- Escribe de nuevo: `4729`
- Presiona Enter o click en ACEPTAR

#### Causa 3: El código está mal escrito en el script
**Verificación**: En `Keypad.gd`, línea 7:
```gdscript
const CORRECT_CODE: String = "4729"
```

---

### ❌ La puerta dice "está cerrada" aunque introduje el código

**Causa**: Flag `door_unlocked` no se activó.

**Verificación**:
1. Busca en Output: "¡CÓDIGO CORRECTO! La puerta se ha desbloqueado"
2. Si no aparece, el código no fue aceptado

**Solución**:
- Vuelve al teclado
- Introduce `4729` de nuevo
- Espera el mensaje de confirmación

---

### ❌ La puerta se abre pero no pasa nada

**Causa**: `next_scene` no está configurado o no existe.

**Solución**:
1. Selecciona el nodo `Door`
2. En Inspector, verifica: `Next Scene` = `"res://scenes/Corridor.tscn"`
3. Verifica que `Corridor.tscn` existe en la carpeta scenes

**Alternativa**: Si no quieres segunda escena:
- Edita `Door.gd`, línea 8-16
- Comenta la línea del `change_scene_to_file()`
- Deja solo el mensaje "¡Has escapado!"

---

### ❌ El inventario no se muestra en pantalla

**Causa**: HUD no está conectado a GameState.

**Verificación**:
1. Abre Main.tscn
2. Verifica que existe `UI/HUD`
3. El HUD debe ser una instancia de `ui/HUD.tscn`

**Solución**: El HUD se conecta automáticamente en `_ready()`. Verifica Output:
- Debe aparecer: "GameState initialized"
- Si no aparece, GameState no está como Autoload

---

### ❌ Los mensajes no se muestran en pantalla

**Causa**: El Label del HUD no está configurado.

**Solución**:
1. Abre `ui/HUD.tscn`
2. Verifica que existe `MessageLabel`
3. Debe tener @onready en `HUD.gd`:
```gdscript
@onready var message_label: Label = $MessageLabel
```

**Alternativa**: Los mensajes siempre se imprimen en Output (F4). Usa eso si el HUD falla.

---

### ❌ Error: "Invalid get index 'xxx' on base 'null instance'"

**Causa**: Un nodo @onready no existe en la escena.

**Ejemplo**:
```
Invalid get index 'text' on base 'null instance'
```

**Solución**:
1. Identifica qué script tiene el error (en Output)
2. Busca las líneas @onready
3. Verifica que esos nodos existen en la escena

**Común**: 
- `@onready var message_label: Label = $MessageLabel`
- Si falla → no existe un nodo llamado `MessageLabel` como hijo directo

---

### ❌ El juego va muy lento / FPS bajos

**Causas**:

#### Causa 1: Demasiadas sombras
**Solución**: 
- Selecciona DirectionalLight3D
- Shadow Enabled: ❌ (desactivar)

#### Causa 2: CSG con demasiado detalle
**Solución**: Los CSG son simples, no debería ser problema. Si lo es:
- Reduce el tamaño de la habitación
- O reemplaza CSG con modelos estáticos

---

### ❌ Error: "Scene file 'xxx.tscn' appears to be invalid"

**Causa**: El archivo .tscn está corrupto o tiene errores de sintaxis.

**Solución**:
1. Abre el .tscn en un editor de texto
2. Verifica que no hay caracteres extraños
3. Si está muy mal, sigue COMO_CREAR_MAIN.md para recrearlo

**Prevención**: Siempre guarda con Ctrl+S, no cierres Godot abruptamente.

---

### ❌ Warning: "Node not found: xxx"

**Causa**: Un NodePath apunta a un nodo que no existe.

**Ejemplo**: `revealed_node = NodePath("../FuseItem")`

**Solución**:
1. Verifica que el nodo existe en la escena
2. Verifica que el path es correcto
3. Si Vent está en `Interactables/Vent` y FuseItem en `Interactables/FuseItem`:
   - Path correcto: `"../FuseItem"` (un nivel arriba, luego FuseItem)

---

### ❌ El raycast detecta las paredes en lugar de los objetos

**Causa**: Las paredes están en Collision Layer 2.

**Solución**:
- Las paredes (Floor, Walls) deben estar en **Layer 1**
- Los objetos interactivos en **Layer 2**
- El raycast debe tener Collision Mask = Layers 1 y 2

---

### ❌ No puedo recoger el destornillador

**Verificación paso a paso**:
1. ¿Ves el destornillador? (cubo amarillo en -3, 0.5, -3)
2. ¿Puedes acercarte? (debería estar en el suelo)
3. ¿Apuntas con la cámara? (debe estar en el centro de tu vista)
4. ¿Está a menos de 3 metros? (acércate más)
5. ¿Presionas E? (no otro botón)

**Si nada funciona**:
- F8 para ver debug
- Verifica que Screwdriver tiene StaticBody3D + CollisionShape3D
- Verifica que tiene script Pickup.gd
- Verifica Output al presionar E (debe decir algo)

---

## 🐛 DEBUG TOOLS

### Ver Output/Console:
**F4** - Ver todos los print() y mensajes de error

### Ver Collisions:
**F8** - Mostrar collision shapes y raycast en tiempo real

### Ver Scene Tree en runtime:
**Remote tab** - Ver la escena mientras se ejecuta el juego

### Ver variables de GameState:
En `GameState.gd`, añade al final de funciones:
```gdscript
print("Inventory:", inventory)
print("Flags:", flags)
```

### Modo de debug para interacciones:
En `Player.gd`, línea 59, cambia:
```gdscript
func _try_interact() -> void:
    print("=== TRYING TO INTERACT ===")
    if raycast.is_colliding():
        var collider = raycast.get_collider()
        print("Collider:", collider)
        print("Has interact?:", collider.has_method("interact"))
        if collider and collider.has_method("interact"):
            collider.interact()
        else:
            print("NO INTERACT METHOD")
    else:
        print("RAYCAST NOT COLLIDING")
```

---

## 📞 ÚLTIMO RECURSO

Si nada funciona:

1. **Verifica versión de Godot**: Debe ser Godot 4.x (no 3.x)
2. **Recrea el proyecto**:
   - Copia todos los archivos .gd
   - Crea nuevo proyecto Godot 4
   - Copia scripts de vuelta
   - Sigue COMO_CREAR_MAIN.md
3. **Usa el Plan B** (ver INSTRUCCIONES_COMPLETAS.md):
   - Simplifica el juego eliminando la rejilla
   - Deja el fusible visible desde inicio
   - Autodesbloqueea la puerta con energía

---

## ✅ VERIFICACIÓN FINAL

Si todo funciona correctamente, debes poder:

1. ✅ Moverte con WASD
2. ✅ Mirar con mouse
3. ✅ Ver mensajes en pantalla (arriba centro)
4. ✅ Ver inventario en pantalla (abajo izquierda)
5. ✅ Recoger destornillador con E
6. ✅ Abrir rejilla con E (consume destornillador)
7. ✅ Ver fusible aparecer
8. ✅ Recoger fusible con E
9. ✅ Instalar fusible en cuadro con E
10. ✅ Leer nota con E
11. ✅ Abrir teclado con E (popup aparece)
12. ✅ Introducir 4729 y presionar ACEPTAR
13. ✅ Abrir puerta con E
14. ✅ Cambiar a escena Corridor

**Si alguno falla, revisa la sección correspondiente arriba.**

---

**¿Aún tienes problemas? Revisa Output (F4) para mensajes de error específicos!**
