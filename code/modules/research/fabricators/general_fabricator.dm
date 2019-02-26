/obj/machinery/fabricator/general_fabricator
	// Things that must be adjusted for each fabricator
	name = "General Fabricator" // Self-explanatory
	desc = "A general purpose fabricator that can produce a variety of simple equipment." // Self-explanatory
	circuit = /obj/item/weapon/circuitboard/fabricator/genfab // Circuit for the machine. These, as well as their designs, should be defined in fabricator_circuits.dm
	build_type = GENERALFAB // The identifer for what gets built in what fabricator. A new one *MUST* be defined in _defines/research.dm for each fabricator.
						  // More than one can be assigned per design, however, if you want something to be able to be built in more than one fabricator eg. Power Cells
	metal_load_anim = TRUE				// Determines if a sheet loading animation will be applied when loading metals. If you're using a non-standard icon and don't
										// want to sprite a new loading animation as well, set this to FALSE.

	has_reagents = FALSE				// Defaults to FALSE, but added here for explanation. If this is set to true, than you require designs to use reagents
										// in addition to any material costs.


/obj/machinery/fabricator/general_fabricator/can_connect(var/datum/world_faction/trying, var/mob/M)
	if(!trying.limits) return 0
	if(M && !has_access(list(core_access_machine_linking), list(), M.GetAccess(req_access_faction)))
		to_chat(M, "You do not have access to link machines to [trying.name].")
		return 0
	if(trying.limits.limit_genfab <= trying.limits.genfabs.len)
		if(M)
			to_chat(M, "[trying.name] cannot connect any more machines of this type.")
		return 0
	trying.limits.genfabs |= src
	req_access_faction = trying.uid
	connected_faction = src

/obj/machinery/fabricator/general_fabricator/can_disconnect(var/datum/world_faction/trying, var/mob/M)
	if(!trying.limits) return 0
	trying.limits.genfabs -= src
	req_access_faction = ""
	connected_faction = null
	if(M) to_chat(M, "The machine has been disconnected.")


////////////////////////////////////////////////////
//////////////////////DESIGNS///////////////////////
////////////////////////////////////////////////////

/datum/design/item/genfab
	build_type = GENERALFAB 			   // This must match the build_type of the fabricator(s)
	category = "Misc"	 			   // The design will appear under this in the UI. Each design must have a category, or it will not display properly.

	time = 10						   // Time in seconds for the item to be produced - This changes based off the components used in the fabricator


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// CONTAINERS
/datum/design/item/genfab/container
	category = "Containers"
	materials = list(MATERIAL_GLASS = 0.1 SHEET)
/datum/design/item/genfab/container/sci

/datum/design/item/genfab/container/catering
	materials = list(MATERIAL_GLASS = 0.2 SHEET) // these catering bottles are larger and more elaborate

//////////////////////////////////////////////////////////////////////////////////////////////////


/datum/design/item/genfab/container/catering/bottle/gin
	build_path = /obj/item/weapon/reagent_containers/food/drinks/bottle/gin

/datum/design/item/genfab/container/catering/bottle/whiskey
	build_path = /obj/item/weapon/reagent_containers/food/drinks/bottle/whiskey

/datum/design/item/genfab/container/catering/bottle/specialwhiskey
	build_path = /obj/item/weapon/reagent_containers/food/drinks/bottle/specialwhiskey

/datum/design/item/genfab/container/catering/bottle/vodka
	build_path = /obj/item/weapon/reagent_containers/food/drinks/bottle/vodka

/datum/design/item/genfab/container/catering/bottle/tequilla
	build_path = /obj/item/weapon/reagent_containers/food/drinks/bottle/tequilla

/datum/design/item/genfab/container/catering/bottle/bottleofnothing
	build_path = /obj/item/weapon/reagent_containers/food/drinks/bottle/bottleofnothing

/datum/design/item/genfab/container/catering/bottle/patron
	build_path = /obj/item/weapon/reagent_containers/food/drinks/bottle/patron

/datum/design/item/genfab/container/catering/bottle/rum
	build_path = /obj/item/weapon/reagent_containers/food/drinks/bottle/rum

/datum/design/item/genfab/container/catering/bottle/tequilla
	build_path = /obj/item/weapon/reagent_containers/food/drinks/bottle/tequilla

/datum/design/item/genfab/container/catering/bottle/vermouth
	build_path = /obj/item/weapon/reagent_containers/food/drinks/bottle/vermouth

/datum/design/item/genfab/container/catering/bottle/kahlua
	build_path = /obj/item/weapon/reagent_containers/food/drinks/bottle/kahlua

/datum/design/item/genfab/container/catering/bottle/goldschlager
	build_path = /obj/item/weapon/reagent_containers/food/drinks/bottle/goldschlager

/datum/design/item/genfab/container/catering/bottle/cognac
	build_path = /obj/item/weapon/reagent_containers/food/drinks/bottle/cognac

/datum/design/item/genfab/container/catering/bottle/wine
	build_path = /obj/item/weapon/reagent_containers/food/drinks/bottle/wine

/datum/design/item/genfab/container/catering/bottle/absinthe
	build_path = /obj/item/weapon/reagent_containers/food/drinks/bottle/absinthe

/datum/design/item/genfab/container/catering/bottle/melonliquor
	build_path = /obj/item/weapon/reagent_containers/food/drinks/bottle/melonliquor

/datum/design/item/genfab/container/catering/bottle/bluecuracao
	build_path = /obj/item/weapon/reagent_containers/food/drinks/bottle/bluecuracao

/datum/design/item/genfab/container/catering/bottle/herbal
	build_path = /obj/item/weapon/reagent_containers/food/drinks/bottle/herbal

/datum/design/item/genfab/container/catering/bottle/grenadine
	build_path = /obj/item/weapon/reagent_containers/food/drinks/bottle/grenadine

/datum/design/item/genfab/container/catering/bottle/cola
	build_path = /obj/item/weapon/reagent_containers/food/drinks/bottle/cola

/datum/design/item/genfab/container/catering/bottle/space_up
	build_path = /obj/item/weapon/reagent_containers/food/drinks/bottle/space_up

/datum/design/item/genfab/container/catering/bottle/space_mountain_wind
	build_path = /obj/item/weapon/reagent_containers/food/drinks/bottle/space_mountain_wind

/datum/design/item/genfab/container/catering/bottle/pwine
	build_path = /obj/item/weapon/reagent_containers/food/drinks/bottle/pwine
	name = "bottle of wine (skull label)"

/datum/design/item/genfab/container/catering/carton
	materials = list(MATERIAL_CARDBOARD = 0.1 SHEETS)

/datum/design/item/genfab/container/catering/carton/orangejuice
	build_path = /obj/item/weapon/reagent_containers/food/drinks/bottle/orangejuice

/datum/design/item/genfab/container/catering/carton/cream
	build_path = /obj/item/weapon/reagent_containers/food/drinks/bottle/cream

/datum/design/item/genfab/container/catering/carton/tomatojuice
	build_path = /obj/item/weapon/reagent_containers/food/drinks/bottle/tomatojuice

/datum/design/item/genfab/container/catering/carton/limejuice
	build_path = /obj/item/weapon/reagent_containers/food/drinks/bottle/limejuice

/datum/design/item/genfab/container/catering/bottle/small
	materials = list(MATERIAL_GLASS = 0.1 SHEETS)

/datum/design/item/genfab/container/catering/bottle/small/beer
	build_path = /obj/item/weapon/reagent_containers/food/drinks/bottle/small/beer

/datum/design/item/genfab/container/catering/bottle/small/ale
	build_path = /obj/item/weapon/reagent_containers/food/drinks/bottle/small/ale



/datum/design/item/genfab/container/sci/spraybottle
	build_path = /obj/item/weapon/reagent_containers/spray

/datum/design/item/genfab/container/sci/chem_disp_cartridge
	build_path = /obj/item/weapon/reagent_containers/chem_disp_cartridge


/datum/design/item/genfab/container/sci/bucket
	build_path = /obj/item/weapon/reagent_containers/glass/bucket

/datum/design/item/genfab/container/sci/jar
	build_path = /obj/item/glass_jar

/datum/design/item/genfab/container/sci/beaker
	build_path = /obj/item/weapon/reagent_containers/glass/beaker

/datum/design/item/genfab/container/sci/beaker_large
	build_path = /obj/item/weapon/reagent_containers/glass/beaker/large

/datum/design/item/genfab/container/sci/vial
	build_path = /obj/item/weapon/reagent_containers/glass/beaker/vial

/datum/design/item/genfab/container/sci/pillbottle
	build_path = /obj/item/weapon/storage/pill_bottle
	materials = list(MATERIAL_PLASTIC = 0.1 SHEET)

/datum/design/item/genfab/container/sci/syringe
	build_path = /obj/item/weapon/reagent_containers/syringe

/datum/design/item/genfab/container/holywater
	build_path = /obj/item/weapon/reagent_containers/food/drinks/bottle/holywater


/datum/design/item/genfab/container/beerkeg
	build_path = /obj/structure/reagent_dispensers/beerkeg/empty
	materials = list(MATERIAL_STEEL = 0.25 SHEET)

/datum/design/item/genfab/container/sci/dropper
	build_path = /obj/item/weapon/reagent_containers/dropper

/datum/design/item/genfab/container/pitcher
	build_path = /obj/item/weapon/reagent_containers/food/drinks/pitcher

/datum/design/item/genfab/container/carafe
	build_path = /obj/item/weapon/reagent_containers/food/drinks/glass2/carafe

/datum/design/item/genfab/container/coffeecup
	research = "coffeecups"

/datum/design/item/genfab/container/coffeecup/simple
	research = null
	build_path = /obj/item/weapon/reagent_containers/food/drinks/coffeecup
/datum/design/item/genfab/container/coffeecup/simple/black
	build_path = /obj/item/weapon/reagent_containers/food/drinks/coffeecup/black

/datum/design/item/genfab/container/coffeecup/simple/green
	build_path = /obj/item/weapon/reagent_containers/food/drinks/coffeecup/green

/datum/design/item/genfab/container/coffeecup/tall
	build_path = /obj/item/weapon/reagent_containers/food/drinks/coffeecup/tall

/datum/design/item/genfab/container/coffeecup/heart
	build_path = /obj/item/weapon/reagent_containers/food/drinks/coffeecup/heart

/datum/design/item/genfab/container/coffeecup/metal
	build_path = /obj/item/weapon/reagent_containers/food/drinks/coffeecup/metal

/datum/design/item/genfab/container/coffeecup/rainbow
	build_path = /obj/item/weapon/reagent_containers/food/drinks/coffeecup/rainbow

/datum/design/item/genfab/container/coffeecup/NT
	build_path = /obj/item/weapon/reagent_containers/food/drinks/coffeecup/NT

/datum/design/item/genfab/container/coffeecup/STC
	build_path = /obj/item/weapon/reagent_containers/food/drinks/coffeecup/STC

/datum/design/item/genfab/container/coffeecup/SCG
	build_path = /obj/item/weapon/reagent_containers/food/drinks/coffeecup/SCG

/datum/design/item/genfab/container/coffeecup/one
	build_path = /obj/item/weapon/reagent_containers/food/drinks/coffeecup/one

/datum/design/item/genfab/container/coffeecup/pawn
	build_path = /obj/item/weapon/reagent_containers/food/drinks/coffeecup/pawn

/datum/design/item/genfab/container/coffeecup/britcup
	build_path = /obj/item/weapon/reagent_containers/food/drinks/coffeecup/britcup


/datum/design/item/genfab/container/coffeecup/diona
	build_path = /obj/item/weapon/reagent_containers/food/drinks/coffeecup/diona


/datum/design/item/genfab/container/drinkingglass
	build_path = /obj/item/weapon/reagent_containers/food/drinks/glass2/square

/datum/design/item/genfab/container/drinkingglass/rocks
	build_path = /obj/item/weapon/reagent_containers/food/drinks/glass2/rocks

/datum/design/item/genfab/container/drinkingglass/shake
	build_path = /obj/item/weapon/reagent_containers/food/drinks/glass2/shake

/datum/design/item/genfab/container/drinkingglass/cocktail
	build_path = /obj/item/weapon/reagent_containers/food/drinks/glass2/cocktail

/datum/design/item/genfab/container/drinkingglass/shot
	build_path = /obj/item/weapon/reagent_containers/food/drinks/glass2/shot

/datum/design/item/genfab/container/drinkingglass/pint
	build_path = /obj/item/weapon/reagent_containers/food/drinks/glass2/pint

/datum/design/item/genfab/container/drinkingglass/mug
	build_path = /obj/item/weapon/reagent_containers/food/drinks/glass2/mug

/datum/design/item/genfab/container/drinkingglass/wine
	build_path = /obj/item/weapon/reagent_containers/food/drinks/glass2/wine

/datum/design/item/genfab/container/drinkingglass/shaker
	build_path = /obj/item/weapon/reagent_containers/food/drinks/shaker

/datum/design/item/genfab/container/drinkingglass/teapot
	build_path = /obj/item/weapon/reagent_containers/food/drinks/teapot

/datum/design/item/genfab/container/drinkingglass/pitcher
	build_path = /obj/item/weapon/reagent_containers/food/drinks/pitcher

/datum/design/item/genfab/container/drinkingglass/flask
	build_path = /obj/item/weapon/reagent_containers/food/drinks/flask
	materials = list(MATERIAL_STEEL = 0.2 SHEET)
	research = "flasks"
/datum/design/item/genfab/container/drinkingglass/flask/shiny
	build_path = /obj/item/weapon/reagent_containers/food/drinks/flask/shiny


/datum/design/item/genfab/container/drinkingglass/flask/lithium
	build_path = /obj/item/weapon/reagent_containers/food/drinks/flask/lithium


/datum/design/item/genfab/container/drinkingglass/flask/detflask
	build_path = /obj/item/weapon/reagent_containers/food/drinks/flask/detflask

/datum/design/item/genfab/container/drinkingglass/flask/barflask
	build_path = /obj/item/weapon/reagent_containers/food/drinks/flask/barflask

/datum/design/item/genfab/container/drinkingglass/flask/vacuumflask
	build_path = /obj/item/weapon/reagent_containers/food/drinks/flask/vacuumflask

/datum/design/item/genfab/container/drinkingglass/flask/fitnessflask
	build_path = /obj/item/weapon/reagent_containers/food/drinks/glass2/fitnessflask


/datum/design/item/genfab/container/sci/pills
	build_path = /obj/item/weapon/reagent_containers/pill
	materials = list(MATERIAL_PLASTIC = 0.1 SHEET)


/datum/design/item/genfab/container/sci/beaker/noreact
	req_tech = list(TECH_MATERIAL = 2)
	materials = list(MATERIAL_STEEL = 1 SHEET, MATERIAL_PHORON = 1 SHEET)
	build_path = /obj/item/weapon/reagent_containers/glass/beaker/noreact
	research = "cryostasis_beaker"
/datum/design/item/genfab/container/sci/beaker/bluespace
	req_tech = list(TECH_BLUESPACE = 2, TECH_MATERIAL = 6)
	materials = list(MATERIAL_STEEL = 2 SHEETS, MATERIAL_PHORON = 2 SHEETS, MATERIAL_DIAMOND = 1 SHEET)
	build_path = /obj/item/weapon/reagent_containers/glass/beaker/bluespace
	research = "bluespace_beaker"

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// MEDICAL EQUIPMENT

/datum/design/item/genfab/meditools
	category = "Medical Equipment"

/datum/design/item/genfab/meditools/adv

//////////////////////////////////////////////////////////////////////////

/datum/design/item/genfab/meditools/penlight
	build_path = /obj/item/device/flashlight/pen
	materials = list(MATERIAL_STEEL = 0.1 SHEETS)

/datum/design/item/genfab/meditools/autopsy_scanner
	build_path = /obj/item/weapon/autopsy_scanner
	materials = list(MATERIAL_STEEL = 2 SHEETS, MATERIAL_COPPER = 1 SHEETS)

/datum/design/item/genfab/meditools/bodybag
	build_path = /obj/item/bodybag
	materials = list(MATERIAL_PLASTIC = 4 SHEETS)


/datum/design/item/genfab/meditools/scalpel
	build_path = /obj/item/weapon/scalpel
	materials = list(MATERIAL_STEEL = 1 SHEETS)

/datum/design/item/genfab/meditools/circularsaw
	build_path = /obj/item/weapon/circular_saw
	materials = list(MATERIAL_STEEL = 3 SHEETS, MATERIAL_COPPER = 0.5 SHEETS)

/datum/design/item/genfab/meditools/bonesetter
	build_path = /obj/item/weapon/bonesetter
	materials = list(MATERIAL_STEEL = 1 SHEETS)

/datum/design/item/genfab/meditools/surgicaldrill
	build_path = /obj/item/weapon/surgicaldrill
	materials = list(MATERIAL_STEEL = 2 SHEETS, MATERIAL_COPPER = 0.5 SHEETS)

/datum/design/item/genfab/meditools/retractor
	build_path = /obj/item/weapon/retractor
	materials = list(MATERIAL_STEEL = 1 SHEETS)

/datum/design/item/genfab/meditools/cautery
	build_path = /obj/item/weapon/cautery
	materials = list(MATERIAL_STEEL = 2 SHEETS, MATERIAL_COPPER = 0.5 SHEETS)

/datum/design/item/genfab/meditools/hemostat
	build_path = /obj/item/weapon/hemostat
	materials = list(MATERIAL_STEEL = 1 SHEETS)

/datum/design/item/genfab/meditools/virusdish
	build_path = /obj/item/weapon/virusdish
	materials = list(MATERIAL_GLASS = 0.25 SHEETS)

/datum/design/item/genfab/meditools/adv/bloodpack
	build_path = /obj/item/weapon/reagent_containers/blood/empty
	materials = list(MATERIAL_PLASTIC = 0.25 SHEETS)

/datum/design/item/genfab/meditools/adv/syringe_cartridge
	build_path = /obj/item/weapon/syringe_cartridge
	materials = list(MATERIAL_STEEL = 0.1 SHEETS)
	research = "syringe_gun"
/datum/design/item/genfab/meditools/adv/syringe_gun
	build_path = /obj/item/weapon/gun/launcher/syringe
	materials = list(MATERIAL_STEEL = 5 SHEETS, MATERIAL_GLASS = 3 SHEETS, MATERIAL_COPPER = 2 SHEETS, MATERIAL_SILVER = 2 SHEETS)
	research = "syringe_gun"
/datum/design/item/genfab/meditools/adv/syringe_gun/rapid
	build_path = /obj/item/weapon/gun/launcher/syringe/rapid
	materials = list(MATERIAL_STEEL = 8 SHEETS, MATERIAL_GLASS = 5 SHEETS, MATERIAL_COPPER = 5 SHEETS, MATERIAL_SILVER = 5 SHEETS)
	research = "rapid_syringe_gun"





/datum/design/item/genfab/meditools/adv/FixOVein
	build_path = /obj/item/weapon/FixOVein
	materials = list(MATERIAL_CLOTH = 1 SHEETS, MATERIAL_GLASS = 1 SHEETS)
/datum/design/item/genfab/meditools/adv/bonegel
	build_path = /obj/item/weapon/bonegel
	materials = list(MATERIAL_CLOTH = 1 SHEETS, MATERIAL_GLASS = 1 SHEETS)


/datum/design/item/genfab/meditools/adv/hud
	materials = list(MATERIAL_STEEL = 0.25 SHEETS, MATERIAL_GLASS = 0.5 SHEETS)

/datum/design/item/genfab/meditools/adv/hud/AssembleDesignName()
	..()

/datum/design/item/genfab/meditools/adv/hud/AssembleDesignDesc()
	desc = "Allows for the construction of \a [item_name] HUD glasses."

/datum/design/item/genfab/meditools/adv/hud/health
	build_path = /obj/item/clothing/glasses/hud/health


/datum/design/item/genfab/meditools/healthscanner
	build_path = /obj/item/device/healthanalyzer
	materials = list(MATERIAL_STEEL = 3 SHEET, MATERIAL_GLASS = 0.5 SHEETS, MATERIAL_COPPER = 1 SHEETS)
	research = "health_scanner"

/datum/design/item/genfab/meditools/adv/robot_scanner
	materials = list(MATERIAL_STEEL = 3 SHEET, MATERIAL_GLASS = 0.5 SHEETS, MATERIAL_COPPER = 0.5 SHEETS)
	build_path = /obj/item/device/robotanalyzer


/datum/design/item/genfab/meditools/adv/mass_spectrometer
	build_path = /obj/item/device/mass_spectrometer
	materials = list(MATERIAL_STEEL = 3 SHEET, MATERIAL_GLASS = 1 SHEETS, MATERIAL_COPPER = 2 SHEETS)
	research = "mass_spectrometer"


/datum/design/item/genfab/meditools/adv/adv_mass_spectrometer
	build_path = /obj/item/device/mass_spectrometer/adv
	materials = list(MATERIAL_STEEL = 5 SHEET, MATERIAL_GLASS = 3 SHEETS, MATERIAL_SILVER = 5 SHEETS)
	research = "adv_mass_spectrometer"


/datum/design/item/genfab/meditools/adv/reagent_scanner
	build_path = /obj/item/device/reagent_scanner
	materials = list(MATERIAL_STEEL = 3 SHEET, MATERIAL_GLASS = 1 SHEETS, MATERIAL_COPPER = 2 SHEETS)
	research = "reagent_scanner"


//datum/design/item/genfab/meditools/adv/adv_reagent_scanner
	build_path = /obj/item/device/reagent_scanner/adv
	materials = list(MATERIAL_STEEL = 5 SHEET, MATERIAL_GLASS = 3 SHEETS, MATERIAL_SILVER = 5 SHEETS)
	research = "adv_reagent_scanner"


/datum/design/item/genfab/meditools/adv/slime_scanner
	build_path = /obj/item/device/slime_scanner
	materials = list(MATERIAL_STEEL = 1 SHEET, MATERIAL_GLASS = 0.5 SHEETS, MATERIAL_COPPER = 0.5 SHEETS)


/datum/design/item/genfab/meditools/adv/scalpel_laser1
	name = "Basic Laser Scalpel"
	desc = "A scalpel augmented with a directed laser, for more precise cutting without blood entering the field. This one looks basic and could be improved."
	req_tech = list(TECH_BIO = 2, TECH_MATERIAL = 2, TECH_MAGNET = 2)
	build_path = /obj/item/weapon/scalpel/laser1
	research = "scalpel_1"


/datum/design/item/genfab/meditools/adv/scalpel_laser2
	name = "Improved Laser Scalpel"
	desc = "A scalpel augmented with a directed laser, for more precise cutting without blood entering the field. This one looks somewhat advanced."
	req_tech = list(TECH_BIO = 3, TECH_MATERIAL = 4, TECH_MAGNET = 4)
	materials = list(MATERIAL_STEEL = 4 SHEETS, MATERIAL_GLASS = 3 SHEETS, MATERIAL_SILVER = 1 SHEETS)
	build_path = /obj/item/weapon/scalpel/laser2
	research = "scalpel_2"


/datum/design/item/genfab/meditools/adv/scalpel_laser3
	name = "Advanced Laser Scalpel"
	desc = "A scalpel augmented with a directed laser, for more precise cutting without blood entering the field. This one looks to be the pinnacle of precision energy cutlery!"
	req_tech = list(TECH_BIO = 4, TECH_MATERIAL = 6, TECH_MAGNET = 5)
	materials = list(MATERIAL_STEEL = 6 SHEETS, MATERIAL_GLASS = 5 SHEETS, MATERIAL_SILVER = 3 SHEETS, MATERIAL_DIAMOND = 1 SHEET)
	build_path = /obj/item/weapon/scalpel/laser3
	research = "scalpel_3"


/datum/design/item/genfab/meditools/adv/scalpel_manager
	desc = "A true extension of the surgeon's body, this marvel instantly and completely prepares an incision allowing for the immediate commencement of therapeutic steps."
	req_tech = list(TECH_BIO = 4, TECH_MATERIAL = 7, TECH_MAGNET = 5, TECH_DATA = 4)
	materials = list (MATERIAL_STEEL = 8 SHEET, MATERIAL_GLASS = 6 SHEET, MATERIAL_SILVER = 5 SHEET, MATERIAL_DIAMOND = 2 SHEET, MATERIAL_PHORON = 1 SHEET)
	build_path = /obj/item/weapon/scalpel/manager
	research = "scalpel_4"


/datum/design/item/genfab/meditools/adv/defib
	name = "auto-resuscitator"
	req_tech = list(TECH_BIO = 5, TECH_ENGINEERING = 3, TECH_POWER = 4)
	materials = list(MATERIAL_STEEL = 4 SHEETS, MATERIAL_GLASS = 3 SHEETS, MATERIAL_GOLD = 2 SHEETS, MATERIAL_SILVER = 1 SHEET)
	chemicals = list(/datum/reagent/acid = 20)
	build_path = /obj/item/weapon/defibrillator
	research = "defib"


/datum/design/item/genfab/meditools/adv/defib_compact
	name = "compact auto-resuscitator"
	req_tech = list(TECH_BIO = 5, TECH_ENGINEERING = 5, TECH_POWER = 6)
	materials = list(MATERIAL_STEEL = 4 SHEETS, MATERIAL_GLASS = 3 SHEETS, MATERIAL_GOLD = 3 SHEETS, MATERIAL_SILVER = 3 SHEETS, MATERIAL_PHORON = 2 SHEETS)
	chemicals = list(/datum/reagent/acid = 80)
	build_path = /obj/item/weapon/defibrillator/compact
	research = "defib_compact"


/datum/design/item/genfab/meditools/lmi
	name = "Lace-machine interface"
	id = "lmi"
	req_tech = list(TECH_DATA = 2, TECH_BIO = 3)
	materials = list(MATERIAL_STEEL = 0.5 SHEET, MATERIAL_GLASS = 0.5 SHEET)
	build_path = /obj/item/device/lmi


/datum/design/item/genfab/meditools/adv/lmi_radio
	name = "Radio-enabled lace-machine interface"
	id = "lmi_radio"
	req_tech = list(TECH_DATA = 2, TECH_BIO = 4)
	materials = list(MATERIAL_STEEL = 2 SHEET, MATERIAL_GLASS = 1 SHEET, MATERIAL_COPPER = 1 SHEET)
	build_path = /obj/item/device/lmi/radio_enabled


/datum/design/item/genfab/meditools/stethoscope
	name = "Stethoscope"
	materials = list(MATERIAL_STEEL = 0.5 SHEET)
	build_path = /obj/item/clothing/accessory/stethoscope


/datum/design/item/genfab/meditools/implants/tracking
	materials = list(MATERIAL_STEEL = 1 SHEET, MATERIAL_SILVER = 2 SHEETS, MATERIAL_COPPER = 1 SHEETS, MATERIAL_PHORON = 0.5 SHEET)
	build_path = /obj/item/weapon/implant/tracking
	research = "implant_tracking"


/datum/design/item/genfab/meditools/implants/compressed
	materials = list(MATERIAL_STEEL = 4 SHEET, MATERIAL_SILVER = 8 SHEETS, MATERIAL_COPPER = 4 SHEETS, MATERIAL_PHORON = 5 SHEET, MATERIAL_URANIUM = 5 SHEET)
	build_path = /obj/item/weapon/implant/compressed
	research = "implant_compressed"


/datum/design/item/genfab/meditools/implants/biomonitor
	materials = list(MATERIAL_STEEL = 2 SHEET, MATERIAL_SILVER = 4 SHEETS, MATERIAL_COPPER = 2 SHEETS, MATERIAL_PHORON = 0.5 SHEET)
	build_path = /obj/item/weapon/implant/death_alarm/trauma
	research = "implant_biomonitor"


/datum/design/item/genfab/meditools/implants/adrenalin
	materials = list(MATERIAL_STEEL = 2 SHEET, MATERIAL_SILVER = 3 SHEETS, MATERIAL_COPPER = 2 SHEETS, MATERIAL_PHORON = 0.5 SHEET)
	build_path = /obj/item/weapon/implant/adrenalin
	research = "implant_adrenalin"


/datum/design/item/genfab/meditools/implants/chem
	materials = list(MATERIAL_STEEL = 2 SHEET, MATERIAL_SILVER = 3 SHEETS, MATERIAL_COPPER = 2 SHEETS, MATERIAL_PHORON = 0.5 SHEET)
	build_path = /obj/item/weapon/implant/chem
	research = "implant_chem"


/datum/design/item/genfab/meditools/implants/implantpad
	materials = list(MATERIAL_STEEL = 4 SHEET, MATERIAL_GLASS = 2 SHEET, MATERIAL_COPPER = 1 SHEETS)
	build_path = /obj/item/weapon/implantpad

/datum/design/item/genfab/meditools/implants/implanter
	materials = list(MATERIAL_STEEL = 3 SHEET, MATERIAL_COPPER = 2 SHEETS)
	build_path = /obj/item/weapon/implanter

/datum/design/item/genfab/meditools/implants/implantcase
	materials = list(MATERIAL_GLASS = 1 SHEET)
	build_path = /obj/item/weapon/implantcase

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/** 
// REJECTED DUE TO ITEM BEING UNDERDEVELOPED
/datum/design/item/genfab/weapons/guns/energy/simple
	materials = list(MATERIAL_STEEL = 8 SHEETS, MATERIAL_GLASS = 3 SHEETS, MATERIAL_GOLD = 3 SHEETS,  MATERIAL_PHORON = 2 SHEETS)
	build_path = /obj/item/weapon/gun/energy
	
	
/datum/design/item/genfab/weapons/guns/temp_gun
	req_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 4, TECH_POWER = 3, TECH_MAGNET = 2)
	materials = list(MATERIAL_STEEL = 4 SHEETS, MATERIAL_GLASS = 3 SHEETS, MATERIAL_SILVER = 5 SHEETS, MATERIAL_PHORON = 1 SHEET)
	build_path = /obj/item/weapon/gun/energy/temperature

	
// REJECTED DUE TO IRRADIATION MECHANICS BEING POORLY UNDERSTOOD
/datum/design/item/genfab/weapons/guns/phoronpistol
	req_tech = list(TECH_COMBAT = 5, TECH_PHORON = 4)
	materials = list(MATERIAL_STEEL = 1.5 SHEETS, MATERIAL_GLASS = 1 SHEET, MATERIAL_URANIUM = 2 SHEETS, MATERIAL_PHORON = 4 SHEETS)
	build_path = /obj/item/weapon/gun/energy/toxgun

/datum/design/item/genfab/weapons/guns/decloner
	req_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 7, TECH_BIO = 5, TECH_POWER = 6)
	materials = list(MATERIAL_STEEL = 8 SHEETS, MATERIAL_GOLD = 6 SHEETS,MATERIAL_URANIUM = 12 SHEETS)
	chemicals = list(/datum/reagent/mutagen = 40)
	build_path = /obj/item/weapon/gun/energy/decloner

/datum/design/item/genfab/weapons/guns/nuclear_gun
	materials = list(MATERIAL_PLASTEEL = 8 SHEETS, MATERIAL_GLASS = 2 SHEETS, MATERIAL_GOLD = 8 SHEETS, MATERIAL_URANIUM = 10 SHEETS, MATERIAL_PHORON = 5 SHEETS)
	build_path = /obj/item/weapon/gun/energy/gun/nuclear

// grenade launchers are not needed at this moment

/datum/design/item/genfab/weapons/guns/automatic/z8
	materials = list(MATERIAL_STEEL = 15 SHEETS, MATERIAL_GOLD = 12 SHEETS, MATERIAL_DIAMOND = 8 SHEETS, MATERIAL_URANIUM = 5 SHEETS, MATERIAL_PHORON = 5 SHEETS)
	build_path = /obj/item/weapon/gun/projectile/automatic/z8


/datum/design/item/genfab/weapons/launcher/grenade
	build_path = /obj/item/weapon/gun/launcher/grenade
	materials = list(MATERIAL_STEEL = 8 SHEETS, MATERIAL_GLASS = 2 SHEETS, MATERIAL_SILVER = 2 SHEETS, MATERIAL_GOLD = 2 SHEETS, MATERIAL_DIAMOND = 4 SHEETS, MATERIAL_PHORON = 0.5 SHEET)

// icons are a bit ugly
	
/datum/design/item/genfab/weapons/hook
	build_path = /obj/item/weapon/material/knife/hook
	materials = list(MATERIAL_STEEL = 3 SHEETS)

/datum/design/item/genfab/weapons/ritualdagger
	build_path = /obj/item/weapon/material/knife/ritual
	materials = list(MATERIAL_STEEL = 3 SHEETS)

	
	
**/


// WEAPONS

/datum/design/item/genfab/weapons
	category = "Weapons"

/datum/design/item/genfab/weapons/guns
	category = "Guns"

/datum/design/item/genfab/weapons/grenades
	category = "Grenades"

/datum/design/item/genfab/weapons/illegal
	category = "Restricted Devices"

////////////////////////////////////////////////////////////////////

///////Grenades

/datum/design/item/genfab/weapons/grenades/smoke
	materials = list(MATERIAL_STEEL = 5 SHEETS, MATERIAL_GOLD = 2 SHEETS)
	build_path = /obj/item/weapon/grenade/smokebomb
	research = "grenade_smoke"
/datum/design/item/genfab/weapons/grenades/empgrenade
	materials = list(MATERIAL_STEEL = 5 SHEETS, MATERIAL_GOLD = 4 SHEETS, MATERIAL_COPPER = 4 SHEETS)
	build_path = /obj/item/weapon/grenade/empgrenade
	research = "grenade_emp"
/datum/design/item/genfab/weapons/grenades/frag
	materials = list(MATERIAL_STEEL = 5 SHEETS, MATERIAL_GOLD = 5 SHEETS, MATERIAL_PHORON = 2 SHEETS)
	build_path = /obj/item/weapon/grenade/frag
	research = "grenade_frag"
/datum/design/item/genfab/weapons/grenades/flashbang
	materials = list(MATERIAL_STEEL = 5 SHEETS, MATERIAL_GOLD = 2 SHEETS, MATERIAL_COPPER = 2 SHEETS)
	build_path = /obj/item/weapon/grenade/flashbang
	research = "grenade_flash"
/datum/design/item/genfab/weapons/grenades/chem_grenade
	materials = list(MATERIAL_STEEL = 4 SHEETS, MATERIAL_SILVER = 0.5 SHEETS)
	build_path = /obj/item/weapon/grenade/chem_grenade
	research = "grenade_chem"
/datum/design/item/genfab/weapons/grenades/anti_photon
	materials = list(MATERIAL_STEEL = 5 SHEETS, MATERIAL_GOLD = 5 SHEETS, MATERIAL_PHORON = 0.5 SHEETS, MATERIAL_URANIUM = 0.5 SHEETS)
	build_path = /obj/item/weapon/grenade/anti_photon
	research = "grenade_photon"

/datum/design/item/genfab/weapons/grenades/large_grenade
	materials = list(MATERIAL_STEEL = 6 SHEETS, MATERIAL_SILVER = 1 SHEET)
	build_path = /obj/item/weapon/grenade/chem_grenade/large



// END GRENADES


// Stun weapons

/datum/design/item/genfab/weapons/guns/taser // tier 0
	materials = list(MATERIAL_STEEL = 3 SHEETS, MATERIAL_GLASS = 2 SHEETS, MATERIAL_COPPER = 4 SHEETS)
	build_path = /obj/item/weapon/gun/energy/taser

/datum/design/item/genfab/weapons/guns/taser/carbine // tier 1
	materials = list(MATERIAL_STEEL = 8 SHEETS, MATERIAL_GLASS = 5 SHEETS, MATERIAL_COPPER = 6.5 SHEETS)
	build_path = /obj/item/weapon/gun/energy/stunrevolver/rifle


/datum/design/item/genfab/weapons/guns/stunrevolver // tier 2
	materials = list(MATERIAL_STEEL = 5 SHEETS, MATERIAL_COPPER = 4 SHEETS, MATERIAL_GOLD = 2 SHEETS)
	build_path = /obj/item/weapon/gun/energy/stunrevolver

/datum/design/item/genfab/weapons/guns/stunrevolver/rifle // tier 2.5
	materials = list(MATERIAL_STEEL = 10 SHEETS, MATERIAL_COPPER = 6.5 SHEETS, MATERIAL_GOLD = 4 SHEETS)
	build_path = /obj/item/weapon/gun/energy/stunrevolver/rifle


/datum/design/item/genfab/weapons/guns/plasmastun // tier 3
	materials = list(MATERIAL_STEEL = 10 SHEETS, MATERIAL_GOLD = 4 SHEETS, MATERIAL_URANIUM = 4 SHEETS, MATERIAL_DIAMOND = 1 SHEET)
	build_path = /obj/item/weapon/gun/energy/plasmastun

// END STUN WEAPONS



// BALLISTICS WEAPONS

/datum/design/item/genfab/weapons/guns/pistol // tier 0
	materials = list(MATERIAL_STEEL = 4 SHEETS, MATERIAL_GOLD = 1.5 SHEETS, MATERIAL_COPPER = 1.5 SHEETS)
	build_path = /obj/item/weapon/gun/projectile/sec

/datum/design/item/genfab/weapons/guns/colt/officer // tier 1 RESKIN of pistol
	materials = list(MATERIAL_STEEL = 4 SHEETS, MATERIAL_GOLD = 1.5 SHEETS, MATERIAL_COPPER = 1.5 SHEETS)
	build_path = /obj/item/weapon/gun/projectile/colt/officer
	research = "pistol_1"
/datum/design/item/genfab/weapons/guns/colt/detective // tier 1 RESKIN of pistol
	materials = list(MATERIAL_STEEL = 4 SHEETS, MATERIAL_GOLD = 1.5 SHEETS, MATERIAL_COPPER = 1.5 SHEETS)
	build_path = /obj/item/weapon/gun/projectile/colt/detective
	research = "pistol_1"

/datum/design/item/genfab/weapons/guns/pistol/holdout // tier 1
	materials = list(MATERIAL_STEEL = 3 SHEETS, MATERIAL_GOLD = 1.3 SHEETS, MATERIAL_COPPER = 1.3 SHEETS)
	build_path = /obj/item/weapon/gun/projectile/pistol
	research = "pistol_1"
/datum/design/item/genfab/weapons/guns/revolver // tier 1
	materials = list(MATERIAL_STEEL = 6 SHEETS, MATERIAL_GOLD = 3 SHEETS, MATERIAL_COPPER = 2.5 SHEETS)
	build_path = /obj/item/weapon/gun/projectile/revolver
	research = "pistol_1"
/datum/design/item/genfab/weapons/guns/shotgun/doublebarrel // tier 1.5
	materials = list(MATERIAL_STEEL = 4 SHEETS, MATERIAL_WOOD = 4 SHEETS, MATERIAL_GOLD = 3.5 SHEET, MATERIAL_COPPER = 3 SHEET)
	build_path = /obj/item/weapon/gun/projectile/shotgun/doublebarrel
	research = "shotgun_1"
/datum/design/item/genfab/weapons/guns/shotgun/pump // tier 2
	materials = list(MATERIAL_STEEL = 8 SHEETS, MATERIAL_GOLD = 4 SHEETS, MATERIAL_DIAMOND = 1 SHEETS)
	build_path = /obj/item/weapon/gun/projectile/shotgun/pump
	research = "shotgun_2"
/datum/design/item/genfab/weapons/guns/automatic/uzi // tier 2.5
	materials = list(MATERIAL_STEEL = 5 SHEETS, MATERIAL_GOLD = 5 SHEETS, MATERIAL_DIAMOND = 2 SHEETS)
	build_path = /obj/item/weapon/gun/projectile/automatic/machine_pistol
	research = "autos_1"
/datum/design/item/genfab/weapons/guns/automatic/wt550 // tier 2.5
	materials = list(MATERIAL_STEEL = 7 SHEETS, MATERIAL_GOLD = 7 SHEETS, MATERIAL_DIAMOND = 4 SHEETS)
	build_path = /obj/item/weapon/gun/projectile/automatic/wt550
	research = "autos_1"
/datum/design/item/genfab/weapons/guns/shotgun/combat // tier 3
	materials = list(MATERIAL_STEEL = 10 SHEETS, MATERIAL_GOLD = 8 SHEETS, MATERIAL_DIAMOND = 4 SHEETS)
	build_path = /obj/item/weapon/gun/projectile/shotgun/doublebarrel
	research = "shotgun_3"
/datum/design/item/genfab/weapons/guns/automatic/c20r // tier 3.5
	materials = list(MATERIAL_PLASTEEL = 8 SHEETS, MATERIAL_GOLD = 8 SHEETS, MATERIAL_DIAMOND = 5 SHEETS, MATERIAL_PHORON = 2 SHEETS)
	build_path = /obj/item/weapon/gun/projectile/automatic/c20r
	research = "autos_2"
/datum/design/item/genfab/weapons/guns/automatic/revolver/mateba // tier 3.5
	materials = list(MATERIAL_PLASTEEL = 6 SHEETS, MATERIAL_GOLD = 5 SHEETS, MATERIAL_DIAMOND = 4 SHEETS, MATERIAL_PHORON = 1 SHEETS)
	build_path = /obj/item/weapon/gun/projectile/revolver/mateba
	research = "pistol_1"
/datum/design/item/genfab/weapons/guns/automatic/sts35 // tier 4
	materials = list(MATERIAL_PLASTEEL = 12 SHEETS, MATERIAL_GOLD = 10 SHEETS, MATERIAL_DIAMOND = 8 SHEETS, MATERIAL_PHORON = 4 SHEETS)
	build_path = /obj/item/weapon/gun/projectile/automatic/sts35
	research = "autos_3"
/datum/design/item/genfab/weapons/guns/automatic/heavysniper // tier 4
	materials = list(MATERIAL_PLASTEEL = 10 SHEETS, MATERIAL_GOLD = 8 SHEETS, MATERIAL_DIAMOND = 3 SHEETS, MATERIAL_PHORON = 11 SHEETS)
	build_path = /obj/item/weapon/gun/projectile/heavysniper
	research = "antimaterial"


// END BALLISTIC WEAPONS




// ENERGY WEAPONS


/datum/design/item/genfab/weapons/guns/energy/small // TIER 2
	materials = list(MATERIAL_PLASTEEL = 4 SHEETS, MATERIAL_GOLD = 2 SHEETS, MATERIAL_PHORON = 1 SHEETS, MATERIAL_DIAMOND = 1 SHEETS)
	build_path = /obj/item/weapon/gun/energy/gun/small
	research = "energy_1"

/datum/design/item/genfab/weapons/guns/energy // TIER 2.5
	materials = list(MATERIAL_PLASTEEL = 6 SHEETS, MATERIAL_GOLD = 4 SHEETS, MATERIAL_PHORON = 2 SHEETS, MATERIAL_DIAMOND = 1 SHEETS)
	build_path = /obj/item/weapon/gun/energy/gun
	research = "energy_1"

/datum/design/item/genfab/weapons/guns/xray/pistol // tier 3
	materials = list(MATERIAL_PLASTEEL = 6 SHEETS, MATERIAL_GOLD = 4 SHEETS, MATERIAL_PHORON = 2 SHEETS, MATERIAL_URANIUM = 1 SHEETS)
	build_path = /obj/item/weapon/gun/energy/xray/pistol
	research = "xray_1"

/datum/design/item/genfab/weapons/guns/xray // tier 3.5
	materials = list(MATERIAL_PLASTEEL = 8 SHEETS, MATERIAL_GOLD = 6 SHEETS, MATERIAL_PHORON = 4 SHEETS, MATERIAL_URANIUM = 2 SHEETS)
	build_path = /obj/item/weapon/gun/energy/xray
	research = "xray_1"

/datum/design/item/genfab/weapons/guns/laser_carbine // tier 3.5
	materials = list(MATERIAL_PLASTEEL = 8 SHEETS, MATERIAL_GOLD = 6 SHEETS, MATERIAL_PHORON = 4 SHEETS, MATERIAL_DIAMOND = 2 SHEETS)
	build_path = /obj/item/weapon/gun/energy/laser
	research = "energy_2"

/datum/design/item/genfab/weapons/guns/energy/ionrifle/pistol // tier 3.5
	materials = list(MATERIAL_PLASTEEL = 6 SHEETS, MATERIAL_SILVER = 5 SHEETS, MATERIAL_PHORON = 4 SHEETS, MATERIAL_DIAMOND = 4 SHEETS)
	build_path = /obj/item/weapon/gun/energy/ionrifle/small
	research = "ion_1"
/datum/design/item/genfab/weapons/guns/energy/ionrifle // tier 4
	materials = list(MATERIAL_PLASTEEL = 10 SHEETS, MATERIAL_SILVER = 10 SHEETS, MATERIAL_PHORON = 8 SHEETS, MATERIAL_DIAMOND = 8 SHEETS)
	build_path = /obj/item/weapon/gun/energy/ionrifle
	research = "ion_2"

/datum/design/item/genfab/weapons/guns/energy/sniper // tier 4
	materials = list(MATERIAL_PLASTEEL = 10 SHEETS, MATERIAL_GOLD = 10 SHEETS, MATERIAL_PHORON = 10 SHEETS, MATERIAL_DIAMOND = 5 SHEETS)
	build_path = /obj/item/weapon/gun/energy/sniperrifle
	research = "energy_3"

/datum/design/item/genfab/weapons/guns/lasercannon // tier 4
	req_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 3, TECH_POWER = 3)
	materials = list(MATERIAL_PLASTEEL = 10 SHEETS, MATERIAL_GOLD = 8 SHEETS, MATERIAL_DIAMOND = 5 SHEETS, MATERIAL_URANIUM = 5 SHEETS, MATERIAL_PHORON = 5 SHEETS)
	build_path = /obj/item/weapon/gun/energy/lasercannon
	research = "energy_3"
/datum/design/item/genfab/weapons/guns/pulse/pistol // tier 4
	materials = list(MATERIAL_PLASTEEL = 8 SHEETS, MATERIAL_GOLD = 10 SHEETS, MATERIAL_PHORON = 6 SHEETS, MATERIAL_DIAMOND = 4 SHEETS, MATERIAL_URANIUM = 2 SHEETS)
	build_path = /obj/item/weapon/gun/energy/pulse_rifle/pistol
	research = "pulse_1"

/datum/design/item/genfab/weapons/guns/pulse/carbine // tier 4.5
	materials = list(MATERIAL_PLASTEEL = 12 SHEETS, MATERIAL_GOLD = 15 SHEETS, MATERIAL_PHORON = 10 SHEETS, MATERIAL_DIAMOND = 10 SHEETS, MATERIAL_URANIUM = 10 SHEETS)
	build_path = /obj/item/weapon/gun/energy/pulse_rifle/carbine
	research = "pulse_1"




// END ENERGY WEAPONS
	


// MELEE WEAPONS

/datum/design/item/genfab/weapons/tacknife // tier 0 
	build_path = /obj/item/weapon/material/hatchet/tacknife
	materials = list(MATERIAL_STEEL = 3 SHEETS)
	research = "melee_1"
/datum/design/item/genfab/weapons/unathiknife // tier 1 cosmetic
	build_path = /obj/item/weapon/material/hatchet/unathiknife
	materials = list(MATERIAL_STEEL = 3 SHEETS)
	research = "melee_1"
/datum/design/item/genfab/weapons/machete // tier 1 cosmetic
	build_path = /obj/item/weapon/material/hatchet/machete
	materials = list(MATERIAL_STEEL = 3 SHEETS)
	research = "melee_1"

/datum/design/item/genfab/weapons/melee/sword // tier 2
	build_path = /obj/item/weapon/material/sword
	materials = list(MATERIAL_STEEL = 2 SHEETS, MATERIAL_LEATHER = 1 SHEET)
	research = "melee_2"
/datum/design/item/genfab/weapons/buckler // tier 2
	build_path = /obj/item/weapon/shield/buckler
	materials = list(MATERIAL_STEEL = 5 SHEETS, MATERIAL_GOLD = 0.5 SHEET)
	research = "melee_2"
/datum/design/item/genfab/weapons/shuriken // tier 2
	build_path = /obj/item/weapon/material/star
	materials = list(MATERIAL_STEEL = 0.5 SHEETS)
	research = "melee_2"


/datum/design/item/genfab/weapons/melee/harpoon // tier 2
	build_path = /obj/item/weapon/material/harpoon
	materials = list(MATERIAL_STEEL = 2 SHEETS, MATERIAL_LEATHER = 1 SHEET)
	research = "melee_2"

/datum/design/item/genfab/weapons/melee/whip // tier 2
	build_path = /obj/item/weapon/melee/whip
	materials = list(MATERIAL_LEATHER = 2 SHEETS, MATERIAL_CLOTH = 1 SHEET)
	research = "melee_2"

/datum/design/item/genfab/weapons/melee/whip/fancy // tier 3
	build_path = /obj/item/weapon/melee/whip/chainofcommand
	materials = list(MATERIAL_LEATHER = 2 SHEETS, MATERIAL_CLOTH = 1 SHEET, MATERIAL_GOLD = 0.25 SHEETS, MATERIAL_SILVER = 0.25 SHEETS)
	research = "melee_3"

/datum/design/item/genfab/weapons/melee/sword/officersword // tier 3
	build_path = /obj/item/weapon/material/sword/officersword
	materials = list(MATERIAL_STEEL = 2 SHEETS, MATERIAL_LEATHER = 1 SHEET, MATERIAL_GOLD = 0.25 SHEET)

/datum/design/item/genfab/weapons/melee/sword/marinesword // tier 3
	build_path = /obj/item/weapon/material/sword/officersword/marine
	materials = list(MATERIAL_STEEL = 2 SHEETS, MATERIAL_LEATHER = 1 SHEET, MATERIAL_GOLD = 0.25 SHEET)
	research = "melee_3"
/datum/design/item/genfab/weapons/melee/sword/pettyofficersword // tier 3
	build_path = /obj/item/weapon/material/sword/officersword/pettyofficer
	materials = list(MATERIAL_STEEL = 2 SHEETS, MATERIAL_LEATHER = 1 SHEET, MATERIAL_GOLD = 0.25 SHEET)
	research = "melee_3"
/datum/design/item/genfab/weapons/machete/deluxe // tier 3
	build_path = /obj/item/weapon/material/hatchet/machete/deluxe
	materials = list(MATERIAL_STEEL = 3 SHEETS, MATERIAL_WOOD = 1 SHEET, MATERIAL_LEATHER = 1 SHEET)
	research = "melee_3"
/datum/design/item/genfab/weapons/melee/sword/katana // tier 3
	build_path = /obj/item/weapon/material/sword/katana
	research = "melee_3"

/datum/design/item/genfab/weapons/energyshield // tier 4
	build_path = /obj/item/weapon/shield/energy
	materials = list(MATERIAL_PLASTEEL = 4 SHEETS, MATERIAL_GOLD = 4 SHEETS, MATERIAL_URANIUM = 2 SHEETS, MATERIAL_PHORON = 2 SHEET)
	research = "melee_4"
/datum/design/item/genfab/weapons/energysword // tier 4
	materials = list(MATERIAL_PLASTEEL = 5 SHEETS, MATERIAL_GOLD = 6 SHEETS, MATERIAL_URANIUM = 5 SHEETS, MATERIAL_PHORON = 5 SHEET)
	research = "melee_4"
/datum/design/item/genfab/weapons/energysword/red // tier 4
	name = "red energy sword"
	build_path = /obj/item/weapon/melee/energy/sword/red
	research = "melee_4"
/datum/design/item/genfab/weapons/energysword/blue // tier 4
	name = "blue energy sword"
	build_path = /obj/item/weapon/melee/energy/sword/blue
	research = "melee_4"
/datum/design/item/genfab/weapons/energysword/green // tier 4
	name = "green energy sword"
	build_path = /obj/item/weapon/melee/energy/sword/green
	research = "melee_4"
/datum/design/item/genfab/weapons/energysword/cutlass // tier 4
	build_path = /obj/item/weapon/melee/energy/sword/pirate
	research = "melee_4"
/datum/design/item/genfab/weapons/energyaxe // tier 4.5
	build_path = /obj/item/weapon/melee/energy/axe
	materials = list(MATERIAL_PLASTEEL = 10 SHEETS, MATERIAL_GOLD = 10 SHEETS, MATERIAL_URANIUM = 10 SHEETS, MATERIAL_PHORON = 10 SHEET)
	research = "melee_4"
	

// END MELEE WEAPONS

// MISC WEAPONS

/datum/design/item/genfab/weapons/launcher/crossbow // tier 2
	build_path = /obj/item/weapon/gun/launcher/crossbow
	materials = list(MATERIAL_WOOD = 8 SHEETS, MATERIAL_STEEL = 5 SHEETS, MATERIAL_GOLD = 2 SHEETS)
	research = "melee_2"
/datum/design/item/genfab/weapons/arrow // tier 2
	time = 1
	build_path = /obj/item/weapon/arrow
	materials = list(MATERIAL_WOOD = 1 SHEETS, MATERIAL_STEEL = 0.5 SHEETS)
	research = "melee_2"


// END MISC Weapons

// ILLEGAL DEVICES

/datum/design/item/genfab/weapons/illegal/suit_sensor_jammer // tier 3
	build_path = /obj/item/device/suit_sensor_jammer
	materials = list(MATERIAL_STEEL = 5 SHEETS, MATERIAL_GOLD = 10 SHEET, MATERIAL_SILVER = 5 SHEET, MATERIAL_URANIUM = 5 SHEET, MATERIAL_PHORON = 5 SHEET, MATERIAL_DIAMOND = 3 SHEET)
	research = "illegal_1"
/datum/design/item/genfab/weapons/illegal/electropack // tier 3
	build_path = /obj/item/device/radio/electropack
	materials = list(MATERIAL_STEEL = 8 SHEETS, MATERIAL_GOLD = 5 SHEET, MATERIAL_SILVER = 5 SHEET, MATERIAL_URANIUM = 2 SHEET, MATERIAL_PHORON = 2 SHEET, MATERIAL_DIAMOND = 2 SHEET)
	research = "illegal_1"
/**
/datum/design/item/genfab/weapons/illegal/batterer // tier 4
	build_path = /obj/item/device/batterer
	materials = list(MATERIAL_STEEL = 5 SHEETS, MATERIAL_GOLD = 5 SHEET, MATERIAL_SILVER = 5 SHEET, MATERIAL_PHORON = 2 SHEET, MATERIAL_DIAMOND = 2 SHEET)
**/
/datum/design/item/genfab/weapons/illegal/spy_bug // tier 4
	name = "clandestine listening device (bug)"
	build_path = /obj/item/device/spy_bug
	materials = list(MATERIAL_STEEL = 1 SHEETS, MATERIAL_GOLD = 3 SHEET, MATERIAL_SILVER = 3 SHEET, MATERIAL_DIAMOND = 1 SHEET)
	research = "illegal_2"
/datum/design/item/genfab/weapons/illegal/spy_monitor // tier 4
	name = "clandestine monitoring device"
	build_path = /obj/item/device/spy_monitor
	materials = list(MATERIAL_STEEL = 5 SHEETS, MATERIAL_GOLD = 5 SHEET, MATERIAL_SILVER = 5 SHEET, MATERIAL_DIAMOND = 1 SHEET)
	research = "illegal_2"
/datum/design/item/genfab/weapons/illegal/syringe_gun/disguised // medical tech
	name = "disguised syringe gun"
	build_path = /obj/item/weapon/gun/launcher/syringe/disguised
	research = "rapid_syringe_gun"

/datum/design/item/genfab/weapons/illegal/imprinting // medical tech
	materials = list(MATERIAL_STEEL = 2 SHEET, MATERIAL_SILVER = 3 SHEETS, MATERIAL_COPPER = 2 SHEETS, MATERIAL_PHORON = 1 SHEET)
	build_path = /obj/item/weapon/implant/imprinting
	research = "implant_imprinting"


/datum/design/item/genfab/weapons/illegal/freedom // medical tech
	materials = list(MATERIAL_STEEL = 2 SHEET, MATERIAL_SILVER = 3 SHEETS, MATERIAL_COPPER = 2 SHEETS, MATERIAL_PHORON = 2 SHEET)
	build_path = /obj/item/weapon/implant/freedom
	research = "implant_freedom"


// END ILLEGAL DEVICES





/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// COMPUTER EQUIPMENT

/datum/design/item/genfab/computer
	category = "Computer Equipment"

/datum/design/item/genfab/computer/adv


///////////////////////////////////////////////////////////////////////////////
// Hard drives
/datum/design/item/genfab/computer/disk/normal // tier 0
	name = "basic hard drive"
	materials = list(MATERIAL_STEEL = 1 SHEET, MATERIAL_COPPER = 1 SHEET)
	build_path = /obj/item/weapon/computer_hardware/hard_drive/

/datum/design/item/genfab/computer/adv/disk/advanced // tier 1
	name = "advanced hard drive"
	materials = list(MATERIAL_STEEL = 2 SHEETS, MATERIAL_COPPER = 1.5 SHEET)
	build_path = /obj/item/weapon/computer_hardware/hard_drive/advanced

/datum/design/item/genfab/computer/adv/disk/super // tier 2
	name = "super hard drive"
	materials = list(MATERIAL_STEEL = 3 SHEETS, MATERIAL_COPPER = 2 SHEETS, MATERIAL_SILVER = 0.5 SHEETS)
	build_path = /obj/item/weapon/computer_hardware/hard_drive/super

/datum/design/item/genfab/computer/adv/disk/cluster // tier 3
	name = "cluster hard drive"
	materials = list(MATERIAL_STEEL = 3 SHEETS, MATERIAL_COPPER = 3 SHEETS, MATERIAL_SILVER = 2 SHEETS)
	build_path = /obj/item/weapon/computer_hardware/hard_drive/cluster

/datum/design/item/genfab/computer/adv/disk/small // tier 0
	name = "small hard drive"
	materials = list(MATERIAL_STEEL = 0.5 SHEET, MATERIAL_COPPER = 0.75 SHEET)

	build_path = /obj/item/weapon/computer_hardware/hard_drive/small

/datum/design/item/genfab/computer/adv/disk/micro // tier 0
	name = "micro hard drive"
	materials = list(MATERIAL_STEEL = 0.5 SHEET, MATERIAL_COPPER = 1 SHEET)
	build_path = /obj/item/weapon/computer_hardware/hard_drive/micro

// Card slot
/datum/design/item/genfab/computer/adv/cardslot // tier 0
	name = "RFID card slot"
	materials = list(MATERIAL_STEEL = 1 SHEETS)
	build_path = /obj/item/weapon/computer_hardware/card_slot


// Nano printer
/datum/design/item/genfab/computer/adv/nanoprinter // tier 0
	name = "nano printer"
	materials = list(MATERIAL_STEEL = 1 SHEETS)
	build_path = /obj/item/weapon/computer_hardware/nano_printer

// Tesla Link
/datum/design/item/genfab/computer/adv/teslalink // tier 0
	name = "tesla link"
	materials = list(MATERIAL_STEEL = 1 SHEETS, MATERIAL_COPPER = 1 SHEETS)
	build_path = /obj/item/weapon/computer_hardware/tesla_link

// Batteries
/datum/design/item/genfab/computer/adv/battery/normal // tier 0
	name = "standard battery module"
	materials = list(MATERIAL_STEEL = 1 SHEETS, MATERIAL_COPPER = 1 SHEETS)
	build_path = /obj/item/weapon/computer_hardware/battery_module

/datum/design/item/genfab/computer/adv/battery/advanced // tier 1
	name = "advanced battery module"
	materials = list(MATERIAL_STEEL = 2 SHEETS, MATERIAL_COPPER = 2 SHEETS)
	build_path = /obj/item/weapon/computer_hardware/battery_module/advanced

/datum/design/item/genfab/computer/adv/battery/super // tier 2
	name = "super battery module"
	materials = list(MATERIAL_STEEL = 3 SHEETS, MATERIAL_COPPER = 3 SHEETS)
	build_path = /obj/item/weapon/computer_hardware/battery_module/super

/datum/design/item/genfab/computer/adv/battery/ultra // tier 3
	name = "ultra battery module"
	materials = list(MATERIAL_STEEL = 4 SHEETS, MATERIAL_COPPER = 4 SHEETS)
	build_path = /obj/item/weapon/computer_hardware/battery_module/ultra

/datum/design/item/genfab/computer/battery/nano // tier 0
	name = "nano battery module"
	materials = list(MATERIAL_STEEL = 0.5 SHEETS, MATERIAL_COPPER = 0.5 SHEETS)
	build_path = /obj/item/weapon/computer_hardware/battery_module/nano

/datum/design/item/genfab/computer/adv/micro // tier 0
	name = "micro battery module"
	materials = list(MATERIAL_STEEL = 0.5 SHEETS, MATERIAL_COPPER = 0.5 SHEETS)
	build_path = /obj/item/weapon/computer_hardware/battery_module/micro

/datum/design/item/genfab/computer/adv/dna_scanner // tier 0
	name = "DNA scanner port"
	materials = list(MATERIAL_STEEL = 01 SHEETS, MATERIAL_COPPER = 0.5 SHEETS)
	build_path = /obj/item/weapon/computer_hardware/dna_scanner

/datum/design/item/genfab/computer/adv/pda // tier 1
	name = "PDA design"
	desc = "Cheaper than whiny non-digital assistants."
	req_tech = list(TECH_ENGINEERING = 2, TECH_POWER = 3)
	materials = list(MATERIAL_STEEL = 2 SHEETS, MATERIAL_GLASS = 1 SHEET, MATERIAL_COPPER = 1.5 SHEETS)
	build_path = /obj/item/device/pda

// Cartridges
/**
/datum/design/item/genfab/computer/adv/pda_cartridge
	req_tech = list(TECH_ENGINEERING = 2, TECH_POWER = 3)
	materials = list(MATERIAL_STEEL = 50, MATERIAL_GLASS = 50)

/datum/design/item/genfab/computer/adv/pda_cartridge/AssembleDesignName()
	..()
	name = "PDA accessory ([item_name])"

/datum/design/item/genfab/computer/adv/cart_basic
	id = "cart_basic"
	build_path = /obj/item/weapon/cartridge
	sort_string = "VBAAA"

/datum/design/item/genfab/computer/adv/engineering
	id = "cart_engineering"
	build_path = /obj/item/weapon/cartridge/engineering
	sort_string = "VBAAB"

/datum/design/item/genfab/computer/adv/atmos
	id = "cart_atmos"
	build_path = /obj/item/weapon/cartridge/atmos
	sort_string = "VBAAC"

/datum/design/item/genfab/computer/adv/medical
	id = "cart_medical"
	build_path = /obj/item/weapon/cartridge/medical
	sort_string = "VBAAD"

/datum/design/item/genfab/computer/adv/chemistry
	id = "cart_chemistry"
	build_path = /obj/item/weapon/cartridge/chemistry
	sort_string = "VBAAE"

/datum/design/item/genfab/computer/adv/security
	id = "cart_security"
	build_path = /obj/item/weapon/cartridge/security
	sort_string = "VBAAF"

/datum/design/item/genfab/computer/adv/janitor
	id = "cart_janitor"
	build_path = /obj/item/weapon/cartridge/janitor
	sort_string = "VBAAG"

/datum/design/item/genfab/computer/adv/science
	id = "cart_science"
	build_path = /obj/item/weapon/cartridge/signal/science
	sort_string = "VBAAH"

/datum/design/item/genfab/computer/adv/quartermaster
	id = "cart_quartermaster"
	build_path = /obj/item/weapon/cartridge/quartermaster
	sort_string = "VBAAI"

/datum/design/item/genfab/computer/adv/hop
	id = "cart_hop"
	build_path = /obj/item/weapon/cartridge/hop
	sort_string = "VBAAJ"

/datum/design/item/genfab/computer/adv/hos
	id = "cart_hos"
	build_path = /obj/item/weapon/cartridge/hos
	sort_string = "VBAAK"

/datum/design/item/genfab/computer/adv/ce
	id = "cart_ce"
	build_path = /obj/item/weapon/cartridge/ce
	sort_string = "VBAAL"

/datum/design/item/genfab/computer/adv/cmo
	id = "cart_cmo"
	build_path = /obj/item/weapon/cartridge/cmo
	sort_string = "VBAAM"

/datum/design/item/genfab/computer/adv/rd
	id = "cart_rd"
	build_path = /obj/item/weapon/cartridge/rd
	sort_string = "VBAAN"

/datum/design/item/genfab/computer/adv/captain
	id = "cart_captain"
	build_path = /obj/item/weapon/cartridge/captain
	sort_string = "VBAAO"
**/

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Communication Equipment

/datum/design/item/genfab/communication
	category = "Paperwork"


////////////////////////////////////////////////////////////////////

/datum/design/item/genfab/communication/radio_headset
	name = "radio headset"
	build_path = /obj/item/device/radio/headset
	materials = list(MATERIAL_STEEL = 0.5 SHEETS)

/datum/design/item/genfab/communication/radio_bounced
	name = "shortwave radio"
	build_path = /obj/item/device/radio/off
	materials = list(MATERIAL_STEEL = 0.5 SHEETS)

/datum/design/item/genfab/communication/taperecorder
	name = "tape recorder"
	build_path = /obj/item/device/taperecorder/empty
	materials = list(MATERIAL_STEEL = 1 SHEETS)

/datum/design/item/genfab/communication/camera_film
	name = "camera film"
	build_path = /obj/item/device/camera_film
	materials = list(MATERIAL_COPPER = 0.25 SHEETS)

/datum/design/item/genfab/communication/tape
	name = "tape recorder tape"
	build_path = /obj/item/device/tape
	materials = list(MATERIAL_STEEL = 0.5 SHEETS)

/datum/design/item/genfab/communication/camera
	name = "photo camera"
	build_path = /obj/item/device/camera/empty
	materials = list(MATERIAL_STEEL = 2 SHEETS, MATERIAL_COPPER = 0.25 SHEETS, MATERIAL_SILVER = 0.25 SHEETS)


/datum/design/item/genfab/communication/pen
	materials = list(MATERIAL_PLASTIC = 0.2 SHEETS)
/datum/design/item/genfab/communication/pen/blackpen
	name = "black ink pen"
	build_path = /obj/item/weapon/pen

/datum/design/item/genfab/communication/pen/bluepen
	name = "blue ink pen"
	build_path = /obj/item/weapon/pen/blue

/datum/design/item/genfab/communication/pen/redpen
	name = "red ink pen"
	build_path = /obj/item/weapon/pen/red

/datum/design/item/genfab/communication/pen/multipen // tier 1
	name = "multi-color ink pen"
	build_path = /obj/item/weapon/pen/multi
	materials = list(MATERIAL_PLASTIC = 0.2 SHEETS, MATERIAL_PHORON = 0.1 SHEETS)

/datum/design/item/genfab/communication/pen/crayon/red // tier 1
	name = "red crayon"
	build_path = /obj/item/weapon/pen/crayon/red

/datum/design/item/genfab/communication/pen/crayon/orange // tier 1
	name = "orange crayon"
	build_path = /obj/item/weapon/pen/crayon/orange

/datum/design/item/genfab/communication/pen/crayon/yellow // tier 1
	name = "yellow crayon"
	build_path = /obj/item/weapon/pen/crayon/yellow

/datum/design/item/genfab/communication/pen/crayon/green // tier 1
	name = "green crayon"
	build_path = /obj/item/weapon/pen/crayon/green

/datum/design/item/genfab/communication/pen/crayon/blue // tier 1
	name = "blue crayon"
	build_path = /obj/item/weapon/pen/crayon/blue

/datum/design/item/genfab/communication/pen/crayon/purple // tier 1
	name = "purple crayon"
	build_path = /obj/item/weapon/pen/crayon/purple

/datum/design/item/genfab/communication/pen/crayon/mime // tier 2
	name = "mime crayon"
	build_path = /obj/item/weapon/pen/crayon/mime
	materials = list(MATERIAL_PLASTIC = 0.2 SHEETS, MATERIAL_DIAMOND = 0.1 SHEETS)

/datum/design/item/genfab/communication/pen/crayon/rainbow // tier 2
	name = "rainbow crayon"
	build_path = /obj/item/weapon/pen/crayon/rainbow
	materials = list(MATERIAL_PLASTIC = 0.2 SHEETS, MATERIAL_PHORON = 0.1 SHEETS)


/datum/design/item/genfab/communication/clipboard
	name = "clipboard"
	build_path = /obj/item/weapon/clipboard
	materials = list(MATERIAL_WOOD = 0.05 SHEET)
/datum/design/item/genfab/communication/folder
	name = "grey folder"
	build_path = /obj/item/weapon/folder
	materials = list(MATERIAL_WOOD = 0.05 SHEET)
/datum/design/item/genfab/communication/folder/blue
	name = "blue folder"
	build_path = /obj/item/weapon/folder/blue
	materials = list(MATERIAL_WOOD = 0.05 SHEET)
/datum/design/item/genfab/communication/folder/red
	name = "red folder"
	build_path = /obj/item/weapon/folder/red
	materials = list(MATERIAL_WOOD = 0.05 SHEET)
/datum/design/item/genfab/communication/folder/yellow
	name = "yellow folder"
	build_path = /obj/item/weapon/folder/yellow
	materials = list(MATERIAL_WOOD = 0.05 SHEET)
/datum/design/item/genfab/communication/paper
	name = "sheet of paper"
	build_path = /obj/item/weapon/paper
	materials = list(MATERIAL_WOOD = 0.05 SHEET) // 20 papers per sheet
/datum/design/item/genfab/communication/paper/carbon
	name = "sheet of carbon paper"
	build_path = /obj/item/weapon/paper/carbon
	materials = list(MATERIAL_WOOD = 0.1 SHEET) // 10 papers per sheet

/datum/design/item/genfab/communication/paper/sticky
	name = "sticky note"
	build_path = /obj/item/weapon/paper/sticky
	materials = list(MATERIAL_WOOD = 0.1 SHEET) // 10 papers per sheet

/datum/design/item/genfab/communication/hand_labeler
	name = "hand labeler"
	build_path = /obj/item/weapon/hand_labeler

/datum/design/item/genfab/communication/paper_bin
	name = "paper bin"
	build_path = /obj/item/weapon/paper_bin
	materials = list(MATERIAL_STEEL = 1 SHEET)







/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// EVA Equipment
/datum/design/item/genfab/eva
	category = "EVA Equipment"

/datum/design/item/genfab/eva/adv

///////////////////////////////////////////////////////////////

/datum/design/item/genfab/eva/tank
	name = "air tank"
	build_path = /obj/item/weapon/tank/oxygen/empty
	materials = list(MATERIAL_STEEL = 2 SHEETS)

/datum/design/item/genfab/eva/adv/tank_double
	name = "double-capacity air tank"
	build_path = /obj/item/weapon/tank/emergency/oxygen/engi/empty
	materials = list(MATERIAL_STEEL = 5 SHEETS)

/datum/design/item/genfab/eva/adv/jetpack // tier 1
	name = "Blue Jetpack"	//Just a fancy name for a jetpack, heh
	req_tech = list(TECH_ENGINEERING = 4)
	materials = list(MATERIAL_STEEL = 3 SHEETS, MATERIAL_GOLD = 3 SHEETS, MATERIAL_SILVER = 2 SHEETS)
	build_path = /obj/item/weapon/tank/jetpack

/datum/design/item/genfab/eva/adv/jetpack/black // tier 1
	name = "Black Jetpack"	//Just a fancy name for a jetpack, heh
	req_tech = list(TECH_ENGINEERING = 4)
	materials = list(MATERIAL_STEEL = 3 SHEETS, MATERIAL_GOLD = 3 SHEETS, MATERIAL_SILVER = 2 SHEETS)
	build_path = /obj/item/weapon/tank/jetpack/carbondioxide

/datum/design/item/genfab/eva/adv/beacon
	name = "Bluespace tracking beacon design"
	req_tech = list(TECH_BLUESPACE = 1)
	materials = list (MATERIAL_STEEL = 1 SHEET, MATERIAL_COPPER = 0.5 SHEETS)
	build_path = /obj/item/device/radio/beacon

/datum/design/item/genfab/eva/gps
	name = "Triangulating device design"
	req_tech = list(TECH_MATERIAL = 2, TECH_DATA = 2, TECH_BLUESPACE = 2)
	materials = list(MATERIAL_STEEL = 1 SHEET, MATERIAL_COPPER = 0.5 SHEETS)
	build_path = /obj/item/device/gps

/datum/design/item/genfab/eva/adv/beacon_locator
	name = "Beacon tracking pinpointer"
	req_tech = list(TECH_MAGNET = 3, TECH_ENGINEERING = 2, TECH_BLUESPACE = 3)
	materials = list(MATERIAL_STEEL = 1 SHEET, MATERIAL_COPPER = 0.5 SHEETS)
	build_path = /obj/item/device/beacon_locator

/datum/design/item/genfab/eva/adv/marshalling_wand
	materials = list(MATERIAL_STEEL = 1 SHEET, MATERIAL_COPPER = 0.5 SHEETS)
	build_path = /obj/item/weapon/marshalling_wand
/**
/datum/design/item/genfab/eva/adv/net_launcher
	materials = list(MATERIAL_STEEL = 6 SHEET, MATERIAL_COPPER = 3 SHEETS)
	build_path = /obj/item/weapon/gun/launcher/net

/datum/design/item/genfab/eva/adv/net_shell
	materials = list(MATERIAL_STEEL = 2 SHEET, MATERIAL_CLOTH = 3 SHEETS)
	build_path = /obj/item/weapon/net_shell
**/
/datum/design/item/genfab/eva/flare
	materials = list(MATERIAL_STEEL = 1.5 SHEET, MATERIAL_GOLD = 0.15 SHEETS)
	build_path = /obj/item/device/flashlight/flare

/datum/design/item/genfab/eva/binoculars
	materials = list(MATERIAL_STEEL = 1.5 SHEET, MATERIAL_COPPER = 0.5 SHEETS, MATERIAL_GLASS = 1.5 SHEETS)
	build_path = /obj/item/device/binoculars

/datum/design/item/genfab/eva/modkit
	materials = list(MATERIAL_STEEL = 4 SHEET, MATERIAL_COPPER = 1 SHEETS, MATERIAL_CLOTH = 2 SHEET)

/datum/design/item/genfab/eva/modkit/vox
	build_path = /obj/item/device/modkit/vox

/datum/design/item/genfab/eva/modkit/unathi
	build_path = /obj/item/device/modkit/unathi

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Furniture
/datum/design/item/genfab/furniture
	category = "Furniture"

/////////////////////////////////////

/datum/design/item/genfab/furniture/lamp
	build_path = /obj/item/device/flashlight/lamp
	materials = list(MATERIAL_STEEL = 0.5 SHEETS, MATERIAL_GLASS = 0.25 SHEETS)

/datum/design/item/genfab/furniture/lamp/green
	build_path = /obj/item/device/flashlight/lamp/green
	materials = list(MATERIAL_STEEL = 0.5 SHEETS, MATERIAL_GLASS = 0.25 SHEETS)



/datum/design/item/genfab/furniture/ashtray_glass
	name = "glass ashtray"
	build_path = /obj/item/weapon/material/ashtray/glass
	materials = list(MATERIAL_GLASS = 0.25 SHEET)
/datum/design/item/genfab/furniture/ashtray_bronze
	name = "metal ashtray"
	build_path = /obj/item/weapon/material/ashtray/bronze
	materials = list(MATERIAL_STEEL = 0.25 SHEET)
/datum/design/item/genfab/furniture/ashtray_plastic
	name = "plastic ashtray"
	build_path = /obj/item/weapon/material/ashtray/plastic
	materials = list(MATERIAL_PLASTIC = 0.25 SHEET)

/datum/design/item/genfab/furniture/desklamp
	name = "desk lamp"
	build_path = /obj/item/device/flashlight/lamp
	materials = list(MATERIAL_STEEL = 0.25 SHEET)

/datum/design/item/genfab/furniture/floor_light
	name = "floor light"
	build_path = /obj/machinery/floor_light
	materials = list(MATERIAL_GLASS = 1 SHEET)


/datum/design/item/genfab/furniture/bedsheet
	build_path = /obj/item/weapon/bedsheet
	materials = list(MATERIAL_CLOTH = 1 SHEETS)

/datum/design/item/genfab/furniture/bedsheet/typed
	materials = list(MATERIAL_CLOTH = 1.25 SHEETS)

/datum/design/item/genfab/furniture/bedsheet/typed/blue
	name = "blue bedsheet"
	build_path = /obj/item/weapon/bedsheet/blue

/datum/design/item/genfab/furniture/bedsheet/typed/green
	name = "green bedsheet"
	build_path = /obj/item/weapon/bedsheet/green

/datum/design/item/genfab/furniture/bedsheet/typed/orange
	name = "orange bedsheet"
	build_path = /obj/item/weapon/bedsheet/orange

/datum/design/item/genfab/furniture/bedsheet/typed/purple
	name = "purple bedsheet"
	build_path = /obj/item/weapon/bedsheet/purple

/datum/design/item/genfab/furniture/bedsheet/typed/rainbow
	name = "rainbow bedsheet"
	build_path = /obj/item/weapon/bedsheet/rainbow

/datum/design/item/genfab/furniture/bedsheet/typed/red
	name = "red bedsheet"
	build_path = /obj/item/weapon/bedsheet/red

/datum/design/item/genfab/furniture/bedsheet/typed/yellow
	name = "yellow bedsheet"
	build_path = /obj/item/weapon/bedsheet/yellow

/datum/design/item/genfab/furniture/bedsheet/typed/mime
	name = "mime bedsheet"
	build_path = /obj/item/weapon/bedsheet/mime

/datum/design/item/genfab/furniture/bedsheet/typed/clown
	name = "clown bedsheet"
	build_path = /obj/item/weapon/bedsheet/clown

/datum/design/item/genfab/furniture/bedsheet/typed/captain
	name = "captain bedsheet"
	build_path = /obj/item/weapon/bedsheet/captain

/datum/design/item/genfab/furniture/bedsheet/typed/research
	name = "research bedsheet"
	build_path = /obj/item/weapon/bedsheet/rd

/datum/design/item/genfab/furniture/bedsheet/typed/medical
	name = "medical bedsheet"
	build_path = /obj/item/weapon/bedsheet/medical

/datum/design/item/genfab/furniture/bedsheet/typed/security
	name = "security bedsheet"
	build_path = /obj/item/weapon/bedsheet/hos

/datum/design/item/genfab/furniture/bedsheet/typed/hop
	name = "command bedsheet"
	build_path = /obj/item/weapon/bedsheet/hop

/datum/design/item/genfab/furniture/bedsheet/typed/ce
	name = "engineering bedsheet"
	build_path = /obj/item/weapon/bedsheet/ce

/datum/design/item/genfab/furniture/bedsheet/typed/brown
	name = "brown bedsheet"
	build_path = /obj/item/weapon/bedsheet/brown


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Botany Tools

/datum/design/item/genfab/botanytools
	category = "Botany Tools"


/////////////////////////////////////////////////////////////////////////////////////

/datum/design/item/genfab/botanytools/hatchet
	name = "hatchet"
	build_path = /obj/item/weapon/material/hatchet
	materials = list(MATERIAL_STEEL = 3 SHEET)

/datum/design/item/genfab/botanytools/minihoe
	name = "mini hoe"
	build_path = /obj/item/weapon/material/minihoe
	materials = list(MATERIAL_STEEL = 0.75 SHEET)

/datum/design/item/genfab/botanytools/plantbgone
	name = "Plant-B-Gone (empty)"
	build_path = /obj/item/weapon/reagent_containers/spray/plantbgone
	materials = list(MATERIAL_GLASS = 0.1 SHEET)

/datum/design/item/genfab/botanytools/scythe
	build_path = /obj/item/weapon/material/scythe
	materials = list(MATERIAL_STEEL = 3 SHEET, MATERIAL_WOOD = 2 SHEET)


/datum/design/item/genfab/botanytools/flora_gun // tier 2
	req_tech = list(TECH_MATERIAL = 2, TECH_BIO = 3, TECH_POWER = 3)
	materials = list(MATERIAL_STEEL = 8 SHEET, MATERIAL_GLASS = 5 SHEETS, MATERIAL_URANIUM = 4 SHEETS)
	build_path = /obj/item/weapon/gun/energy/floragun

/datum/design/item/genfab/botanytools/weedspray
	build_path = /obj/item/weapon/plantspray/weeds
	materials = list(MATERIAL_PLASTIC = 1 SHEET, MATERIAL_SILVER = 0.25 SHEETS)
/datum/design/item/genfab/botanytools/pestspray
	build_path = /obj/item/weapon/plantspray/pests
	materials = list(MATERIAL_PLASTIC = 1 SHEET, MATERIAL_SILVER = 0.25 SHEETS)

/datum/design/item/genfab/botanytools/clippers
	build_path = /obj/item/weapon/wirecutters/clippers
	materials = list(MATERIAL_STEEL = 1 SHEET)

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Culinary Tools

/datum/design/item/genfab/culinarytools
	category = "Culinary Tools"

/////////////////////////////////////////////////////////////////////////////////////

/datum/design/item/genfab/culinarytools/knife
	name = "kitchen knife"
	build_path = /obj/item/weapon/material/knife
	materials = list(MATERIAL_STEEL = 2 SHEET)
/datum/design/item/genfab/culinarytools/butch
	name = "butcher knife"
	build_path = /obj/item/weapon/material/knife/butch
	materials = list(MATERIAL_STEEL = 2.5 SHEET)
/datum/design/item/genfab/culinarytools/utensil_knife
	name = "dining knife"
	build_path = /obj/item/weapon/material/kitchen/utensil/knife
	materials = list(MATERIAL_STEEL = 0.1 SHEET)
/datum/design/item/genfab/culinarytools/utensil_fork
	name = "dining fork"
	build_path = /obj/item/weapon/material/kitchen/utensil/fork
	materials = list(MATERIAL_STEEL = 0.1 SHEET)
/datum/design/item/genfab/culinarytools/utensil_spoon
	name = "dining spoon"
	build_path = /obj/item/weapon/material/kitchen/utensil/spoon
	materials = list(MATERIAL_STEEL = 0.1 SHEET)

/datum/design/item/genfab/culinarytools/utensil_fork_plastic
	name = "plastic dining fork"
	build_path 	= /obj/item/weapon/material/kitchen/utensil/fork/plastic
	materials = list(MATERIAL_PLASTIC = 0.1 SHEET)
/datum/design/item/genfab/culinarytools/utensil_knife_plastic
	name = "plastic dining knife"
	build_path = /obj/item/weapon/material/kitchen/utensil/knife/plastic
	materials = list(MATERIAL_PLASTIC = 0.1 SHEET)

/datum/design/item/genfab/culinarytools/mixsstick
	name = "mixing stick"
	build_path = /obj/item/weapon/glass_extra/stick
	materials = list(MATERIAL_PLASTIC = 0.1 SHEET)

/datum/design/item/genfab/culinarytools/straw
	name = "drink straw"
	build_path = /obj/item/weapon/glass_extra/straw
	materials = list(MATERIAL_PLASTIC = 0.1 SHEET)


/datum/design/item/genfab/culinarytools/utensil_spoon_plastic
	name = "plastic dining spoon"
	build_path = /obj/item/weapon/material/kitchen/utensil/spoon/plastic
	materials = list(MATERIAL_PLASTIC = 0.1 SHEET)

/datum/design/item/genfab/culinarytools/tray
	name = "tray"
	build_path = /obj/item/weapon/tray
	materials = list(MATERIAL_STEEL = 0.5 SHEET)

/datum/design/item/genfab/culinarytools/rollingpin
	name = "rolling pin"
	build_path = /obj/item/weapon/material/kitchen/rollingpin
	materials = list(MATERIAL_WOOD = 0.5 SHEET)


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Consumer Goods

/datum/design/item/genfab/consumer
	category = "Consumer Goods"
	materials = list(MATERIAL_PLASTIC = 0.1 SHEETS)
/datum/design/item/genfab/consumer/toys
	category = "Toys"

/datum/design/item/genfab/consumer/games
	category = "Games"



////////////////////////////////////////////////////////////////////

/datum/design/item/genfab/consumer/plastic_bag
	build_path = /obj/item/weapon/storage/bag/plasticbag
	materials = list(MATERIAL_PLASTIC = 0.5 SHEETS)

/datum/design/item/genfab/consumer/wrapping_paper
	build_path = /obj/item/weapon/wrapping_paper
	materials = list(MATERIAL_WOOD = 0.5 SHEETS)

/datum/design/item/genfab/consumer/bikehorn
	build_path = /obj/item/weapon/bikehorn
	materials = list(MATERIAL_STEEL = 2 SHEETS, MATERIAL_PLASTIC = 2 SHEETS)

/datum/design/item/genfab/consumer/poster
	build_path = /obj/item/weapon/contraband/poster
	materials = list(MATERIAL_PLASTIC = 1 SHEETS)

/datum/design/item/genfab/consumer/violin
	build_path = /obj/item/device/violin
	materials = list(MATERIAL_WOOD = 2.5 SHEETS, MATERIAL_STEEL = 1 SHEET, MATERIAL_COPPER = 1 SHEET)

/datum/design/item/genfab/consumer/guitar
	build_path = /obj/item/instrument/guitar
	materials = list(MATERIAL_WOOD = 1.5 SHEETS, MATERIAL_STEEL = 1 SHEET)


/datum/design/item/genfab/consumer/basketball
	build_path = /obj/item/weapon/basketball
	materials = list(MATERIAL_PLASTIC = 1 SHEETS)

/datum/design/item/genfab/consumer/beach_ball
	build_path = /obj/item/weapon/beach_ball
	materials = list(MATERIAL_PLASTIC = 1 SHEETS)

/datum/design/item/genfab/consumer/megaphone
	build_path = /obj/item/device/megaphone
	materials = list(MATERIAL_STEEL = 2 SHEETS, MATERIAL_COPPER = 1 SHEET)


/datum/design/item/genfab/consumer/rsf // tier 3
	build_path = /obj/item/weapon/rsf
	materials = list(MATERIAL_STEEL = 4 SHEETS, MATERIAL_COPPER = 4 SHEETS, MATERIAL_GLASS = 4 SHEETS, MATERIAL_DIAMOND = 4 SHEETS, MATERIAL_PHORON = 2 SHEETS)

/datum/design/item/genfab/consumer/TVAssembly
	build_path = /obj/item/weapon/TVAssembly
	materials = list(MATERIAL_STEEL = 2 SHEETS)

/datum/design/item/genfab/consumer/towel
	build_path = /obj/item/weapon/towel
	materials = list(MATERIAL_CLOTH = 0.25 SHEETS)

/datum/design/item/genfab/consumer/mirror
	name = "hand mirror"
	build_path = /obj/item/weapon/mirror
	materials = list(MATERIAL_GLASS = 0.25 SHEETS, MATERIAL_STEEL = 0.25 SHEETS)

/datum/design/item/genfab/consumer/lighter
	name = "cheap lighter"
	build_path = /obj/item/weapon/flame/lighter/random
	materials = list(MATERIAL_PLASTIC = 0.25 SHEETS, MATERIAL_STEEL = 0.25 SHEETS)

/datum/design/item/genfab/consumer/lighter/zippo
	build_path = /obj/item/weapon/flame/lighter/zippo
	materials = list(MATERIAL_STEEL = 0.5 SHEETS, MATERIAL_SILVER = 0.5 SHEETS)

/datum/design/item/genfab/consumer/lighter/candle
	build_path = /obj/item/weapon/flame/candle
	materials = list(MATERIAL_PLASTIC = 0.25 SHEETS)

/datum/design/item/genfab/consumer/glowstick
	build_path = /obj/item/device/flashlight/glowstick
	materials = list(MATERIAL_PLASTIC = 0.5 SHEETS, MATERIAL_COPPER = 0.15)

/datum/design/item/genfab/consumer/glowstick/red
	build_path = /obj/item/device/flashlight/glowstick/red

/datum/design/item/genfab/consumer/glowstick/blue
	build_path = /obj/item/device/flashlight/glowstick/blue

/datum/design/item/genfab/consumer/glowstick/orange
	build_path = /obj/item/device/flashlight/glowstick/orange


/datum/design/item/genfab/consumer/glowstick/yellow
	build_path = /obj/item/device/flashlight/glowstick/yellow




/datum/design/item/genfab/consumer/labeler
	name = "hand labeler"
	build_path = /obj/item/weapon/hand_labeler
	materials = list(MATERIAL_PLASTIC = 1 SHEETS, MATERIAL_COPPER = 0.15)
/datum/design/item/genfab/consumer/ecigcartridge
	name = "ecigarette cartridge (empty)"
	build_path = /obj/item/weapon/reagent_containers/ecig_cartridge/blank
	materials = list(MATERIAL_STEEL = 0.1 SHEETS)
/datum/design/item/genfab/consumer/ecig
	// We get it, you vape
	name = "ecigarette"
	build_path = /obj/item/clothing/mask/smokable/ecig/lathed
	materials = list(MATERIAL_STEEL = 0.1 SHEETS)
/datum/design/item/genfab/consumer/cleaning
	category = "Cleaning Supplies"

/datum/design/item/genfab/consumer/cleaning/mop
	name = "mop"
	build_path = /obj/item/weapon/mop
	materials = list(MATERIAL_STEEL = 1.5 SHEETS, MATERIAL_CLOTH = 0.25 SHEETS)

/datum/design/item/genfab/consumer/cleaning/rag
	build_path = /obj/item/weapon/reagent_containers/glass/rag
	materials = list(MATERIAL_CLOTH = 0.5 SHEETS)

/datum/design/item/genfab/consumer/cleaning/laundry_basket
	build_path = /obj/item/weapon/storage/laundry_basket
	materials = list(MATERIAL_PLASTIC = 0.5 SHEETS)

/datum/design/item/genfab/consumer/cleaning/trash_bag
	build_path = /obj/item/weapon/storage/bag/trash
	materials = list(MATERIAL_PLASTIC = 1 SHEETS)

/datum/design/item/genfab/consumer/cleaning/wet_floor
	build_path = /obj/item/weapon/caution
	materials = list(MATERIAL_PLASTIC = 1 SHEETS)

/datum/design/item/genfab/consumer/cleaning/mouestrap
	build_path = /obj/item/device/assembly/mousetrap
	materials = list(MATERIAL_STEEL = 0.25 SHEETS, MATERIAL_WOOD = 0.25 SHEETS)

/datum/design/item/genfab/consumer/cleaning/chemsprayer // tier 1
	materials = list(MATERIAL_STEEL = 3 SHEETS, MATERIAL_GLASS = 3 SHEETS, MATERIAL_SILVER = 1 SHEETS)
	build_path = /obj/item/weapon/reagent_containers/spray/chemsprayer



/datum/design/item/genfab/consumer/lipstick
	name = "red lipstick"
	build_path = /obj/item/weapon/lipstick
	materials = list(MATERIAL_PLASTIC = 0.25 SHEETS)
/datum/design/item/genfab/consumer/lipstick/purple
	name = "purple lipstick"
	build_path = /obj/item/weapon/lipstick/purple

/datum/design/item/genfab/consumer/lipstick/jade
	name = "jade lipstick"
	build_path = /obj/item/weapon/lipstick/jade

/datum/design/item/genfab/consumer/lipstick/black
	name = "black lipstick"
	build_path = /obj/item/weapon/lipstick/black

/datum/design/item/genfab/consumer/comb
	name = "comb"
	build_path = /obj/item/weapon/haircomb
	materials = list(MATERIAL_PLASTIC = 0.25 SHEETS)
/datum/design/item/genfab/consumer/picket_sign
	name = "Picket sign"
	build_path = /obj/item/weapon/picket_sign
	materials = list(MATERIAL_WOOD = 0.25 SHEETS)

/datum/design/item/genfab/consumer/water_flower
	name = "water flower"
	build_path = /obj/item/weapon/reagent_containers/spray/waterflower
	materials = list(MATERIAL_PLASTIC = 1 SHEETS)

//toys

/datum/design/item/genfab/consumer/toys/xmas_cracker
	materials = list(MATERIAL_PLASTIC = 0.5 SHEETS)
	build_path = /obj/item/toy/xmas_cracker




/datum/design/item/genfab/consumer/toys/prize // mecha figures
	category = "Figurines"
	materials = list(MATERIAL_PLASTIC = 0.25 SHEETS)




/datum/design/item/genfab/consumer/toys/prize/ripley // tier 0
	build_path = /obj/item/toy/prize/ripley

/datum/design/item/genfab/consumer/toys/prize/fireripley // tier 1
	build_path = /obj/item/toy/prize/fireripley

/datum/design/item/genfab/consumer/toys/prize/deathripley // tier 1
	build_path = /obj/item/toy/prize/deathripley

/datum/design/item/genfab/consumer/toys/prize/gygax // tier 1
	build_path = /obj/item/toy/prize/gygax

/datum/design/item/genfab/consumer/toys/prize/durand / /tier 2
	build_path = /obj/item/toy/prize/durand

/datum/design/item/genfab/consumer/toys/prize/honk / tier 2
	build_path = /obj/item/toy/prize/honk

/datum/design/item/genfab/consumer/toys/prize/marauder // tier 2
	build_path = /obj/item/toy/prize/marauder

/datum/design/item/genfab/consumer/toys/prize/seraph // tier 3
	build_path = /obj/item/toy/prize/seraph

/datum/design/item/genfab/consumer/toys/prize/mauler // tier 3
	build_path = /obj/item/toy/prize/mauler

/datum/design/item/genfab/consumer/toys/prize/odysseus // tier 3
	build_path = /obj/item/toy/prize/odysseus

/datum/design/item/genfab/consumer/toys/prize/phazon // tier 4
	build_path = /obj/item/toy/prize/phazon

/datum/design/item/genfab/consumer/toys/figure //  figures
	materials = list(MATERIAL_PLASTIC = 0.15 SHEETS)
	category = "Figurines"
	
/datum/design/item/genfab/consumer/toys/figure/assistant // tier 0
	build_path = /obj/item/toy/figure/assistant

/datum/design/item/genfab/consumer/toys/figure/bartender // tier 0
	build_path = /obj/item/toy/figure/bartender

/datum/design/item/genfab/consumer/toys/figure/gardener // tier 0
	build_path = /obj/item/toy/figure/gardener

/datum/design/item/genfab/consumer/toys/figure/chef // tier 0
	build_path = /obj/item/toy/figure/chef

/datum/design/item/genfab/consumer/toys/figure/librarian // tier 0
	build_path = /obj/item/toy/figure/librarian

/datum/design/item/genfab/consumer/toys/figure/janitor // tier 0
	build_path = /obj/item/toy/figure/janitor

/datum/design/item/genfab/consumer/toys/figure/cargotech // tier 0
	build_path = /obj/item/toy/figure/cargotech

/datum/design/item/genfab/consumer/toys/figure/engineer // tier 1
	build_path = /obj/item/toy/figure/engineer

/datum/design/item/genfab/consumer/toys/figure/miner // tier 1
	build_path = /obj/item/toy/figure/miner

/datum/design/item/genfab/consumer/toys/figure/md // tier 1
	build_path = /obj/item/toy/figure/md

/datum/design/item/genfab/consumer/toys/figure/secofficer // tier 1
	build_path = /obj/item/toy/figure/secofficer

/datum/design/item/genfab/consumer/toys/figure/scientist // tier 1
	build_path = /obj/item/toy/figure/scientist

/datum/design/item/genfab/consumer/toys/figure/chaplain // tier 1
	build_path = /obj/item/toy/figure/chaplain

/datum/design/item/genfab/consumer/toys/figure/atmos // tier 1
	build_path = /obj/item/toy/figure/atmos

/datum/design/item/genfab/consumer/toys/figure/psychologist // tier 1 
	build_path = /obj/item/toy/figure/psychologist

/datum/design/item/genfab/consumer/toys/figure/paramedic // tier 1
	build_path = /obj/item/toy/figure/paramedic

/datum/design/item/genfab/consumer/toys/figure/roboticist // tier 1
	build_path = /obj/item/toy/figure/roboticist

/datum/design/item/genfab/consumer/toys/figure/geneticist // tier 1
	build_path = /obj/item/toy/figure/geneticist

/datum/design/item/genfab/consumer/toys/figure/chemist // tier 1
	build_path = /obj/item/toy/figure/chemist

/datum/design/item/genfab/consumer/toys/figure/cmo // tier 2
	build_path = /obj/item/toy/figure/cmo

/datum/design/item/genfab/consumer/toys/figure/ce // tier 2
	build_path = /obj/item/toy/figure/ce

/datum/design/item/genfab/consumer/toys/figure/detective // tier 2
	build_path = /obj/item/toy/figure/detective

/datum/design/item/genfab/consumer/toys/figure/hop // tier 2
	build_path = /obj/item/toy/figure/hop

/datum/design/item/genfab/consumer/toys/figure/hos // tier 2
	build_path = /obj/item/toy/figure/hos

/datum/design/item/genfab/consumer/toys/figure/qm // tier 2
	build_path = /obj/item/toy/figure/qm

/datum/design/item/genfab/consumer/toys/figure/rd // tier 2
	build_path = /obj/item/toy/figure/rd

/datum/design/item/genfab/consumer/toys/figure/warden // tier 2
	build_path = /obj/item/toy/figure/warden

/datum/design/item/genfab/consumer/toys/figure/borg // tier 3
	build_path = /obj/item/toy/figure/borg

/datum/design/item/genfab/consumer/toys/figure/captain // tier 3 
	build_path = /obj/item/toy/figure/captain

/datum/design/item/genfab/consumer/toys/figure/clown // tier 3 
	build_path = /obj/item/toy/figure/clown

/datum/design/item/genfab/consumer/toys/figure/corgi // tier 3
	build_path = /obj/item/toy/figure/corgi

/datum/design/item/genfab/consumer/toys/figure/mime // tier 3
	build_path = /obj/item/toy/figure/mime

/datum/design/item/genfab/consumer/toys/figure/ninja // tier 3
	build_path = /obj/item/toy/figure/ninja

/datum/design/item/genfab/consumer/toys/figure/wizard // tier 3
	build_path = /obj/item/toy/figure/wizard

/datum/design/item/genfab/consumer/toys/figure/agent // tier 3
	build_path = /obj/item/toy/figure/agent

/datum/design/item/genfab/consumer/toys/figure/dsquad // tier 4
	build_path = /obj/item/toy/figure/dsquad

/datum/design/item/genfab/consumer/toys/figure/syndie // tier 4
	build_path = /obj/item/toy/figure/syndie

/datum/design/item/genfab/consumer/toys/figure/ert // tier 4
	build_path = /obj/item/toy/figure/ert




/datum/design/item/genfab/consumer/toys/plushie
	materials = list(MATERIAL_CLOTH = 1 SHEETS, MATERIAL_PLASTIC = 0.25 SHEETS)

/datum/design/item/genfab/consumer/toys/plushie/nymph
	build_path = /obj/item/toy/plushie/nymph

/datum/design/item/genfab/consumer/toys/plushie/mouse
	build_path = /obj/item/toy/plushie/mouse

/datum/design/item/genfab/consumer/toys/plushie/kitten
	build_path = /obj/item/toy/plushie/kitten

/datum/design/item/genfab/consumer/toys/plushie/lizard
	build_path = /obj/item/toy/plushie/lizard

/datum/design/item/genfab/consumer/toys/plushie/spider
	build_path = /obj/item/toy/plushie/spider



/datum/design/item/genfab/consumer/toys/doll
	materials = list(MATERIAL_CLOTH = 0.5 SHEETS, MATERIAL_PLASTIC = 0.1 SHEETS)
/datum/design/item/genfab/consumer/toys/doll/red_doll
	name = "red doll"
	build_path = /obj/item/toy/therapy_red

/datum/design/item/genfab/consumer/toys/doll/purple_doll
	name = "purple doll"
	build_path = /obj/item/toy/therapy_purple

/datum/design/item/genfab/consumer/toys/doll/blue_doll
	name = "blue doll"
	build_path = /obj/item/toy/therapy_blue

/datum/design/item/genfab/consumer/toys/doll/yellow_doll
	name = "yellow doll"
	build_path = /obj/item/toy/therapy_yellow



/datum/design/item/genfab/consumer/toys/doll/green_doll
	name = "green doll"
	build_path = /obj/item/toy/therapy_green

/datum/design/item/genfab/consumer/toys/water_balloon
	name = "water balloon"
	build_path = /obj/item/toy/water_balloon
	materials = list(MATERIAL_PLASTIC = 0.25 SHEETS)

/datum/design/item/genfab/consumer/toys/ntballoon
	name = "nanotrasen balloon"
	build_path = /obj/item/toy/balloon/nanotrasen
	materials = list(MATERIAL_PLASTIC = 0.25 SHEETS)

/datum/design/item/genfab/consumer/toys/inflatableduck
	build_path = /obj/item/weapon/inflatable_duck
	materials = list(MATERIAL_PLASTIC = 0.5 SHEETS)


/datum/design/item/genfab/consumer/toys/blink
	name = "electronic blink toy game"
	build_path = /obj/item/toy/blink
	materials = list(MATERIAL_STEEL = 0.25 SHEETS)

/datum/design/item/genfab/consumer/toys/spinningtoy
	name = "gravitational singularity toy"
	build_path = /obj/item/toy/spinningtoy
	materials = list(MATERIAL_STEEL = 0.25 SHEETS, MATERIAL_CLOTH = 0.25 SHEETS)

/datum/design/item/genfab/consumer/toys/crossbow
	name = "foam dart crossbow"
	build_path = /obj/item/toy/crossbow
	materials = list(MATERIAL_STEEL = 1 SHEETS)

/datum/design/item/genfab/consumer/toys/ammo/crossbow
	name = "foam dart"
	build_path = /obj/item/toy/ammo/crossbow
	materials = list(MATERIAL_STEEL = 0.01 SHEETS)

/datum/design/item/genfab/consumer/toys/snappop
	name = "snap pop"
	build_path = /obj/item/toy/snappop
	materials = list(MATERIAL_STEEL = 0.01 SHEETS)

/datum/design/item/genfab/consumer/games/dice/normal
	name = "bag of 7 dice (d6)"
	build_path = /obj/item/weapon/storage/pill_bottle/dice
	materials = list(MATERIAL_PLASTIC = 0.8 SHEETS)

/datum/design/item/genfab/consumer/games/dice/nerd
	name = "bag of 7 dice (tabletop set)"
	build_path = /obj/item/weapon/storage/pill_bottle/dice_nerd
	materials = list(MATERIAL_PLASTIC = 0.8 SHEETS)


/datum/design/item/genfab/consumer/games/cards
	name = "playing cards"
	build_path = /obj/item/weapon/deck/cards
	materials = list(MATERIAL_PLASTIC = 0.5 SHEETS)

/datum/design/item/genfab/consumer/games/tarot
	name = "tarot cards"
	build_path = /obj/item/weapon/deck/tarot
	materials = list(MATERIAL_PLASTIC = 0.25 SHEETS)

/datum/design/item/genfab/consumer/games/board
	name = "checkerboard"
	build_path = /obj/item/weapon/board
	materials = list(MATERIAL_WOOD = 0.25 SHEETS)
/datum/design/item/genfab/consumer/games/checker
	name = "black checker"
	build_path = /obj/item/weapon/checker

/datum/design/item/genfab/consumer/games/redchecker
	name = "red checker"
	build_path = /obj/item/weapon/checker/red

/datum/design/item/genfab/consumer/games/pawn
	name = "black pawn"
	build_path = /obj/item/weapon/checker/pawn

/datum/design/item/genfab/consumer/games/redpawn
	name = "red pawn"
	build_path = /obj/item/weapon/checker/pawn/red

/datum/design/item/genfab/consumer/games/knight
	name = "black knight"
	build_path = /obj/item/weapon/checker/knight

/datum/design/item/genfab/consumer/games/redknight
	name = "red knight"
	build_path = /obj/item/weapon/checker/knight/red

/datum/design/item/genfab/consumer/games/bishop
	name = "black bishop"
	build_path = /obj/item/weapon/checker/bishop

/datum/design/item/genfab/consumer/games/redbishop
	name = "red bishop"
	build_path = /obj/item/weapon/checker/bishop/red

/datum/design/item/genfab/consumer/games/rook
	name = "black rook"
	build_path = /obj/item/weapon/checker/rook

/datum/design/item/genfab/consumer/games/redrook
	name = "red rook"
	build_path = /obj/item/weapon/checker/rook/red

/datum/design/item/genfab/consumer/games/queen
	name = "black queen"
	build_path = /obj/item/weapon/checker/queen

/datum/design/item/genfab/consumer/games/redqueen
	name = "red queen"
	build_path = /obj/item/weapon/checker/queen/red

/datum/design/item/genfab/consumer/games/king
	name = "black king"
	build_path = /obj/item/weapon/checker/king

/datum/design/item/genfab/consumer/games/redking
	name = "red king"
	build_path = /obj/item/weapon/checker/king/red

/datum/design/item/genfab/consumer/games/cardemon
	name = "cardemon booster pack"
	build_path = /obj/item/weapon/pack/cardemon
	materials = list(MATERIAL_PLASTIC = 0.25 SHEETS)
/datum/design/item/genfab/consumer/games/spaceball
	name = "spaceball booster pack"
	build_path = /obj/item/weapon/pack/spaceball
	materials = list(MATERIAL_PLASTIC = 0.25 SHEETS)

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// SECURITY EQUIPMENT

/datum/design/item/genfab/sectools
	category = "Policing Equipment"

/datum/design/item/genfab/sectools/adv

/////////////////////////////////////////////////////////////////////////////

/datum/design/item/genfab/sectools/handcuffs 
	name = "handcuffs"
	build_path = /obj/item/weapon/handcuffs
	materials = list(MATERIAL_STEEL = 0.5 SHEET)
/datum/design/item/genfab/sectools/adv/hud
	materials = list(MATERIAL_STEEL = 0.1 SHEET, MATERIAL_GLASS = 0.1 SHEET)

/datum/design/item/genfab/sectools/adv/hud/AssembleDesignName()
	..()
	name = "HUD glasses prototype ([item_name])"

/datum/design/item/genfab/sectools/adv/hud/AssembleDesignDesc()
	desc = "Allows for the construction of \a [item_name] HUD glasses."




/datum/design/item/genfab/sectools/adv/hud/security
	name = "police hud"
	req_tech = list(TECH_MAGNET = 3, TECH_COMBAT = 2)
	build_path = /obj/item/clothing/glasses/hud/security
	materials = list(MATERIAL_STEEL = 0.25 SHEET, MATERIAL_GLASS = 0.25 SHEET)
/datum/design/item/genfab/sectools/adv/pepperspray
	name = "pepperspray (empty)"
	build_path = /obj/item/weapon/reagent_containers/spray/pepper
	materials = list(MATERIAL_STEEL = 0.1 SHEET, MATERIAL_GLASS = 0.1 SHEET)

/datum/design/item/genfab/sectools/flash
	build_path = /obj/item/device/flash
	materials = list(MATERIAL_STEEL = 3 SHEETS, MATERIAL_COPPER = 2 SHEET, MATERIAL_GOLD = 0.5 SHEET)

/datum/design/item/genfab/sectools/flash/advanced // tier 2
	build_path = /obj/item/device/flash/advanced
	materials = list(MATERIAL_STEEL = 5 SHEETS, MATERIAL_COPPER = 4 SHEET, MATERIAL_GOLD = 2 SHEET)


/datum/design/item/genfab/sectools/adv/riotshield // tier 3
	name = "riot shield"
	build_path = /obj/item/weapon/shield/riot
	materials = list(MATERIAL_STEEL = 4 SHEETS, MATERIAL_GLASS = 2 SHEETS, MATERIAL_GOLD = 0.5 SHEET)


/datum/design/item/genfab/sectools/adv/crimebriefcase
	name = "crime scene kit (empty)"
	build_path = /obj/item/weapon/storage/briefcase/crimekit
	materials = list(MATERIAL_STEEL = 2 SHEETS, MATERIAL_LEATHER = 1 SHEET)

/datum/design/item/genfab/sectools/adv/fingerprints
	name = "box of fingerprint cards."
	build_path = /obj/item/weapon/storage/box/fingerprints
	materials = list(MATERIAL_CARDBOARD = 1 SHEET)

/datum/design/item/genfab/sectools/adv/evidence
	name = "box of evidence bags."
	build_path = /obj/item/weapon/storage/box/evidence
	materials = list(MATERIAL_PLASTIC = 1.5 SHEET)


/datum/design/item/genfab/sectools/adv/swabs
	name = "box of swab sets."
	build_path = /obj/item/weapon/storage/box/swabs
	materials = list(MATERIAL_CARDBOARD = 0.5 SHEET, MATERIAL_GLASS = 0.5 SHEET)

/datum/design/item/genfab/sectools/adv/uvlight
	build_path = /obj/item/device/uv_light
	materials = list(MATERIAL_STEEL = 1 SHEET, MATERIAL_COPPER = 1 SHEET, MATERIAL_GLASS = 1 SHEET)

/datum/design/item/genfab/sectools/adv/samplekit
	build_path = /obj/item/weapon/forensics/sample_kit
	materials = list(MATERIAL_STEEL = 1 SHEET, MATERIAL_GOLD = 0.5 SHEET, MATERIAL_GLASS = 1 SHEET)

/datum/design/item/genfab/sectools/adv/samplekit/powder
	build_path = /obj/item/weapon/forensics/sample_kit/powder

/datum/design/item/genfab/sectools/adv/baton
	build_path = /obj/item/weapon/melee/baton
	materials = list(MATERIAL_STEEL = 1 SHEET, MATERIAL_GOLD = 1 SHEET)

/datum/design/item/genfab/sectools/adv/baton/classic
	build_path = /obj/item/weapon/melee/classic_baton
	materials = list(MATERIAL_STEEL = 1.5 SHEETS)

/datum/design/item/genfab/sectools/adv/telebaton // tier 1
	build_path = /obj/item/weapon/melee/telebaton
	materials = list(MATERIAL_STEEL = 1.5 SHEETS, MATERIAL_GOLD = 1 SHEET)

/datum/design/item/genfab/sectools/adv/hailer // tier 1
	build_path = /obj/item/device/hailer
	materials = list(MATERIAL_STEEL = 2 SHEETS, MATERIAL_COPPER = 1.2 SHEET)


/datum/design/item/genfab/sectools/adv/debugger // tier 1
	build_path = /obj/item/device/debugger
	materials = list(MATERIAL_STEEL = 1 SHEETS, MATERIAL_COPPER = 1 SHEET)



/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//MINING EQUIPMENT
/datum/design/item/genfab/miningtools
	category = "Mining Equipment"

/datum/design/item/genfab/miningtools/adv

//////////////////////////////////////////////////////////////////////////////

/datum/design/item/genfab/miningtools/adv/jackhammer
	req_tech = list(TECH_MATERIAL = 3, TECH_POWER = 2, TECH_ENGINEERING = 2)
	materials = list(MATERIAL_STEEL = 4 SHEETS, MATERIAL_COPPER = 2 SHEETS, MATERIAL_SILVER = 1 SHEETS)
	build_path = /obj/item/weapon/pickaxe/jackhammer

/datum/design/item/genfab/miningtools/pickaxe
	materials = list(MATERIAL_STEEL = 2 SHEETS)
	build_path = /obj/item/weapon/pickaxe

/datum/design/item/genfab/miningtools/hammer
	materials = list(MATERIAL_STEEL = 2 SHEETS)
	build_path = /obj/item/weapon/pickaxe/hammer

/datum/design/item/genfab/miningtools/flag/red
	materials = list(MATERIAL_CLOTH = 1 SHEETS)
	build_path = /obj/item/stack/flag/red

/datum/design/item/genfab/miningtools/flag/yellow
	materials = list(MATERIAL_CLOTH = 1 SHEETS)
	build_path = /obj/item/stack/flag/yellow

/datum/design/item/genfab/miningtools/flag/green
	materials = list(MATERIAL_CLOTH = 1 SHEETS)
	build_path = /obj/item/stack/flag/green

/datum/design/item/genfab/miningtools/flag/solgov
	materials = list(MATERIAL_CLOTH = 1 SHEETS)
	build_path = /obj/item/stack/flag/solgov

/datum/design/item/engifab/miningtools/lantern
	build_path = /obj/item/device/flashlight/lantern
	materials = list(MATERIAL_STEEL = 0.5 SHEETS, MATERIAL_GLASS = 0.25 SHEETS)




/datum/design/item/genfab/miningtools/adv/plasmacutter
	req_tech = list(TECH_MATERIAL = 4, TECH_PHORON = 3, TECH_ENGINEERING = 3)
	materials = list(MATERIAL_STEEL = 2 SHEETS, MATERIAL_GLASS = 1 SHEETS, MATERIAL_GOLD = 1 SHEETS, MATERIAL_PHORON = 2 SHEETS)
	build_path = /obj/item/weapon/gun/energy/plasmacutter

/datum/design/item/genfab/miningtools/adv/drill
	req_tech = list(TECH_MATERIAL = 6, TECH_POWER = 4, TECH_ENGINEERING = 4)
	materials = list(MATERIAL_STEEL = 2 SHEETS, MATERIAL_GLASS = 2 SHEETS, MATERIAL_DIAMOND = 3 SHEETS)
	build_path = /obj/item/weapon/pickaxe/drill

/datum/design/item/genfab/miningtools/adv/pick_diamond
	req_tech = list(TECH_MATERIAL = 6)
	materials = list(MATERIAL_DIAMOND = 2 SHEETS, MATERIAL_STEEL = 1 SHEET)
	build_path = /obj/item/weapon/pickaxe/diamond

/datum/design/item/genfab/miningtools/adv/drill_diamond
	req_tech = list(TECH_MATERIAL = 6, TECH_POWER = 4, TECH_ENGINEERING = 4)
	materials = list(MATERIAL_STEEL = 2 SHEETS, MATERIAL_GLASS = 2 SHEETS, MATERIAL_DIAMOND = 3 SHEETS)
	build_path = /obj/item/weapon/pickaxe/diamonddrill

/datum/design/item/genfab/miningtools/adv/mining_scanner
	req_tech = list(TECH_MAGNET = 2, TECH_ENGINEERING = 2)
	materials = list(MATERIAL_STEEL = 0.5 SHEETS,MATERIAL_GLASS = 0.5 SHEETS)
	build_path = /obj/item/weapon/mining_scanner

/datum/design/item/genfab/miningtools/adv/depth_scanner
	req_tech = list(TECH_MAGNET = 2, TECH_ENGINEERING = 2, TECH_BLUESPACE = 2)
	materials = list(MATERIAL_STEEL = 0.5 SHEETS,MATERIAL_GLASS = 0.5 SHEETS)
	build_path = /obj/item/device/depth_scanner

/datum/design/item/genfab/miningtools/adv/arch/brush
	materials = list(MATERIAL_STEEL = 1 SHEETS, MATERIAL_CLOTH = 0.5 SHEETS)
	build_path = /obj/item/weapon/pickaxe/brush

/datum/design/item/genfab/miningtools/adv/arch/one_pick
	materials = list(MATERIAL_STEEL = 1 SHEETS, MATERIAL_CLOTH = 0.5 SHEETS)
	build_path = /obj/item/weapon/pickaxe/one_pick

/datum/design/item/genfab/miningtools/adv/arch/two_pick
	materials = list(MATERIAL_STEEL = 1 SHEETS, MATERIAL_CLOTH = 0.5 SHEETS)
	build_path = /obj/item/weapon/pickaxe/two_pick

/datum/design/item/genfab/miningtools/adv/arch/three_pick
	materials = list(MATERIAL_STEEL = 1 SHEETS, MATERIAL_CLOTH = 0.5 SHEETS)
	build_path = /obj/item/weapon/pickaxe/one_pick

/datum/design/item/genfab/miningtools/adv/arch/three_pick
	materials = list(MATERIAL_STEEL = 1 SHEETS, MATERIAL_CLOTH = 0.5 SHEETS)
	build_path = /obj/item/weapon/pickaxe/three_pick

/datum/design/item/genfab/miningtools/adv/arch/four_pick
	materials = list(MATERIAL_STEEL = 1 SHEETS, MATERIAL_CLOTH = 0.5 SHEETS)
	build_path = /obj/item/weapon/pickaxe/four_pick

/datum/design/item/genfab/miningtools/adv/arch/five_pick
	materials = list(MATERIAL_STEEL = 1 SHEETS, MATERIAL_CLOTH = 0.5 SHEETS)
	build_path = /obj/item/weapon/pickaxe/five_pick

/datum/design/item/genfab/miningtools/adv/arch/six_pick
	materials = list(MATERIAL_STEEL = 1 SHEETS, MATERIAL_CLOTH = 0.5 SHEETS)
	build_path = /obj/item/weapon/pickaxe/six_pick

/datum/design/item/genfab/miningtools/adv/arch/hand
	materials = list(MATERIAL_STEEL = 1 SHEETS, MATERIAL_CLOTH = 0.5 SHEETS)
	build_path = /obj/item/weapon/pickaxe/hand



/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// SCIENCE EQUIPMENT

/datum/design/item/genfab/science
	category = "Science Equipment"

/datum/design/item/genfab/science/adv


/////////////////////////////////////////////

/datum/design/item/genfab/science/adv/ano_scanner
	name = "Alden-Saraspova counter"
	desc = "Aids in triangulation of exotic particles."
	req_tech = list(TECH_BLUESPACE = 3, TECH_MAGNET = 3)
	materials = list(MATERIAL_STEEL = 3 SHEETS,MATERIAL_GLASS = 2 SHEETS, MATERIAL_SILVER = 1 SHEET)
	build_path = /obj/item/device/ano_scanner

/datum/design/item/genfab/science/adv/core_sampler
	build_path = /obj/item/device/core_sampler

/datum/design/item/genfab/science/samplebags
	name = "box of sample bags."
	build_path = /obj/item/weapon/storage/box/evidence
	materials = list(MATERIAL_PLASTIC = 1.5 SHEET)


/**
/datum/design/item/genfab/science/adv/binaryencrypt
	name = "Binary encryption key"
	desc = "Allows for deciphering the binary channel on-the-fly."
	req_tech = list(TECH_ILLEGAL = 2)
	materials = list(MATERIAL_STEEL = 300, MATERIAL_GLASS = 300, MATERIAL_PHORON = 10000)
	build_path = /obj/item/device/encryptionkey/binary
**/
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
