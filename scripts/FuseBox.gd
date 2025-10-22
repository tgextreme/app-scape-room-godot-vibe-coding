extends StaticBody3D

# Material para cambiar cuando se active (opcional)
@export var active_material: Material

func interact() -> void:
	if GameState.flags.power_on:
		GameState.say("La energía ya está activada")
		return
	
	if GameState.has_item("fusible"):
		GameState.use_item("fusible")
		GameState.flags.power_on = true
		GameState.say("¡Has instalado el fusible! La energía está activada")
		
		# Cambiar apariencia si hay material asignado
		if active_material and has_node("MeshInstance3D"):
			get_node("MeshInstance3D").material_override = active_material
	else:
		GameState.say("Parece que falta un fusible aquí")
