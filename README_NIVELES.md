# 🎮 ESCAPE ROOM - 3 NIVELES

¡Sistema completo de escape rooms con dificultad progresiva y muchas pistas!

## 📋 NIVELES DISPONIBLES

### 🔑 NIVEL 1: TUTORIAL (MUY FÁCIL)
**Objetivo:** Encuentra la llave dorada y abre la puerta

**Cómo jugar:**
1. Lee el cartel de pistas (texto grande con instrucciones)
2. Busca la **LLAVE DORADA** brillante en la habitación
3. Acércate y presiona **E** para recogerla
4. Ve a la **PUERTA ROJA**
5. Presiona **E** en la puerta para usar la llave
6. ¡Nivel completado!

**Pistas visuales:**
- ✨ La llave brilla en color DORADO
- 🚪 La puerta es ROJA y está al fondo
- 📝 Hay un cartel grande con todas las instrucciones

---

### 🎨 NIVEL 2: BOTONES DE COLORES (FÁCIL)
**Objetivo:** Presiona los 4 botones de colores para abrir la puerta

**Cómo jugar:**
1. Lee el cartel de pistas (te dice qué hacer)
2. Encuentra los 4 botones brillantes:
   - 🔴 ROJO (izquierda atrás)
   - 🔵 AZUL (derecha atrás)
   - 🟢 VERDE (izquierda adelante)
   - 🟡 AMARILLO (derecha adelante)
3. Presiona **E** en cada botón
4. Cuando presiones todos, ve a la **PUERTA MORADA**
5. Presiona **E** para salir

**Pistas visuales:**
- 🌈 Cada botón brilla con su color
- 📍 Están en las 4 esquinas de la habitación
- 🚪 La puerta morada se abre automáticamente al presionar todos

---

### 🧩 NIVEL 3: PUZZLE DE TARJETAS (MEDIO)
**Objetivo:** Encuentra 3 tarjetas de colores y colócalas en sus slots

**Cómo jugar:**
1. Lee el cartel de pistas (te dice dónde están las tarjetas)
2. Encuentra las 3 tarjetas:
   - 🔴 **TARJETA ROJA** - Esquina suroeste (izquierda abajo)
   - 🔵 **TARJETA AZUL** - Norte (arriba al fondo)
   - 🟢 **TARJETA VERDE** - Este (derecha)
3. Recoge cada tarjeta con **E**
4. Ve a la pared del fondo y presiona **E** en los slots negros
5. Inserta cada tarjeta en su slot del mismo color
6. Cuando las 3 estén insertadas, ve a la **PUERTA CYAN**
7. ¡Victoria total!

**Pistas visuales:**
- 💳 Las tarjetas brillan con sus colores
- ⬛ Los slots son cajas negras en la pared
- 📍 El cartel te dice las ubicaciones exactas

---

## 🎯 CARACTERÍSTICAS DEL SISTEMA

### ✨ Progresión de Niveles
- Sistema automático de guardado
- Puedes continuar desde donde lo dejaste
- Selector de niveles en el menú

### 🎨 Interfaz Mejorada
- **Menú Principal** con opciones:
  - 🆕 Nuevo Juego (empieza desde nivel 1)
  - ▶️ Continuar (retoma tu progreso)
  - 🎯 Seleccionar Nivel (elige cualquier nivel)
  - ❌ Salir

### 📊 Indicadores Visuales
- Cada nivel tiene su **nombre en pantalla**
- Objetos interactivos **brillan** con emisión de luz
- **Colores distintos** para cada elemento
- **Carteles con pistas** en cada nivel

### 🎉 Pantalla de Victoria
- Aparece al completar los 3 niveles
- Trofeo dorado giratorio
- Opción de jugar de nuevo

---

## 🎮 CONTROLES

- **WASD** - Movimiento
- **RATÓN** - Mirar alrededor
- **E** - Interactuar con objetos
- **ESC** - Pausar (si configurado)

---

## 🚀 CÓMO EMPEZAR

1. Abre Godot 4
2. Carga el proyecto
3. Presiona **F5**
4. Aparecerá el **Menú Principal**
5. Haz clic en **"Nuevo Juego"**
6. ¡Disfruta!

---

## 💡 TIPS GENERALES

### Para el Nivel 1:
- Si te pierdes, vuelve al cartel de pistas
- La llave está en el lado opuesto a la puerta

### Para el Nivel 2:
- Mira bien las esquinas
- Los botones están a la altura del suelo
- No importa el orden en que los presiones

### Para el Nivel 3:
- Lee bien el cartel, dice EXACTAMENTE dónde está cada tarjeta
- "Suroeste" = esquina izquierda-abajo
- "Norte" = hacia la pared del fondo
- "Este" = lado derecho

---

## 🔧 SOLUCIÓN RÁPIDA

### Nivel 1:
1. Leer cartel → 2. Recoger llave → 3. Ir a puerta → 4. Usar llave

### Nivel 2:
1. Leer cartel → 2. Presionar los 4 botones → 3. Ir a puerta morada

### Nivel 3:
1. Leer cartel → 2. Recoger tarjeta roja (izq-abajo) → 3. Recoger tarjeta azul (fondo) → 4. Recoger tarjeta verde (derecha) → 5. Insertar las 3 tarjetas en los slots → 6. Ir a puerta cyan

---

## 📁 ARCHIVOS DEL SISTEMA

- **scripts/LevelManager.gd** - Gestor de niveles y progreso
- **scripts/SimplePickup.gd** - Objetos recogibles simples
- **scripts/SimpleDoor.gd** - Puertas con/sin llave
- **scripts/ColoredButton.gd** - Botones interactivos
- **scripts/HintSign.gd** - Carteles con pistas
- **scenes/MainMenu.tscn** - Menú principal
- **scenes/Level1.tscn** - Nivel tutorial
- **scenes/Level2.tscn** - Nivel botones
- **scenes/Level3.tscn** - Nivel tarjetas
- **scenes/Victory.tscn** - Pantalla de victoria

---

¡Diviértete escapando! 🎉
