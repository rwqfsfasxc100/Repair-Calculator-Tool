extends Node

var fix_price = 0
var replace_price = 0
func handle_operation(system,fx,rx):
	fix_price = fx
	replace_price = rx
	var action_list = appraise_for_cost_efficiency(system)
	return action_list

func appraise_for_cost_efficiency(system):
	var cycles = appriseRequiredRepairSteps(system)
	var action_list = cost_effective_action_list(system,cycles,100)
	
	return action_list

func cost_effective_action_list(system,cycles,targetVal):
	
	var opts = {}
	
	var rx = simulate_repair(system,0)
	var init_status = simulate_status(rx)
	var current = getSystemPrice(rx,true)
	
	
	var replaceCost = (replace_price - current)
	opts.merge({0:{"repair":current,"replace":current - replaceCost,"replace_cost":replaceCost,"repair_cost":0,"status":init_status}})
	for specific_cycle in range(cycles):
		var previous_cost = (specific_cycle * fix_price) + fix_price
		var c = specific_cycle + 1
		if simulate_repair(system,specific_cycle).status >= targetVal:
			break
		var rv = simulate_repair(system,c)
		var sim_status = simulate_status(rv)
		var repair = getSystemPrice(rv,true)
		
		var repair_gain = repair - previous_cost
		
		var replace_cost = replace_price - repair_gain
		var replace_gain = repair_gain - (replace_cost + previous_cost)
		
		opts.merge({c:{"repair":repair_gain,"replace":replace_gain,"replace_cost":replace_cost,"repair_cost":previous_cost,"status":sim_status}})
		
	print("Calculated weights: \n\n",JSON.print(opts,"\t"),"\n\n")
	var best_value = 0
	
	var repairs_to_perform = 0
	var do_replace = false
	
	var replace_cost = 0
	
	for opt in opts:
		var d = opts[opt]
		var rv = d["repair"]
		var rp = d["replace"]
		if rv > best_value:
			best_value = rv
			do_replace = false
			repairs_to_perform = opt
		if rp > best_value:
			best_value = rp
			do_replace = true
			repairs_to_perform = opt
		if do_replace:
			replace_cost = d["replace_cost"]
		else:
			replace_cost = 0
	
	return [repairs_to_perform,do_replace,replace_cost]

func simulate_status(system):
	var damage = system["damage"]
	
	var dmg1 = damage[0]["current"] / damage[0]["max"]
	var dmg2 = damage[1]["current"] / damage[1]["max"]
	var dmg3 = damage[2]["current"] / damage[2]["max"]
	
	var newstatus = clamp(100 - max(max(dmg1, dmg2), dmg3) * 100, 0, 100)
	return newstatus

var repairStepAmount = 0.5

func simulate_repair(system,specific_cycle):
	if specific_cycle == 0:
		return system
	var after_repair = system.duplicate(true)
	after_repair.damage.clear()
	for d in system.damage:
		var newdmg = d.duplicate(true)
		for _i in range(specific_cycle):
			var total = newdmg.current * repairStepAmount
			newdmg.current = total
		after_repair.damage.append(newdmg)
	var current = 0
	var dmg1 = 0.0
	var dmg2 = 0.0
	var dmg3 = 0.0
	for d in after_repair.damage:
		current += 1
		var val = d.current / d.max
		match current:
			1:
				dmg1 = val
			2:
				dmg2 = val
			3:
				dmg3 = val
	if dmg1 > 0.0 and dmg2 > 0.0 and dmg3 > 0.0:
		var newstatus = clamp(100 - max(max(dmg1, dmg2), dmg3) * 100, 0, 100)
		after_repair.status = newstatus
	return after_repair

func getSystemPrice(system,adjust = true):
	var pf = pow(system.status / 100, 2)
	if adjust and pf < 1:
		pf *= 0.8
	return replace_price * pf
	
func appriseRequiredRepairSteps(system):
	var maxSteps = 0
	for d in system.damage:
		var thisSteps = 0
		var damage = d.current
		
		while damage > d.max * (100 - 99.5) / 100:
			damage -= damage * repairStepAmount
			thisSteps += 1
			
		if thisSteps > maxSteps:
			maxSteps = thisSteps
			
	return maxSteps









