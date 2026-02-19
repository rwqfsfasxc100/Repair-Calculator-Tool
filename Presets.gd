extends MenuButton

export var base_node = NodePath("../..")
onready var top = get_node_or_null(base_node)

onready var data = load("res://default_data.gd").new().get_script().get_script_constant_map()["DATA"]



func _ready():
	for sect in data:
		var obj = data[sect]
		var p = get_popup()
		var cl = PopupMenu.new()
		cl.name = sect
		cl.set_script(load("res://submenu.gd"))
		cl.data = obj.duplicate(true)
		p.add_child(cl)
		p.add_submenu_item(sect,sect)


