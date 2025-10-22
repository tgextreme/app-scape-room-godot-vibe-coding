# 🎮 ESCAPE ROOM - GODOT 4 (3D)

Escape room minimalista funcional para directo "vibe coding"

## 📦 CONTENIDO DEL PROYECTO

✅ **Scripts completos** (GDScript)
✅ **Escenas base** (.tscn)
✅ **UI funcional** (HUD + Popup teclado)
✅ **Guías paso a paso**
✅ **Checklist de verificación**
✅ **Lista de recursos CC0**

---

## 🚀 QUICK START (5 PASOS)

### 1. Abrir proyecto en Godot 4
- Abre Godot 4
- Project → Import → Selecciona `project.godot`

### 2. Configurar Autoload
- Project → Project Settings → Autoload
- Añadir: `res://scripts/GameState.gd` como `GameState`

### 3. Configurar Input Map
- Project → Project Settings → Input Map
- Crear: `move_forward` (W), `move_back` (S), `move_left` (A), `move_right` (D), `interact` (E)

### 4. Abrir escena principal
- Abre `res://scenes/Main.tscn`

### 5. Presiona F5 y juega
- WASD: Movimiento
- Mouse: Mirar
- E: Interactuar
- ESC: Liberar ratón

---

## 🎯 FLUJO DEL JUEGO

1. **Recoge destornillador** (visible)
2. **Abre rejilla** con destornillador → revela fusible
3. **Recoge fusible**
4. **Instala fusible** en cuadro → activa energía
5. **Lee nota** → pista César +2 (2507 → 4729)
6. **Introduce código 4729** en teclado
7. **Abre puerta** → ¡Has escapado!

---

## 📁 ESTRUCTURA DEL PROYECTO

```
res://
├── INSTRUCCIONES_COMPLETAS.md  ← Guía detallada paso a paso
├── CHECKLIST.md                ← Verificación y testeo
├── scenes/
│   ├── Main.tscn               ← Escena principal (habitación)
│   └── Corridor.tscn           ← Escena final (victoria)
├── scripts/
│   ├── GameState.gd            ← Autoload (inventario + flags)
│   ├── Player.gd               ← Movimiento FPS + raycast
│   ├── Pickup.gd               ← Items recogibles
│   ├── Vent.gd                 ← Rejilla (requiere destornillador)
│   ├── FuseBox.gd              ← Cuadro eléctrico
│   ├── Note.gd                 ← Nota con pista
│   ├── Keypad.gd               ← Teclado numérico
│   └── Door.gd                 ← Puerta de salida
├── ui/
│   ├── HUD.tscn                ← Mensajes + inventario
│   ├── HUD.gd
│   ├── KeypadPrompt.tscn       ← Popup de código
│   └── KeypadPrompt.gd
└── assets/
    ├── props/                  ← Modelos/sprites (vacío, añadir tus assets)
    ├── ui/                     ← Iconos UI (vacío)
    └── sfx/                    ← Sonidos (vacío)
```

---

## 🛠️ CONFIGURACIÓN NECESARIA

### ⚙️ Autoload (CRÍTICO):
- `GameState.gd` debe estar registrado como Autoload
- Sin esto, los scripts darán error

### 🎮 Input Map (CRÍTICO):
- `move_forward`, `move_back`, `move_left`, `move_right`, `interact`
- Sin esto, no podrás moverte ni interactuar

### 🔗 Export Variables (Importante):
Ver CHECKLIST.md para todas las conexiones NodePath

---

## 📚 DOCUMENTACIÓN

- **INDEX.md**: 📚 Índice completo de toda la documentación
- **RESUMEN_EJECUTIVO.md**: 🚀 Visión completa del proyecto
- **INSTRUCCIONES_COMPLETAS.md**: 📖 Guía detallada paso a paso
- **CHECKLIST.md**: ✅ Lista de verificación
- **COMO_CREAR_MAIN.md**: 🔨 Recrear la escena principal
- **RECURSOS_Y_MEJORAS.md**: 🎨 Assets CC0 y mejoras
- **MAPA_HABITACION.md**: 🗺️ Layout y coordenadas
- **TROUBLESHOOTING.md**: 🔧 Solución de problemas
- **ENUNCIADO.md**: 📄 Especificaciones originales

👉 **Ver [INDEX.md](INDEX.md) para navegación completa**

---

## 🎨 RECURSOS RECOMENDADOS (CC0)

### Assets Visuales:
- **Kenney Game Icons**: https://kenney.nl/assets/game-icons
- **Kenney UI Pack**: https://kenney.nl/assets/ui-pack
- **OpenGameArt**: https://opengameart.org/

### Sonidos:
- **Kenney Interface Sounds**: https://kenney.nl/assets/interface-sounds
- **Freesound CC0**: https://freesound.org/ (filtrar por CC0)

Ver INSTRUCCIONES_COMPLETAS.md para lista completa con enlaces directos.

---

## ✅ VERIFICACIÓN RÁPIDA

### Test básico (2 minutos):
1. ✅ WASD mueve, mouse mira
2. ✅ E recoge destornillador
3. ✅ E abre rejilla (requiere destornillador)
4. ✅ E recoge fusible
5. ✅ E instala fusible en cuadro
6. ✅ E lee nota (código 4729)
7. ✅ E abre popup de teclado
8. ✅ Introduce 4729 → desbloquea puerta
9. ✅ E abre puerta → escena final

---

## 🚨 TROUBLESHOOTING

### "GameState not declared"
→ Configura Autoload (Paso 2)

### "No puedo moverme"
→ Configura Input Map (Paso 3)

### "Raycast no detecta"
→ Verifica que RayCast3D esté Enabled y Collision Mask = Layers 1+2

### "Popup no aparece"
→ Verifica en Keypad.gd que `keypad_prompt` apunta a `UI/KeypadPrompt`

---

## 🎯 PLAN B (SIMPLIFICACIONES)

Si vas justo de tiempo:

1. **Eliminar rejilla**: Deja fusible visible desde inicio
2. **Autodesbloqueo**: Puerta se abre automáticamente con energía
3. **Sin escena final**: Mostrar solo mensaje "¡Felicidades!"

Ver INSTRUCCIONES_COMPLETAS.md para implementación.

---

## 📝 NOTAS TÉCNICAS

- **Motor**: Godot 4.x (3D)
- **Lenguaje**: GDScript
- **Estilo**: Minimalista, arte gris, CSG simple
- **Colisiones**: Layer 1 (entorno), Layer 2 (interactivos)
- **UI**: CanvasLayer con Label + Panel + LineEdit

---

## 🎬 PARA DIRECTO "VIBE CODING"

### Orden sugerido:
1. Configura Autoload + Input (5 min)
2. Abre Main.tscn y explora la escena (5 min)
3. Asigna materiales/colores a objetos (10 min)
4. Test básico del flujo completo (2 min)
5. Añade assets visuales (tiempo restante)
6. Opcional: Añade sonidos

### Chat puede ayudar con:
- "Cambiar color del destornillador"
- "Añadir luz ambiental"
- "Crear botón de reinicio"
- "Añadir sonido de click"

---

## 📜 LICENCIA

- **Código**: Libre uso (este proyecto base)
- **Assets recomendados**: CC0 / Pixabay License (ver INSTRUCCIONES_COMPLETAS.md)

---

## 🆘 SOPORTE

Si algo no funciona:
1. Revisa CHECKLIST.md
2. Verifica Output (F4) para errores
3. Comprueba que Autoload está configurado
4. Verifica que Input Map está completo

---

**¡Listo para streaming!** 🎥✨
