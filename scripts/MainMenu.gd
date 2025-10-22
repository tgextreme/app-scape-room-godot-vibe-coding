extends Control

func _ready():
	LevelManager.load_progress()
	update_level_buttons()
	
	# Mostrar nivel actual si hay progreso
	if LevelManager.current_level > 1:
		$VBoxContainer/ContinueButton.text = "Continuar (Nivel " + str(LevelManager.current_level) + ")"
		$VBoxContainer/ContinueButton.visible = true
	else:
		$VBoxContainer/ContinueButton.visible = false

func update_level_buttons():
	# Actualizar estado de los botones según el progreso
	var buttons = [
		$LevelSelectPanel/VBoxContainer/Level1Button,
		$LevelSelectPanel/VBoxContainer/Level2Button,
		$LevelSelectPanel/VBoxContainer/Level3Button,
		$LevelSelectPanel/VBoxContainer/Level4Button,
		$LevelSelectPanel/VBoxContainer/Level5Button,
		$LevelSelectPanel/VBoxContainer/Level6Button
	]
	
	for i in range(buttons.size()):
		var level = i + 1
		var button = buttons[i]
		
		if LevelManager.is_level_unlocked(level):
			button.disabled = false
			# Añadir ✓ para niveles completados (no el actual)
			if level < LevelManager.max_unlocked_level:
				if not button.text.contains("✓"):
					button.text = button.text.replace("🔒 ", "") + " ✓"
			else:
				button.text = button.text.replace(" ✓", "").replace("🔒 ", "")
		else:
			button.disabled = true
			if not button.text.contains("🔒"):
				button.text = "🔒 " + button.text.replace(" ✓", "")

func _on_new_game_button_pressed():
	LevelManager.reset_progress()
	LevelManager.go_to_level(1)

func _on_continue_button_pressed():
	LevelManager.load_progress()
	LevelManager.go_to_level(LevelManager.current_level)

func _on_level_select_button_pressed():
	update_level_buttons()  # Actualizar antes de mostrar el panel
	$LevelSelectPanel.visible = true

func _on_progress_button_pressed():
	get_tree().change_scene_to_file("res://scenes/ProgressViewer.tscn")

func _on_quit_button_pressed():
	get_tree().quit()

func _on_level_1_pressed():
	if LevelManager.go_to_level(1):
		pass  # Nivel desbloqueado, ya cambió de escena

func _on_level_2_pressed():
	if LevelManager.go_to_level(2):
		pass

func _on_level_3_pressed():
	if LevelManager.go_to_level(3):
		pass

func _on_level_4_pressed():
	if LevelManager.go_to_level(4):
		pass

func _on_level_5_pressed():
	if LevelManager.go_to_level(5):
		pass

func _on_level_6_pressed():
	if LevelManager.go_to_level(6):
		pass

func _on_back_button_pressed():
	$LevelSelectPanel.visible = false
