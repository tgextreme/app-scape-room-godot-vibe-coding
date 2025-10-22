extends CharacterBody3D

# Configuración de movimiento
@export var speed: float = 5.0
@export var mouse_sensitivity: float = 0.002
@export var jump_velocity: float = 4.5
@export var max_jumps: int = 3  # Número máximo de saltos

# Referencias
@onready var camera: Camera3D = $Camera3D
@onready var raycast: RayCast3D = $Camera3D/RayCast3D

# Rotación
var camera_rotation: float = 0.0

# Sistema de saltos múltiples
var jump_count: int = 0

# Menú de pausa
var pause_menu: Control = null

func _ready() -> void:
	# Capturar el mouse
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	# Cargar y añadir menú de pausa
	var pause_scene = load("res://scenes/PauseMenu.tscn")
	if pause_scene:
		pause_menu = pause_scene.instantiate()
		# Añadir al CanvasLayer para que esté sobre todo
		var canvas_layer = CanvasLayer.new()
		canvas_layer.layer = 100
		add_child(canvas_layer)
		canvas_layer.add_child(pause_menu)

func _input(event: InputEvent) -> void:
	# Mouse look (solo si no está pausado)
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		# Rotación horizontal del jugador
		rotate_y(-event.relative.x * mouse_sensitivity)
		
		# Rotación vertical de la cámara
		camera_rotation -= event.relative.y * mouse_sensitivity
		camera_rotation = clamp(camera_rotation, -PI/2, PI/2)
		camera.rotation.x = camera_rotation
	
	# Interacción
	if event.is_action_pressed("interact"):
		_try_interact()

func _physics_process(delta: float) -> void:
	# Detectar plataforma móvil
	var on_platform = false
	if is_on_floor():
		# Resetear contador de saltos al tocar el suelo
		jump_count = 0
		
		var floor_body = get_floor_body()
		if floor_body and floor_body.has_method("get_platform_velocity"):
			on_platform = true
			var platform_velocity = floor_body.get_platform_velocity()
			velocity.x += platform_velocity.x
			velocity.z += platform_velocity.z
	
	# Gravedad
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Sistema de saltos múltiples (hasta 3 veces)
	if Input.is_action_just_pressed("ui_accept"):
		if jump_count < max_jumps:
			velocity.y = jump_velocity
			jump_count += 1
			# Efecto visual/sonoro opcional para cada salto
			if jump_count == 2:
				GameState.say("Doble salto!")
			elif jump_count == 3:
				GameState.say("Triple salto!")
	
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

func get_floor_body():
	for i in range(get_slide_collision_count()):
		var collision = get_slide_collision(i)
		if collision:
			return collision.get_collider()
	return null

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
