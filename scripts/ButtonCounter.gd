extends Node

@export var required_buttons: int = 3
@export var door_to_open: NodePath

var buttons_pressed: int = 0

func button_activated():
	buttons_pressed += 1
	GameState.say("Botón activado: " + str(buttons_pressed) + "/" + str(required_buttons))
	
	if buttons_pressed >= required_buttons:
		if door_to_open:
			var door = get_node(door_to_open)
			if door and door.has_method("unlock"):
				door.unlock()
				GameState.say("¡Todos los botones activados! Puerta desbloqueada.")
