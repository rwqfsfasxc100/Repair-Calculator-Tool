extends Node

const DATA = {
	"RCS":{
		"SYSTEM_THRUSTER_K37":{
			"fix":500,
			"replace":3125
		},
		"SYSTEM_THRUSTER_K44":{
			"fix":1000,
			"replace":6250
		},
		"SYSTEM_THRUSTER_K69V":{
			"fix":1500,
			"replace":18600
		},
		"SYSTEM_THRUSTER_MA150HO":{
			"fix":1500,
			"replace":4375
		},
		"SYSTEM_THRUSTER_MA350HO":{
			"fix":3500,
			"replace":10000
		},
		"SYSTEM_THRUSTER_EIT":{
			"fix":3000,
			"replace":8000
		},
		"SYSTEM_THRUSTER_AGILE":{
			"fix":3000,
			"replace":12000
		},
		"SYSTEM_THRUSTER_NDSTR":{
			"fix":200,
			"replace":1250
		},
		"SYSTEM_THRUSTER_NDVTT":{
			"fix":400,
			"replace":2500
		},
		"SYSTEM_THRUSTER_GHET":{
			"fix":3200,
			"replace":8500
		},
		"SYSTEM_THRUSTER_MADTX4":{
			"fix":13000,
			"replace":31250
		},
	},
	"TORCH":{
		"SYSTEM_MAIN_ENGINE_K37":{
			"fix":1000,
			"replace":15000
		},
		"SYSTEM_MAIN_ENGINE_NMPD":{
			"fix":7500,
			"replace":300000
		},
		"SYSTEM_MAIN_ENGINE_NPMP":{
			"fix":15000,
			"replace":700000
		},
		"SYSTEM_MAIN_ENGINE_NDNTR":{
			"fix":8000,
			"replace":30000
		},
		"SYSTEM_MAIN_ENGINE_K44":{
			"fix":2000,
			"replace":40000
		},
		"SYSTEM_MAIN_ENGINE_BWMT535":{
			"fix":5000,
			"replace":120000
		},
		"SYSTEM_MAIN_ENGINE_PNTR":{
			"fix":200,
			"replace":7000
		},
		"SYSTEM_MAIN_ENGINE_DFMPD2205":{
			"fix":2500,
			"replace":175000
		},
		"SYSTEM_MAIN_ENGINE_EIZAP":{
			"fix":30000,
			"replace":1000000
		},
		"SYSTEM_MAIN_ENGINE_CHEVAL":{
			"fix":80000,
			"replace":400000
		},
	},
	"EQUIPMENT":{
		"SYSTEM_MWG":{
			"fix":1500,
			"replace":70000
		},
		"SYSTEM_CL150":{
			"fix":2000,
			"replace":150000
		},
		"SYSTEM_CL600P":{
			"fix":80000,
			"replace":320000
		},
		"SYSTEM_EMD14":{
			"fix":500,
			"replace":10000
		},
		"SYSTEM_EMD17RF":{
			"fix":1500,
			"replace":30000
		},
		"SYSTEM_RAILTOR":{
			"fix":200,
			"replace":20000
		},
		"SYSTEM_EINAT":{
			"fix":7500,
			"replace":100000
		},
		"SYSTEM_NANI":{
			"fix": 30000,
			"replace":300000
		},
		"SYSTEM_SALVAGE_ARM":{
			"fix":1500,
			"replace":56000
		},
		"SYSTEM_PDMWG":{
			"fix":8000,
			"replace":180000
		},
		"SYSTEM_ACTEMD14":{
			"fix":900,
			"replace":32000
		},
		"SYSTEM_ACL200P":{
			"fix":30000,
			"replace":220000
		},
		"SYSTEM_PDT":{
			"fix":40000,
			"replace":135000
		},
		"SYSTEM_IROH":{
			"fix":10000,
			"replace":160000
		}
	},
	"MISC":{
		"SYSTEM_AMD752S":{
			"fix":500,
			"replace":6000
		},
		"SYSTEM_REACTOR":{
			"fix":5000,
			"replace":80000
		},
		"SYSTEM_OE600":{
			"fix":1000,
			"replace":30000
		},
		"SYSTEM_REACTOR_AT225":{
			"fix":12000,
			"replace":120000
		},
		"SYSTEM_REACTOR_EIME":{
			"fix":250000,
			"replace":5000000
		}
	}
}

const TRANSLATIONS = {
	"en":{
		"MISC":"Miscelaneous",
		"EQUIPMENT":"Hardpoint Equipment",
		"TORCH":"Main Drives",
		"RCS":"Reaction Control Systems",
		"SEPARATOR_THOUSAND":",",
		"YES":"Yes",
		"NO":"No",
		
		"SYSTEM_REACTOR":"Nuclear Reactor",
		"SYSTEM_AMD752S":"AMD-752S on-board computer",
		"SYSTEM_OE600":"Obonto 600 on-board computer",
		"SYSTEM_REACTOR_AT225":"THI-K225 nuclear reactor",
		"SYSTEM_REACTOR_EIME":"StarCAT Stellarator",
		
		"SYSTEM_THRUSTER_K37":"RA-K37 thruster",
		"SYSTEM_THRUSTER_K44":"RA-K44 thruster",
		"SYSTEM_THRUSTER_K69V":"RA-K69V thruster",
		"SYSTEM_THRUSTER_MA150HO":"MA150HO thruster",
		"SYSTEM_THRUSTER_MA350HO":"MA350HO thruster",
		"SYSTEM_THRUSTER_EIT":"Eon Interstellar Ion Thruster",
		"SYSTEM_THRUSTER_AGILE":"Eon Interstellar AGILE Thruster",
		"SYSTEM_THRUSTER_NDSTR":"NDSTR thruster",
		"SYSTEM_THRUSTER_NDVTT":"NDVTT thruster",
		"SYSTEM_THRUSTER_GHET":"ERS-NAGHET 5020 thruster",
		"SYSTEM_THRUSTER_MADTX4":"MAD Luciole 1.2 thruster",
		
		"SYSTEM_MAIN_ENGINE_K37":"RA-TNTRL-K37 engine",
		"SYSTEM_MAIN_ENGINE_NMPD":"MA-NMPD42 engine",
		"SYSTEM_MAIN_ENGINE_NPMP":"Experimental NPMP engine",
		"SYSTEM_MAIN_ENGINE_NDNTR":"ND-NTTR thruster",
		"SYSTEM_MAIN_ENGINE_K44":"RA-MHFTR-K44 engine",
		"SYSTEM_MAIN_ENGINE_BWMT535":"BWM-T535 engine",
		"SYSTEM_MAIN_ENGINE_PNTR":"ND-PNTR engine",
		"SYSTEM_MAIN_ENGINE_DFMPD2205":"ERS-DFMHD-2205 engine",
		"SYSTEM_MAIN_ENGINE_EIZAP":"Z-Axial Pinch fusion torch",
		"SYSTEM_MAIN_ENGINE_CHEVAL":"MAD Cheval 5.0 engine",
		
		"SYSTEM_MWG":"MWG microwave emitter",
		"SYSTEM_CL150":"CL-150 mining laser",
		"SYSTEM_CL600P":"CL-600P pulse mining laser",
		"SYSTEM_EMD14":"EMD-14 mass driver",
		"SYSTEM_EMD17RF":"ERFMD-17 mass driver",
		"SYSTEM_RAILTOR":"MPI Railgun MkI",
		"SYSTEM_EINAT":"EINAT Kzinti Lesson MkII",
		"SYSTEM_NANI":"NANI",
		"SYSTEM_SALVAGE_ARM":"AR-1500 Manipulator",
		"SYSTEM_PDMWG":"Point Defence Microwave Generator",
		"SYSTEM_ACTEMD14":"AEMD-14 mass driver",
		"SYSTEM_ACL200P":"CL-200AP pulse mining laser",
		"SYSTEM_PDT":"NDPT-4205 Point Defence Turret",
		"SYSTEM_IROH":"Tetsuo HMX-2000I",
	},
}
