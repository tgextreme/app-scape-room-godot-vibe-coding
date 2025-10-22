extends StaticBody3D

# Nodo que se revela al abrir (puede ser un fusible o pista)
@export var revealed_node: Node3D

func _ready() -> void:
	if revealed_node:
		revealed_node.visible = false

func interact() -> void:
	if GameState.flags.vent_opened:
		GameState.say("La rejilla ya está abierta")
		return
	
	if GameState.has_item("destornillador"):
		GameState.say("Usas el destornillador para abrir la rejilla...")
		GameState.flags.vent_opened = true
		
		# Revelar el objeto oculto
		if revealed_node:
			revealed_node.visible = true
			GameState.say("¡Has encontrado algo detrás de la rejilla!")
		
		# Opcional: ocultar o mover la rejilla
		visible = false
	else:
		GameState.say("Esta rejilla necesita un destornillador para abrirse")
