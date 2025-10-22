# 🗺️ MAPA DE LA HABITACIÓN - ESCAPE ROOM

## Vista desde arriba (Top-Down)

```
                    NORTE (-Z)
                    Pared Norte
         ┌─────────────────────────────┐
         │                             │
         │         🔲 REJILLA          │
         │         (3, 2, -4.8)        │
         │      [Oculta: ⚡ Fusible]   │
         │                             │
    (-X) │                             │ (+X)
  OESTE  │  📦 CUADRO                 │  ESTE
  Pared  │    FUSIBLES     🔧          │  Pared
         │  (-4.5, 2, 0)  Destorn.    │
         │                (-3,0.5,-3) │
         │                             │
         │         📝 NOTA             │
         │        (0,1.5,3)            │
         │                      🔢     │
         │                   TECLADO   │
         │         🚪 PUERTA (4.5,2,2) │
         │        (0,1.5,4.8)          │
         └─────────────────────────────┘
                     SUR (+Z)
                   Pared Sur

JUGADOR: Inicia en (0, 1, 0) - Centro de la habitación
```

## Vista en perspectiva (Isométrica simplificada)

```
                    Techo (4.5m altura)
        ╔═══════════════════════════════════╗
       ╱│                                   │╲
      ╱ │   🔲 REJILLA (en pared, altura 2)│ ╲
     ╱  │                                   │  ╲
    ╱   │  📦 CUADRO    🚶 JUGADOR          │   ╲
   ╱    │  (altura 2)   (altura 1)     🔢   │    ╲
  ╱     │                          TECLADO  │     ╲
 ╱      │  🔧 Destorn.              (alt 2) │      ╲
╱       │  (en suelo)    📝 NOTA            │       ╲
│       │                (alt 1.5)          │        │
│       │                                   │        │
│       │              🚪 PUERTA            │        │
│       │              (altura 1.5)         │        │
│       ╰───────────────────────────────────╯        │
└─────────────────────────────────────────────────────┘
              Suelo (0m altura)
```

## Coordenadas exactas de todos los objetos

### ENTORNO:
- **Suelo**: (0, -0.5, 0) - Tamaño: 10x1x10
- **Techo**: (0, 4.5, 0) - Tamaño: 10x1x10
- **Pared Norte**: (0, 2, -5) - Tamaño: 10x5x0.5
- **Pared Sur**: (0, 2, 5) - Tamaño: 10x5x0.5
- **Pared Este**: (5, 2, 0) - Tamaño: 0.5x5x10
- **Pared Oeste**: (-5, 2, 0) - Tamaño: 0.5x5x10

### JUGADOR:
- **Spawn**: (0, 1, 0)
- **Cámara**: +0.6 en Y (altura de ojos)
- **Raycast**: 3 metros hacia adelante

### INTERACTIVOS (en orden de uso):

1. **🔧 Destornillador** (Pickup)
   - Posición: (-3, 0.5, -3)
   - Zona: Esquina Noroeste
   - Estado inicial: Visible
   - Acción: Recoger con E

2. **🔲 Rejilla** (Vent)
   - Posición: (3, 2, -4.8)
   - Zona: Pared Norte (arriba)
   - Estado inicial: Visible, cerrada
   - Acción: Usar destornillador para abrir

3. **⚡ Fusible** (Pickup)
   - Posición: (3, 1.5, -4.5)
   - Zona: Detrás de rejilla
   - Estado inicial: OCULTO (se revela al abrir rejilla)
   - Acción: Recoger con E

4. **📦 Cuadro de Fusibles** (FuseBox)
   - Posición: (-4.5, 2, 0)
   - Zona: Pared Oeste (centro)
   - Estado inicial: Sin energía
   - Acción: Instalar fusible

5. **📝 Nota** (Note)
   - Posición: (0, 1.5, 3)
   - Zona: Centro Sur
   - Estado inicial: Siempre visible
   - Acción: Leer pista (código César)

6. **🔢 Teclado** (Keypad)
   - Posición: (4.5, 2, 2)
   - Zona: Pared Este (cerca de puerta)
   - Estado inicial: Sin energía
   - Acción: Introducir código 4729

7. **🚪 Puerta** (Door)
   - Posición: (0, 1.5, 4.8)
   - Zona: Pared Sur (centro)
   - Estado inicial: Bloqueada
   - Acción: Salir cuando esté desbloqueada

## Rutas recomendadas del jugador

### Ruta Óptima (solución directa):
```
Start (0,1,0)
  ↓
1. IR a Destornillador (-3, 0.5, -3)  [Noroeste]
  ↓
2. IR a Rejilla (3, 2, -4.8)  [Norte, arriba]
  ↓ (Se revela Fusible)
3. Recoger Fusible (3, 1.5, -4.5)
  ↓
4. IR a Cuadro de Fusibles (-4.5, 2, 0)  [Oeste]
  ↓ (Se activa energía)
5. IR a Nota (0, 1.5, 3)  [Centro-Sur]
  ↓ (Leer código: 2507 → 4729)
6. IR a Teclado (4.5, 2, 2)  [Este]
  ↓ (Introducir 4729)
7. IR a Puerta (0, 1.5, 4.8)  [Sur]
  ↓
FIN - Cambio a Corridor.tscn
```

### Ruta de Exploración (si no conoces la solución):
```
Start → Explorar toda la habitación → Identificar objetos
↓
Leer Nota primero (código 2507, pero no tiene sentido aún)
↓
Encontrar Destornillador
↓
Probar interactuar con todo (Cuadro, Teclado → no funcionan sin energía)
↓
Descubrir Rejilla, usar Destornillador
↓
Encontrar Fusible
↓
Instalar Fusible en Cuadro → ¡Energía activada!
↓
Releer Nota → Descifrar César +2 → 4729
↓
Introducir código en Teclado
↓
Abrir Puerta → ¡Escapar!
```

## Distancias entre objetos clave

```
Destornillador → Rejilla:     ~7.0 metros
Rejilla → Fusible:            ~0.5 metros (muy cerca)
Fusible → Cuadro:             ~7.6 metros
Cuadro → Nota:                ~5.0 metros
Nota → Teclado:               ~4.6 metros
Teclado → Puerta:             ~4.5 metros
```

## Tiempos estimados de navegación (a 5 m/s)

```
Spawn → Destornillador:       ~1 segundo
Destornillador → Rejilla:     ~1.4 segundos
Rejilla → Cuadro:             ~1.5 segundos
Cuadro → Nota:                ~1 segundo
Nota → Teclado:               ~0.9 segundos
Teclado → Puerta:             ~0.9 segundos

TOTAL (ruta óptima):          ~7 segundos de movimiento
                              + ~30-60 segundos de interacciones
                              = 37-67 segundos (speedrun)
```

## Visibilidad desde el spawn

Desde la posición inicial (0, 1, 0) el jugador puede ver:

### Inmediatamente visibles:
- ✅ **Destornillador** (esquina Noroeste, nivel del suelo)
- ✅ **Nota** (delante del jugador, en el suelo)
- ✅ **Puerta** (pared Sur, al frente)

### Requieren girar/mirar:
- 🔄 **Rejilla** (arriba en pared Norte)
- 🔄 **Cuadro de Fusibles** (pared Oeste)
- 🔄 **Teclado** (pared Este)

### Oculto hasta interacción:
- ❌ **Fusible** (detrás de rejilla)

## Colores sugeridos para distinguir objetos

```
🔧 Destornillador:   AMARILLO  #FFD700 (dorado)
🔲 Rejilla:          GRIS      #C0C0C0 (metálico)
⚡ Fusible:          ROJO      #FF0000 (urgente)
📦 Cuadro:           NEGRO     #202020 (eléctrico)
📝 Nota:             AMARILLO  #FFFF99 (post-it)
🔢 Teclado:          AZUL      #4080FF (tecnológico)
🚪 Puerta:           MARRÓN    #8B4513 (madera)

Paredes:             GRIS      #808080
Suelo:               GRIS OSC  #404040
Techo:               GRIS      #808080
```

## Iluminación recomendada

### Luz principal:
- **DirectionalLight3D**: (0, 10, 0), Rotation (-45°, -45°, 0)
- Color: Blanco cálido
- Shadow: Enabled

### Luces de acento (opcional):
- **SpotLight sobre Destornillador**: Amarillo, Energy 2
- **SpotLight sobre Fusible** (cuando se revela): Rojo, Energy 3
- **SpotLight sobre Teclado**: Azul, Energy 2
- **SpotLight sobre Puerta**: Verde (cuando se desbloquea)

## Zonas de la habitación

```
┌────────────┬────────────┐
│            │            │
│  NOROESTE  │  NORESTE   │
│  (Destorn.)│  (Rejilla) │
│            │            │
├────────────┼────────────┤
│            │            │
│  OESTE     │   ESTE     │
│  (Cuadro)  │  (Teclado) │
│            │            │
├────────────┼────────────┤
│            │            │
│  SUROESTE  │  SURESTE   │
│  (vacío)   │  (vacío)   │
│            │            │
└────────────┴────────────┘
       (Centro: Nota)
       (Sur: Puerta)
```

## Consejos de diseño para expansion

### Áreas libres para añadir contenido:
- **Suroeste**: Espacio vacío, ideal para más objetos
- **Sureste**: Espacio vacío, ideal para decoración
- **Centro**: Actualmente solo tiene la nota, puede ampliarse

### Ideas de objetos adicionales:
- Mesa con la nota (en lugar de nota flotante)
- Silla cerca de la mesa
- Monitor/PC en alguna pared
- Más cajas/contenedores
- Pósters/cuadros en paredes
- Cables/tuberías decorativas
- Luces empotradas en techo

---

## 🎮 Para testear navegación rápidamente:

1. Activa debug de colisiones: **F8** en juego
2. Verás las collision shapes de todos los objetos
3. El raycast del jugador se muestra como línea roja/verde
4. Interactúa con E cuando el raycast toque un objeto

---

**Usa este mapa para planificar mejoras visuales o añadir más contenido!**
