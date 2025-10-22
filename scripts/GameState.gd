extends Node

# Inventario: diccionario con items como claves y cantidad como valor
var inventory: Dictionary = {}

# Flags del juego
var flags: Dictionary = {
	"power_on": false,
	"door_unlocked": false,
	"vent_opened": false
}

# Señal para mensajes al HUD
signal message_displayed(text: String)

func _ready() -> void:
	print("GameState initialized")

# Añadir item al inventario
func add_item(item_name: String) -> void:
	if inventory.has(item_name):
		inventory[item_name] += 1
	else:
		inventory[item_name] = 1
	say("Recogido: " + item_name)
	print("Inventory: ", inventory)

# Verificar si tenemos un item
func has_item(item_name: String) -> bool:
	return inventory.has(item_name) and inventory[item_name] > 0

# Usar/consumir un item
func use_item(item_name: String) -> bool:
	if has_item(item_name):
		inventory[item_name] -= 1
		if inventory[item_name] <= 0:
			inventory.erase(item_name)
		say("Usado: " + item_name)
		print("Inventory after use: ", inventory)
		return true
	return false

# Mostrar mensaje
func say(text: String) -> void:
	print("SAY: ", text)
	message_displayed.emit(text)

# Obtener lista de items para debug
func get_inventory_string() -> String:
	var items: Array = []
	for item in inventory.keys():
		items.append("%s x%d" % [item, inventory[item]])
	if items.is_empty():
		return "Inventario vacío"
	return "Inventario: " + ", ".join(items)
