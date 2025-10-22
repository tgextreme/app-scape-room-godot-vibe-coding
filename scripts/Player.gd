extends CharacterBody3D

# Configuración de movimiento
@export var speed: float = 5.0
@export var mouse_sensitivity: float = 0.002
@export var jump_velocity: float = 4.5

# Referencias
@onready var camera: Camera3D = $Camera3D
@onready var raycast: RayCast3D = $Camera3D/RayCast3D

# Rotación
var camera_rotation: float = 0.0

func _ready() -> void:
	# Capturar el mouse
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	# Mouse look
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		# Rotación horizontal del jugador
		rotate_y(-event.relative.x * mouse_sensitivity)
		
		# Rotación vertical de la cámara
		camera_rotation -= event.relative.y * mouse_sensitivity
		camera_rotation = clamp(camera_rotation, -PI/2, PI/2)
		camera.rotation.x = camera_rotation
	
	# Liberar mouse con ESC
	if event.is_action_pressed("ui_cancel"):
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	# Interacción
	if event.is_action_pressed("interact"):
		_try_interact()

func _physics_process(delta: float) -> void:
	# Gravedad
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Movimiento
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
	
	move_and_slide()

func _try_interact() -> void:
	if raycast.is_colliding():
		var collider = raycast.get_collider()
		if collider and collider.has_method("interact"):
			collider.interact()
			print("Interactuando con: ", collider.name)
		else:
			print("Objeto no interactivo")
	else:
		print("Nada en el raycast")
