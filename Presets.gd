extends MenuButton

export var base_node = NodePath("../..")
onready var top = get_node_or_null(base_node)





func _ready():
	var cv = load("res://default_data.gd").new().get_script().get_script_constant_map()
	updateTL_from_dictionary(cv["TRANSLATIONS"])
	var data = cv["DATA"]
	for sect in data:
		var obj = data[sect]
		var p = get_popup()
		var cl = PopupMenu.new()
		cl.name = sect
		cl.set_script(load("res://submenu.gd"))
		cl.data = obj.duplicate(true)
		cl.root = top
		p.add_child(cl)
		p.add_submenu_item(TranslationServer.translate(sect),sect)

func updateTL_from_dictionary(path:Dictionary):
	var translations := []
	for lang in path.keys():
		var translationObject := Translation.new()
		translationObject.locale = lang
		var translation_dict = path.get(lang)
		var tKeys = translation_dict.keys()
		for key in tKeys:
			var data = translation_dict.get(key)
			translationObject.add_message(key,data.c_unescape())
		translations.append(translationObject)
	for translationObject in translations:
		TranslationServer.add_translation(translationObject)
