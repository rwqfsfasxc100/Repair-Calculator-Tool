extends VBoxContainer

var example_sys = {
	"status":100,
	"damage":[
		{
			"max":100,
			"current":0
		},
		{
			"max":100,
			"current":0
		},
		{
			"max":100,
			"current":0
		},
	]
}

func _ready():
	setupCFG()

var dmg1 = 0
var dmg2 = 0
var dmg3 = 0

var fix = 1500
var replace = 70000


func _on_Calc_pressed():
	dmg1 = $A/DmgA.value
	dmg2 = $B/DmgB.value
	dmg3 = $C/DmgC.value
	fix = $Fix/FixPrice.value
	replace = $Replace/BuyPrice.value
	
	saveCFG()
	
	var sys = example_sys.duplicate(true)
	sys.damage[0]["current"] = dmg1 #- 100
	sys.damage[1]["current"] = dmg2 #- 100
	sys.damage[2]["current"] = dmg3 #- 100
	var status = Repairs.simulate_status(sys)
	sys.status = status
	var baseVal = Repairs.getSystemPrice(sys)
	var ret = Repairs.handle_operation(sys,fix,replace)
	var postSys = Repairs.simulate_repair(sys,ret[0])
	var postVal = Repairs.getSystemPrice(postSys)
	var txt = "Value before maintenance @ %s%%: %s E$\n\nOptimal repairs: %s | Replace after repairing %s times: [%s]\n\nValue post maintenance to %s%%: %s E$" % [status,formatThousands(baseVal),ret[0],ret[0],str(ret[1]),postSys.status,formatThousands(postVal)]
	$Panel/Label.text = txt

var cfgpath = "user://config.ini"
var file = File.new()
var cfg = ConfigFile.new()
func setupCFG():
	if not file.file_exists(cfgpath):
		cfg.set_value("config","damage_1",0)
		cfg.set_value("config","damage_2",0)
		cfg.set_value("config","damage_3",0)
		cfg.set_value("config","fix_price",1500)
		cfg.set_value("config","buy_price",70000)
		cfg.save(cfgpath)
		cfg.clear()
	cfg.load(cfgpath)
	$A/DmgA.value = cfg.get_value("config","damage_1")
	$B/DmgB.value = cfg.get_value("config","damage_2")
	$C/DmgC.value = cfg.get_value("config","damage_3")
	$Fix/FixPrice.value = cfg.get_value("config","fix_price")
	$Replace/BuyPrice.value = cfg.get_value("config","buy_price")
	cfg.clear()

func saveCFG():
	cfg.load(cfgpath)
	cfg.set_value("config","damage_1",dmg1)
	cfg.set_value("config","damage_2",dmg2)
	cfg.set_value("config","damage_3",dmg3)
	cfg.set_value("config","fix_price",fix)
	cfg.set_value("config","buy_price",replace)
	cfg.save(cfgpath)
	cfg.clear()

func formatThousands(nr):
	var separator = TranslationServer.translate("SEPARATOR_THOUSAND")
	var string = "%d" % abs(nr)
	var mod = string.length() % 3
	var res = ""
	for i in range(0, string.length()):
		if i != 0 and i % 3 == mod:
			res += separator
		res += string[i]
		
	if nr >= 0:
		return res
	else:
		return "-" + res
