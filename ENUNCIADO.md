
---

## ENUNCIADO PARA CLAUDE (copiar/pegar)

Quiero que me prepares un **proyecto base de Godot 4 (3D)** para un **escape room** sencillo, orientado a hacer un directo “**vibe coding**” sin postureo (arte gris, todo minimalista). Dame **instrucciones paso a paso**, **estructura de carpetas**, **escenas**, **scripts GDScript** y una **lista de ítems/recursos para descargar (CC0 o gratis uso comercial)**.

### Objetivo del prototipo (debe quedar jugable)

* 1 habitación 3D con: **puerta**, **rejilla**, **cajón/objeto para recoger**, **cuadro de fusibles**, **nota/PC**, **teclado numérico**.
* Inventario textual muy simple (o traza en consola/HUD).
* Puzzles encadenados:

  1. Recoger **destornillador** y **fusible**.
  2. Colocar **fusible** → **activar energía**.
  3. Introducir **código 4729** en un teclado → **desbloquear puerta** → pasar a **escena final**.

### Entregables

1. **Estructura de proyecto** con nombres exactos de archivos y carpetas.
2. **Escenas Godot** y **scripts GDScript** completos y listos para pegar.
3. **Checklist de conexión** (qué script va en qué nodo, a qué NodePath arrastrar, etc.).
4. **Lista de recursos a descargar** (3 opciones por ítem, todas CC0/gratis uso comercial), indicando: nombre, formato recomendado (PNG/SVG/WAV/OGG), tamaño/resolución sugerida y por qué sirve.
5. **Guía “paso a paso”** para:

   * Crear el **Input Map** (WASD + “E” interact).
   * Configurar un **Autoload** `GameState.gd`.
   * Montar la **UI del teclado** con un **Popup** (LineEdit + OK).
   * Hacer los **RayCast3D** de interacción y colisiones básicas.
6. **Pruebas/criterios de aceptación** (lista corta verificable en 2 minutos).
7. **Plan B** si voy justo de tiempo (simplificaciones seguras).
¡Hecho! Aquí tienes un set de **assets CC0 / Pixabay License** (uso comercial, sin atribución obligatoria) para todos los ítems del escape room. Descárgalos como **PNG/SVG** y listo para importarlos en Wintermute.

### Objetos interactivos (inventario / escena)

* **Destornillador** (vector): [https://pixabay.com/vectors/screwdriver-screw-driver-tool-29367/](https://pixabay.com/vectors/screwdriver-screw-driver-tool-29367/) ([Pixabay][1])
* **Fusible** (icono/vector): [https://pixabay.com/vectors/electric-fuse-fuse-high-voltage-155785/](https://pixabay.com/vectors/electric-fuse-fuse-high-voltage-155785/) ([Pixabay][2])
* **Tarjeta/RFID (key card)** (pixel/2D): [https://opengameart.org/content/keycredit-cards](https://opengameart.org/content/keycredit-cards) ([OpenGameArt.org][3])
* **Nota adhesiva** (textura PNG grande): [https://opengameart.org/content/free-note-texture-notepng](https://opengameart.org/content/free-note-texture-notepng) ([OpenGameArt.org][4])

### Elementos del entorno (fondos/props)

* **Rejilla de ventilación** (incluye PNG 2D): [https://opengameart.org/content/office-air-vent](https://opengameart.org/content/office-air-vent) ([OpenGameArt.org][5])
* **Panel eléctrico / cuadro de control** (vector): [https://pixabay.com/vectors/control-panel-control-panel-4782826/](https://pixabay.com/vectors/control-panel-control-panel-4782826/) ([Pixabay][6])
* **Puerta Sci-Fi** (sprite): [https://opengameart.org/content/scifi-door-sprite](https://opengameart.org/content/scifi-door-sprite) ([OpenGameArt.org][7])
* **Monitor/PC** (vector): [https://pixabay.com/vectors/lcd-monitor-computer-32872/](https://pixabay.com/vectors/lcd-monitor-computer-32872/) ([Pixabay][8])

### UI para el candado/teclado y menús (botones, paneles)

* **UI Pack (botones, paneles, sliders…)**: [https://kenney.nl/assets/ui-pack](https://kenney.nl/assets/ui-pack) ([kenney.nl][9])
* **UI Pack – Sci-Fi (estética futurista, ideal para el teclado)**: [https://kenney.nl/assets/ui-pack-sci-fi](https://kenney.nl/assets/ui-pack-sci-fi) ([kenney.nl][10])
* **Teclado numérico (vector base si lo prefieres ya hecho)**: [https://pixabay.com/vectors/keypad-numbers-keyboard-access-146161/](https://pixabay.com/vectors/keypad-numbers-keyboard-access-146161/) ([Pixabay][11])

### Ambientación industrial opcional (paredes, metal, rejillas, etc.)

* **Platformer Pack Industrial (tiles/props metálicos)**: [https://kenney.nl/assets/platformer-pack-industrial](https://kenney.nl/assets/platformer-pack-industrial) ([kenney.nl][12])

> Nota rápida: Kenney y OpenGameArt en estos enlaces son **CC0**; Pixabay usa su **Pixabay License** (también permite uso comercial sin atribución). Si quieres, te dejo también un mini pack de **sonidos de interfaz** para botones/teclado: [https://kenney.nl/assets/interface-sounds](https://kenney.nl/assets/interface-sounds) ([kenney.nl][13])

¿Quieres que te deje todo esto ya normalizado a 64×64/128×128 PNG transparente para meterlo en el inventario de Wintermute?

[1]: https://pixabay.com/vectors/screwdriver-screw-driver-tool-29367/?utm_source=chatgpt.com "Download Screwdriver, Screw, Driver. Royalty-Free Vector ..."
[2]: https://pixabay.com/vectors/electric-fuse-fuse-high-voltage-155785/?utm_source=chatgpt.com "Free electric fuse fuse high voltage vector"
[3]: https://opengameart.org/content/keycredit-cards?utm_source=chatgpt.com "Key/Credit Cards"
[4]: https://opengameart.org/content/free-note-texture-notepng?utm_source=chatgpt.com "Free Note Texture - Note.png"
[5]: https://opengameart.org/content/office-air-vent "Office Air Vent | OpenGameArt.org"
[6]: https://pixabay.com/vectors/control-panel-control-panel-4782826/?utm_source=chatgpt.com "Control Panel, Control, Panel royalty-free vector graphic. ..."
[7]: https://opengameart.org/content/scifi-door-sprite?utm_source=chatgpt.com "Scifi Door sprite"
[8]: https://pixabay.com/vectors/lcd-monitor-computer-32872/?utm_source=chatgpt.com "Free lcd monitor computer vector - Pixabay"
[9]: https://kenney.nl/assets/ui-pack?utm_source=chatgpt.com "UI Pack"
[10]: https://kenney.nl/assets/ui-pack-sci-fi?utm_source=chatgpt.com "UI Pack - Sci-Fi"
[11]: https://pixabay.com/vectors/keypad-numbers-keyboard-access-146161/?utm_source=chatgpt.com "Free keypad numbers keyboard vector"
[12]: https://kenney.nl/assets/platformer-pack-industrial?utm_source=chatgpt.com "Platformer Pack Industrial"
[13]: https://kenney.nl/assets/interface-sounds?utm_source=chatgpt.com "Interface Sounds"

### Estructura de carpetas deseada

```
res://
  scenes/
    Main.tscn
    Corridor.tscn
  scripts/
    GameState.gd
    Player.gd
    Pickup.gd
    Vent.gd
    FuseBox.gd
    Note.gd
    Keypad.gd
    Door.gd
  ui/
    KeypadPrompt.tscn
    KeypadPrompt.gd
    HUD.tscn            (Label opcional para mensajes)
  assets/
    props/              (modelos/meshes simples o placeholders)
    ui/                 (iconos, si hace falta)
    sfx/                (click, beep, door)
```

### Instrucciones técnicas que quiero documentadas

1. **Input Map**:

   * `move_forward` = W, `move_back` = S, `move_left` = A, `move_right` = D
   * `interact` = E
2. **Autoload** `GameState.gd` con:

   * `inventory` como diccionario, `flags` (`power_on`, `door_unlocked`).
   * Métodos: `add_item(name)`, `has_item(name)`, `use_item(name)`, `say(text)`.
3. **Player.gd** (CharacterBody3D):

   * Movimiento FPS, cámara con **RayCast3D** que llame a `interact()` del objeto colisionado.
4. **Scripts de interactuables** (con métodos `interact()`):

   * `Pickup.gd` (para **destornillador** y **fusible**).
   * `Vent.gd` (la **rejilla** pide destornillador; al abrirla, revela algo).
   * `FuseBox.gd` (acepta **fusible**, pone `power_on=true`).
   * `Note.gd` (muestra la **pista** del código).
   * `Keypad.gd` (abre UI de código; si correcto, `door_unlocked=true`).
   * `Door.gd` (si `door_unlocked`, cambiar a `scenes/Corridor.tscn`).
5. **UI `KeypadPrompt.tscn`**: CanvasLayer + Panel con Label, LineEdit y Button.
6. **HUD opcional**: Label para enseñar mensajes de `GameState.say()`.

### Lista de ítems/recursos a descargar (pedirte 3 opciones por cada línea)

* **Destornillador** (icono PNG/SVG).
* **Fusible** (icono PNG/SVG).
* **Teclado numérico / botones UI** (pack UI CC0).
* **Puerta** (sprite/mesh simple, o textura para box).
* **Rejilla** de ventilación (textura/sprite o mesh simple).
* **Monitor/PC** (icono/textura para prop simple).
* **Panel/cuadro eléctrico** (icono/texture).
* **SFX**: click UI, beep correcto, beep error, puerta.

> Para cada recurso: proporcióname **3 enlaces** CC0/gratis uso comercial (por ejemplo, Kenney, OpenGameArt, Pixabay), con formato recomendado y tamaño ideal (ej.: 512×512 PNG, 128×128 para inventario, OGG 44.1kHz para SFX).

### Código base que quiero que generes (completo y listo para pegar)

* `GameState.gd` (inventario/flags + `say`)
* `Player.gd` (WASD + mouse look + raycast + `_try_interact()`)
* `Pickup.gd` (recoger item y `queue_free()`)
* `Vent.gd` (revisa `GameState.has_item("screwdriver")`, abre y revela NodePath)
* `FuseBox.gd` (usa `GameState.use_item("fuse")`, activa `flags.power_on`)
* `Note.gd` (muestra pista: “César +2 → 2507”, código esperado **4729**)
* `KeypadPrompt.gd` (Popup con LineEdit; si código ok → `accepted` signal)
* `Keypad.gd` (abre Popup; con energía ON, y si ok → `flags.door_unlocked = true`)
* `Door.gd` (si desbloqueado → `change_scene_to_file("res://scenes/Corridor.tscn")`)
* `HUD.tscn` + pequeño script para mostrar `say()` en pantalla.

### Checklist de conexión (quiero que lo enumeres explícito)

* Dónde colocar cada script y a qué **nodo** asignarlo.
* Qué **NodePath** exportados hay que arrastrar (ej.: `keypad_prompt` en `Keypad.gd`).
* Qué nodos deben llevar **StaticBody3D + CollisionShape3D**.
* Cómo crear la habitación con **CSG** (paredes, suelo, techo) en 5 minutos.
* Dónde colocar el **RayCast3D** y su `target_position`.
* Cómo registrar el Autoload y el Input Map.

### Criterios de aceptación (QA rápido)

* Puedo moverme con WASD y mirar con ratón.
* Con **E** recojo **destornillador** y **fusible** (inventario cambia).
* La **rejilla** exige destornillador; al abrir, revela algo (fusible/cuadro).
* El **cuadro** acepta fusible y pone la energía `ON`.
* La **nota** me da pista del código (4729).
* El **teclado** abre popup; si introduzco **4729**, la **puerta** se desbloquea.
* Puedo cambiar a la escena **Corridor.tscn** al salir.

### Plan B (si voy justo)

* Eliminar combinación: dejar fusible visible y rejilla que se abra sin herramienta.
* Si la UI falla, desbloquear puerta automáticamente con energía ON.
* Si no llego a segunda escena, mostrar mensaje “¡Has escapado!” en HUD.

**Importante:** Si no puedes adjuntar proyecto/escenas, entrégame **todo el código** y las **instrucciones exactas** para montarlo, más la **lista de 3 recursos por ítem** (CC0/gratis) con enlaces directos.


