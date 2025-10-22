extends StaticBody3D

@export var target_node: NodePath  # Nodo a activar (ej: MovingPlatform)
@export var hint_text: String = "¡Palanca activada!"

var is_activated: bool = false

func interact():
	if not is_activated:
		is_activated = true
		GameState.say(hint_text)
		
		# Activar el objeto objetivo
		if target_node:
			var target = get_node(target_node)
			if target and target.has_method("interact"):
				target.interact()
			else:
				print("Error: El objetivo no tiene método interact()")
		
		# Cambiar color a verde
		var mat = $MeshInstance3D.get_active_material(0)
		if mat:
			mat.albedo_color = Color(0, 1, 0, 1)
			mat.emission = Color(0, 0.5, 0, 1)
	else:
		GameState.say("La palanca ya está activada.")
