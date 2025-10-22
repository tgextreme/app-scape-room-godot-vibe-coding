extends StaticBody3D

# Referencia al popup del teclado
@export var keypad_prompt: CanvasLayer

# Código correcto
const CORRECT_CODE: String = "4729"

# Sonidos
var sound_ok = preload("res://assets/sfx/beep_ok.wav")
var sound_error = preload("res://assets/sfx/beep_error.wav")
var sound_click = preload("res://assets/sfx/click.wav")

func _ready() -> void:
	if keypad_prompt:
		# Conectar la señal del popup
		if keypad_prompt.has_signal("code_entered"):
			keypad_prompt.code_entered.connect(_on_code_entered)

func interact() -> void:
	if GameState.flags.door_unlocked:
		GameState.say("El teclado ya está desbloqueado")
		return
	
	if not GameState.flags.power_on:
		GameState.say("El teclado no tiene energía. Necesitas activar la electricidad")
		return
	
	# Abrir el popup del teclado
	if keypad_prompt:
		keypad_prompt.visible = true
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		GameState.say("Introduce el código de 4 dígitos")

func _on_code_entered(code: String) -> void:
	if code == CORRECT_CODE:
		GameState.flags.door_unlocked = true
		GameState.say("¡CÓDIGO CORRECTO! La puerta se ha desbloqueado")
		_play_sound(sound_ok)
	else:
		GameState.say("Código incorrecto. Intenta de nuevo")
		_play_sound(sound_error)

func _play_sound(sound_stream: AudioStream) -> void:
	if sound_stream:
		var audio_player = AudioStreamPlayer.new()
		add_child(audio_player)
		audio_player.stream = sound_stream
		audio_player.finished.connect(func(): audio_player.queue_free())
		audio_player.play()
