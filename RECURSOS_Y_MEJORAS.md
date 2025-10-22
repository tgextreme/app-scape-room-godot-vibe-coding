# 🎨 RECURSOS Y MEJORAS OPCIONALES

## 📦 ASSETS RECOMENDADOS (CC0/Gratis)

### 🎯 ALTA PRIORIDAD (Para el directo)

#### 1. UI Pack (Kenney)
- **URL**: https://kenney.nl/assets/ui-pack
- **Licencia**: CC0 (dominio público)
- **Contenido**: Botones, paneles, sliders, iconos
- **Uso**: Mejorar UI del teclado y HUD
- **Formato**: PNG transparente
- **Tamaño**: 64x64, 128x128, 256x256

#### 2. Game Icons (Kenney)
- **URL**: https://kenney.nl/assets/game-icons
- **Licencia**: CC0
- **Contenido**: 1000+ iconos de juego
- **Uso**: Destornillador, fusible, inventario
- **Formato**: PNG/SVG
- **Tamaño**: 64x64, 128x128

#### 3. Interface Sounds (Kenney)
- **URL**: https://kenney.nl/assets/interface-sounds
- **Licencia**: CC0
- **Contenido**: 60+ sonidos UI
- **Uso**: Click, beep correcto, beep error
- **Formato**: OGG
- **Duración**: Cortos (<1s)

---

### 🎨 MEDIA PRIORIDAD (Si sobra tiempo)

#### 4. UI Pack Sci-Fi (Kenney)
- **URL**: https://kenney.nl/assets/ui-pack-sci-fi
- **Licencia**: CC0
- **Contenido**: UI futurista, ideal para escape room tecnológico
- **Uso**: Teclado numérico, paneles
- **Formato**: PNG

#### 5. Platformer Pack Industrial (Kenney)
- **URL**: https://kenney.nl/assets/platformer-pack-industrial
- **Licencia**: CC0
- **Contenido**: Tiles metálicos, props industriales
- **Uso**: Texturas para paredes, props decorativos
- **Formato**: PNG

#### 6. OpenGameArt - Specific Items

**Destornillador**:
- https://pixabay.com/vectors/screwdriver-screw-driver-tool-29367/
- Formato: SVG (vectorial, escalable)

**Fusible**:
- https://pixabay.com/vectors/electric-fuse-fuse-high-voltage-155785/
- Formato: SVG

**Rejilla de ventilación**:
- https://opengameart.org/content/office-air-vent
- Formato: PNG

**Panel de control**:
- https://pixabay.com/vectors/control-panel-control-panel-4782826/
- Formato: SVG

**Puerta Sci-Fi**:
- https://opengameart.org/content/scifi-door-sprite
- Formato: PNG sprite sheet

**Monitor/PC**:
- https://pixabay.com/vectors/lcd-monitor-computer-32872/
- Formato: SVG

---

### 🔊 SONIDOS ESPECÍFICOS (Freesound.org)

#### Door Open/Close:
- https://freesound.org/search/?q=door+open&f=license:%22Creative+Commons+0%22
- Buscar: "door open", "door slide", "sci-fi door"
- Licencia: CC0
- Formato: WAV → Convertir a OGG en Godot

#### Beep Sounds:
- https://freesound.org/search/?q=beep&f=license:%22Creative+Commons+0%22
- Buscar: "beep", "keypad", "button"
- Uso: Teclado correcto/incorrecto

#### Pickup Sound:
- Buscar: "pickup", "item", "pop"
- Uso: Al recoger items

---

## 🛠️ MEJORAS OPCIONALES PARA EL DIRECTO

### ✨ Nivel 1: Mejoras visuales rápidas (5-10 min)

#### Colores mejorados:
```gdscript
# En cada MeshInstance3D, añade un StandardMaterial3D

# Destornillador - Amarillo brillante
var mat = StandardMaterial3D.new()
mat.albedo_color = Color(1.0, 0.84, 0.0)  # Oro
mat.metallic = 0.8
mat.roughness = 0.3

# Fusible - Rojo neón
var mat = StandardMaterial3D.new()
mat.albedo_color = Color(1.0, 0.0, 0.2)
mat.emission_enabled = true
mat.emission = Color(1.0, 0.0, 0.2)
mat.emission_energy = 2.0

# Teclado - Azul holográfico
var mat = StandardMaterial3D.new()
mat.albedo_color = Color(0.2, 0.5, 1.0)
mat.emission_enabled = true
mat.emission = Color(0.3, 0.7, 1.0)
mat.emission_energy = 1.5
```

#### Iluminación ambiente:
1. Selecciona WorldEnvironment
2. Environment → Background → Mode: Color
3. Background Color: Gris oscuro (#303030)
4. Environment → Ambient Light → Color: Azul tenue (#2A3F5F)
5. Ambient Light → Energy: 0.5

#### Spotlight en objetos clave:
- Añade SpotLight3D sobre destornillador, fusible, teclado
- Color: Amarillo cálido para items, Azul para teclado
- Energy: 2-3

---

### ✨ Nivel 2: Mejoras de UI (10-15 min)

#### HUD con fondo semi-transparente:
```gdscript
# En HUD.tscn, añade Panel detrás de labels
var panel = Panel.new()
var style = StyleBoxFlat.new()
style.bg_color = Color(0, 0, 0, 0.7)  # Negro semi-transparente
style.border_width_all = 2
style.border_color = Color(0.5, 0.8, 1.0)  # Borde azul
panel.add_theme_stylebox_override("panel", style)
```

#### Teclado numérico visual:
- Añade GridContainer con 12 botones (0-9, #, *)
- Usa texturas de Kenney UI Pack
- Conecta cada botón a una función que añada el dígito

#### Inventario con iconos:
- En HUD, añade TextureRect por cada item
- Carga sprites de Kenney Game Icons
- Muestra/oculta según GameState.inventory

---

### ✨ Nivel 3: Efectos y polish (15-20 min)

#### Partículas al recoger items:
```gdscript
# En Pickup.gd, antes de queue_free()
var particles = GPUParticles3D.new()
get_parent().add_child(particles)
particles.global_position = global_position
particles.emitting = true
particles.one_shot = true
particles.lifetime = 0.5
particles.amount = 20
# Configurar material y process material
```

#### Animación de puerta:
```gdscript
# En Door.gd, al abrir
var tween = create_tween()
tween.tween_property(self, "position:x", position.x + 3, 1.0)
tween.set_ease(Tween.EASE_IN_OUT)
tween.set_trans(Tween.TRANS_CUBIC)
```

#### Fade in/out entre escenas:
- Añade ColorRect negro fullscreen en HUD
- Anima modulate.a de 1 a 0 al inicio
- Anima de 0 a 1 antes de cambiar escena

#### Sonidos:
```gdscript
# Añade AudioStreamPlayer a cada objeto interactivo

# En Pickup.gd
func interact():
    $AudioStreamPlayer.play()
    await $AudioStreamPlayer.finished
    GameState.add_item(item_name)
    queue_free()

# En Keypad.gd
func _on_code_entered(code: String):
    if code == CORRECT_CODE:
        $CorrectBeep.play()
        # ...
    else:
        $ErrorBeep.play()
        # ...
```

---

## 🎬 GUÍA DE DIRECTO: ORDEN RECOMENDADO

### Fase 1: Setup (10 min)
1. ✅ Mostrar proyecto base
2. ✅ Explicar estructura de carpetas
3. ✅ Verificar Autoload y Input Map
4. ✅ Primer test: movimiento básico

### Fase 2: Visual básico (15 min)
5. ✅ Añadir colores a objetos interactivos
6. ✅ Configurar iluminación
7. ✅ Test: recoger destornillador

### Fase 3: Gameplay completo (10 min)
8. ✅ Test completo del flujo
9. ✅ Verificar cada puzzle
10. ✅ Ajustar posiciones si hace falta

### Fase 4: Assets visuales (20 min)
11. ✅ Descargar Kenney UI Pack
12. ✅ Importar iconos de items
13. ✅ Mejorar UI del teclado
14. ✅ Añadir sprites a objetos

### Fase 5: Sonidos (15 min)
15. ✅ Descargar Kenney Interface Sounds
16. ✅ Importar OGG
17. ✅ Añadir AudioStreamPlayer a objetos
18. ✅ Conectar sonidos a interacciones

### Fase 6: Polish (tiempo restante)
19. ✅ Partículas al recoger items
20. ✅ Animación de puerta
21. ✅ Fade entre escenas
22. ✅ Ambient occlusion
23. ✅ Glow/bloom

---

## 💡 TIPS PARA EL DIRECTO

### Mantén el chat involucrado:
- "¿Qué color le ponemos al destornillador?"
- "¿Añadimos partículas o sonido primero?"
- "¿Alguien sabe dónde encontrar un sprite de fusible?"

### Explica mientras codeas:
- "Este script controla el inventario global..."
- "El raycast detecta objetos a 3 metros..."
- "El teclado usa un popup con LineEdit..."

### Ten backups preparados:
- Si un asset no carga: Usa color sólido
- Si un sonido no funciona: Continúa sin él
- Si la UI falla: Usa prints en consola

### Cosas que puedes mostrar:
- F4: Output/Console (para debug)
- F8: Debug collisions (ver raycast)
- Remote tab: Ver escena en runtime
- Debugger: Ver variables de GameState

---

## 🚀 EXTENSIONES POST-DIRECTO

Ideas para seguir el proyecto:

### Fácil:
- Más items y puzzles
- Segunda habitación
- Timer/contador
- Sistema de hints
- Música ambiente

### Media:
- Modelos 3D en lugar de CSG
- Diálogos/narrativa
- Múltiples finales
- Sistema de guardado
- Logros

### Avanzada:
- VR support
- Multijugador cooperativo
- Procedural room generation
- Puzzles más complejos
- Sistema de pistas dinámico

---

## 📚 RECURSOS DE APRENDIZAJE

### Godot 4 Docs:
- https://docs.godotengine.org/en/stable/
- Especialmente: CharacterBody3D, RayCast3D, Signals

### Tutoriales de escape room:
- Buscar: "Godot 4 first person controller"
- Buscar: "Godot 4 interaction system"
- Buscar: "Godot 4 inventory system"

### Assets gratuitos:
- Kenney: https://kenney.nl/
- OpenGameArt: https://opengameart.org/
- Itch.io: https://itch.io/game-assets/free
- Poly Pizza: https://poly.pizza/

---

¡Buena suerte con el directo! 🎥✨
