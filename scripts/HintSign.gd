extends StaticBody3D

@export_multiline var hint_text: String = "Pista: Observa los colores"

func interact():
	GameState.say(hint_text)
