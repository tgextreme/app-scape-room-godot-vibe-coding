extends Node

# Sistema de gestión de niveles
var current_level: int = 1
var max_level: int = 6
var max_unlocked_level: int = 1  # Máximo nivel desbloqueado

const SAVE_FILE = "user://progress.txt"

func _ready():
	# Cargar progreso guardado
	load_progress()

func complete_level():
	# Al completar un nivel, desbloquear el siguiente
	if current_level < max_level:
		current_level += 1
		if current_level > max_unlocked_level:
			max_unlocked_level = current_level
			save_progress()
			GameState.say("¡Nivel " + str(current_level) + " desbloqueado!")
		get_tree().change_scene_to_file("res://scenes/Level" + str(current_level) + ".tscn")
	else:
		# Completado todos los niveles
		get_tree().change_scene_to_file("res://scenes/Victory.tscn")

func restart_level():
	get_tree().reload_current_scene()

func go_to_level(level: int):
	# Solo permitir ir a niveles desbloqueados
	if level >= 1 and level <= max_unlocked_level and level <= max_level:
		current_level = level
		get_tree().change_scene_to_file("res://scenes/Level" + str(level) + ".tscn")
		return true
	else:
		GameState.say("¡Nivel bloqueado! Completa los niveles anteriores.")
		return false

func is_level_unlocked(level: int) -> bool:
	return level <= max_unlocked_level

func save_progress():
	var file = FileAccess.open(SAVE_FILE, FileAccess.WRITE)
	if file:
		# Guardar en formato texto
		file.store_line("# Escape Room - Progreso del Jugador")
		file.store_line("# Nivel actual: " + str(current_level))
		file.store_line("# Niveles desbloqueados: " + str(max_unlocked_level))
		file.store_line("")
		file.store_line("current_level=" + str(current_level))
		file.store_line("max_unlocked=" + str(max_unlocked_level))
		file.close()
		print("Progreso guardado: Nivel " + str(current_level) + ", Desbloqueados: " + str(max_unlocked_level))

func load_progress():
	if not FileAccess.file_exists(SAVE_FILE):
		# Primera vez jugando
		current_level = 1
		max_unlocked_level = 1
		save_progress()
		return
	
	var file = FileAccess.open(SAVE_FILE, FileAccess.READ)
	if file:
		while not file.eof_reached():
			var line = file.get_line().strip_edges()
			
			# Ignorar comentarios y líneas vacías
			if line.begins_with("#") or line == "":
				continue
			
			# Parsear líneas
			if line.begins_with("current_level="):
				current_level = int(line.split("=")[1])
			elif line.begins_with("max_unlocked="):
				max_unlocked_level = int(line.split("=")[1])
		
		file.close()
		print("Progreso cargado: Nivel " + str(current_level) + ", Desbloqueados: " + str(max_unlocked_level))

func reset_progress():
	current_level = 1
	max_unlocked_level = 1
	save_progress()
	if FileAccess.file_exists(SAVE_FILE):
		DirAccess.remove_absolute(SAVE_FILE)
	print("Progreso reiniciado")

func get_progress_text() -> String:
	return "Nivel actual: " + str(current_level) + "/" + str(max_level) + "\nNiveles desbloqueados: " + str(max_unlocked_level)
