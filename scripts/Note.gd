extends StaticBody3D

# El mensaje de la nota con la pista
@export_multiline var note_text: String = "Pista: César +2\nCódigo: 2507\n¿Qué será...?"

func interact() -> void:
	GameState.say(note_text)
	print("=== NOTA LEÍDA ===")
	print(note_text)
	print("==================")
