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

var dmg1 = 100
var dmg2 = 100
var dmg3 = 100

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
	var ret = Repairs.handle_operation(sys,fix,replace)
	var txt = "Optimal repairs: %s | Replace after repairing %s times: [%s]" % [ret[0],ret[0],str(ret[1])]
	$Panel/Label.text = txt

var cfgpath = "user://config.ini"
var file = File.new()
var cfg = ConfigFile.new()
func setupCFG():
	if not file.file_exists(cfgpath):
		cfg.set_value("config","damage_1",100)
		cfg.set_value("config","damage_2",100)
		cfg.set_value("config","damage_3",100)
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
