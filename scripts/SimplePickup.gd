extends StaticBody3D

@export var item_name: String = ""
@export var hint_text: String = ""

func interact():
	if item_name != "":
		GameState.add_item(item_name)
		if hint_text != "":
			GameState.say(hint_text)
		else:
			GameState.say("Has recogido: " + item_name)
		queue_free()
