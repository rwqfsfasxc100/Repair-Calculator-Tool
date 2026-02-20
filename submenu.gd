extends PopupMenu

var data = {}
var root
var order = []

func _ready():
	connect("id_pressed",self,"pressed")
	for i in range(data.keys().size()):
		var item = data.keys()[i]
		add_item(TranslationServer.translate(item))
		order.append(item)
		
	
	
	print("Submenu ",self.name," has data ",JSON.print(data,"\t"))


func pressed(id):
	var item = order[id]
	var dt = data[item]
	var fix = root.get_node_or_null("Fix/FixPrice")
	var replace = root.get_node_or_null("Replace/BuyPrice")
	fix.value = dt["fix"]
	replace.value = dt["replace"]
	pass
