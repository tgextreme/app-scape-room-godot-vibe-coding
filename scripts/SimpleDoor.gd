extends StaticBody3D

@export var is_locked: bool = true
@export var required_item: String = ""  # Si necesita un objeto para abrir
@export var next_level: int = 0  # 0 = siguiente nivel automático, >0 = nivel específico

func interact():
	if not is_locked:
		open_door()
	elif required_item != "" and GameState.has_item(required_item):
		GameState.say("¡Has usado " + required_item + "!")
		GameState.use_item(required_item)
		unlock()
	elif required_item != "":
		GameState.say("Necesitas: " + required_item)
	else:
		GameState.say("La puerta está cerrada. Busca la forma de abrirla.")

func unlock():
	is_locked = false
	# Cambiar color a verde
	var mat = $MeshInstance3D.get_active_material(0)
	if mat:
		mat.albedo_color = Color(0, 1, 0, 1)
		mat.emission = Color(0, 1, 0, 1)
	GameState.say("¡Puerta desbloqueada!")

func open_door():
	GameState.say("¡Nivel completado!")
	await get_tree().create_timer(1.0).timeout
	
	if next_level > 0:
		LevelManager.go_to_level(next_level)
	else:
		LevelManager.complete_level()
