extends StaticBody3D

@export var button_color: String = "rojo"  # rojo, azul, verde, amarillo
@export var door_to_open: NodePath

var is_pressed: bool = false

func interact():
	if not is_pressed:
		is_pressed = true
		# Cambiar apariencia
		$MeshInstance3D.position.y -= 0.1
		
		GameState.say("¡Botón " + button_color + " presionado!")
		
		# Abrir puerta si está configurada
		if door_to_open:
			var door = get_node(door_to_open)
			if door:
				door.unlock()
