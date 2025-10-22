extends StaticBody3D

@export var laser_length: float = 10.0
@export var is_active: bool = true
@export var damage_per_second: float = 20.0

var laser_mesh: MeshInstance3D

func _ready():
	create_laser()

func create_laser():
	# Crear el rayo láser visual
	laser_mesh = MeshInstance3D.new()
	var mesh = BoxMesh.new()
	mesh.size = Vector3(0.1, 0.1, laser_length)
	laser_mesh.mesh = mesh
	
	var mat = StandardMaterial3D.new()
	mat.albedo_color = Color(1, 0, 0, 0.7)
	mat.emission_enabled = true
	mat.emission = Color(1, 0, 0, 1)
	mat.emission_energy_multiplier = 2.0
	mat.transparency = BaseMaterial3D.TRANSPARENCY_ALPHA
	laser_mesh.material_override = mat
	
	laser_mesh.position.z = -laser_length / 2
	add_child(laser_mesh)
	
	if not is_active:
		laser_mesh.visible = false

func deactivate():
	is_active = false
	if laser_mesh:
		laser_mesh.visible = false
	GameState.say("¡Láser desactivado!")

func activate():
	is_active = true
	if laser_mesh:
		laser_mesh.visible = true
