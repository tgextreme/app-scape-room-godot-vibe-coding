extends StaticBody3D

@export var laser_to_disable: NodePath

func interact():
	if laser_to_disable:
		var laser = get_node(laser_to_disable)
		if laser and laser.has_method("deactivate"):
			laser.deactivate()
			GameState.say("¡Panel de control activado!")
			queue_free()
