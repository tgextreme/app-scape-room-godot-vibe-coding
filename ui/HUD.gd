extends CanvasLayer

@onready var message_label: Label = $MessageLabel
@onready var inventory_label: Label = $InventoryLabel

var message_timer: float = 0.0
const MESSAGE_DURATION: float = 3.0

func _ready() -> void:
	# Conectar a la señal de GameState
	GameState.message_displayed.connect(_on_message_displayed)
	
	if message_label:
		message_label.text = ""
	
	_update_inventory()

func _process(delta: float) -> void:
	# Actualizar temporizador de mensaje
	if message_timer > 0:
		message_timer -= delta
		if message_timer <= 0 and message_label:
			message_label.text = ""
	
	# Actualizar inventario cada frame (podría optimizarse)
	_update_inventory()

func _on_message_displayed(text: String) -> void:
	if message_label:
		message_label.text = text
		message_timer = MESSAGE_DURATION

func _update_inventory() -> void:
	if inventory_label:
		inventory_label.text = GameState.get_inventory_string()
