extends Control

func _ready():
	visible = false
	process_mode = Node.PROCESS_MODE_ALWAYS

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		toggle_pause()

func toggle_pause():
	visible = !visible
	get_tree().paused = visible
	
	if visible:
		# Mostrar cursor cuando está pausado
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		# Capturar cursor cuando se reanuda
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _on_resume_button_pressed():
	toggle_pause()

func _on_restart_button_pressed():
	get_tree().paused = false
	LevelManager.restart_level()

func _on_menu_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
