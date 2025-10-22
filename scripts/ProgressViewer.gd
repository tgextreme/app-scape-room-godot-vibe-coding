extends Control

@onready var progress_label = $Panel/VBoxContainer/ProgressLabel
@onready var file_path_label = $Panel/VBoxContainer/FilePathLabel
@ontml:parameter name="content">onready var unlock_all_button = $Panel/VBoxContainer/UnlockAllButton
@onready var reset_button = $Panel/VBoxContainer/ResetButton

func _ready():
	update_display()
	
	# Mostrar ubicación del archivo
	var save_path = OS.get_user_data_dir() + "/progress.txt"
	file_path_label.text = "Archivo: " + save_path

func update_display():
	var text = "=== PROGRESO ACTUAL ===\n\n"
	text += "Nivel actual: " + str(LevelManager.current_level) + "/" + str(LevelManager.max_level) + "\n"
	text += "Máximo nivel desbloqueado: " + str(LevelManager.max_unlocked_level) + "\n\n"
	
	text += "Niveles disponibles:\n"
	for i in range(1, LevelManager.max_level + 1):
		if LevelManager.is_level_unlocked(i):
			text += "  ✓ Nivel " + str(i) + " - DESBLOQUEADO\n"
		else:
			text += "  🔒 Nivel " + str(i) + " - BLOQUEADO\n"
	
	progress_label.text = text

func _on_unlock_all_button_pressed():
	LevelManager.max_unlocked_level = LevelManager.max_level
	LevelManager.save_progress()
	update_display()
	GameState.say("¡Todos los niveles desbloqueados!")

func _on_reset_button_pressed():
	LevelManager.reset_progress()
	update_display()
	GameState.say("Progreso reiniciado")

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
