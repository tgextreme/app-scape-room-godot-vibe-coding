extends StaticBody3D

# Nombre del item que se recoge
@export var item_name: String = "item"

func interact() -> void:
	GameState.add_item(item_name)
	queue_free()
