extends CanvasLayer

# Señal para comunicar el código ingresado
signal code_entered(code: String)

# Referencias a los nodos UI
@onready var panel: Panel = $Panel
@onready var line_edit: LineEdit = $Panel/VBoxContainer/LineEdit
@onready var ok_button: Button = $Panel/VBoxContainer/OKButton
@onready var cancel_button: Button = $Panel/VBoxContainer/CancelButton

func _ready() -> void:
	visible = false
	
	# Conectar botones
	if ok_button:
		ok_button.pressed.connect(_on_ok_pressed)
	if cancel_button:
		cancel_button.pressed.connect(_on_cancel_pressed)
	
	# Conectar LineEdit para enter
	if line_edit:
		line_edit.text_submitted.connect(_on_text_submitted)

func _on_ok_pressed() -> void:
	if line_edit:
		var code = line_edit.text.strip_edges()
		code_entered.emit(code)
		line_edit.text = ""
	_close_prompt()

func _on_cancel_pressed() -> void:
	if line_edit:
		line_edit.text = ""
	_close_prompt()

func _on_text_submitted(text: String) -> void:
	_on_ok_pressed()

func _close_prompt() -> void:
	visible = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
