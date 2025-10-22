extends StaticBody3D

@export var button_id: int = 1
@export var counter_node: NodePath

var is_pressed: bool = false

func interact():
	if not is_pressed:
		is_pressed = true
		# Hundir el botón visualmente
		if has_node("MeshInstance3D"):
			$MeshInstance3D.position.y -= 0.1
		
		# Notificar al contador
		if counter_node:
			var counter = get_node(counter_node)
			if counter and counter.has_method("button_activated"):
				counter.button_activated()
