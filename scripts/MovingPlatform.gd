extends AnimatableBody3D

@export var target_position_node: NodePath
@export var move_speed: float = 2.0
@export var door_to_unlock: NodePath

var is_active: bool = false
var original_position: Vector3
var target_pos: Vector3
var current_velocity: Vector3 = Vector3.ZERO

func _ready():
	sync_to_physics = true
	original_position = global_position
	if target_position_node:
		var target = get_node(target_position_node)
		if target:
			target_pos = target.global_position

func interact():
	if not is_active:
		is_active = true
		GameState.say("¡Plataforma activada!")
		move_platform()

func move_platform():
	var tween = create_tween()
	tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.tween_property(self, "global_position", target_pos, move_speed)
	tween.finished.connect(_on_movement_finished)

func _on_movement_finished():
	current_velocity = Vector3.ZERO
	if door_to_unlock:
		var door = get_node(door_to_unlock)
		if door and door.has_method("unlock"):
			door.unlock()
	GameState.say("¡Plataforma en posición!")

func get_platform_velocity() -> Vector3:
	return current_velocity

func _physics_process(delta):
	if is_active:
		# Calcular velocidad aproximada basada en el movimiento
		var direction = (target_pos - global_position).normalized()
		if global_position.distance_to(target_pos) > 0.1:
			current_velocity = direction * (1.0 / move_speed)
		else:
			current_velocity = Vector3.ZERO
