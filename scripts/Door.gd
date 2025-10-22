extends StaticBody3D

# Escena a la que cambiar cuando se abra la puerta
@export_file("*.tscn") var next_scene: String = "res://scenes/Corridor.tscn"

func interact() -> void:
	if GameState.flags.door_unlocked:
		GameState.say("¡La puerta se abre! ¡Has escapado!")
		# Pequeño delay para que se vea el mensaje
		await get_tree().create_timer(1.0).timeout
		
		# Marcar nivel como completado y desbloquear siguiente
		LevelManager.complete_level()
		
		# Cambiar a la siguiente escena
		if FileAccess.file_exists(next_scene):
			get_tree().change_scene_to_file(next_scene)
		else:
			GameState.say("¡FELICIDADES! Has completado el escape room")
			# Volver al menú después de un delay
			await get_tree().create_timer(2.0).timeout
			get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
	else:
		GameState.say("La puerta está cerrada. Necesitas desbloquear el teclado")
