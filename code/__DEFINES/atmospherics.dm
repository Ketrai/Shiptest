//ATMOS
//stuff you should probably leave well alone!
/// kPa*L/(K*mol)
#define R_IDEAL_GAS_EQUATION 8.31
/// kPa
#define ONE_ATMOSPHERE 101.325
/// -270.3degC
#define TCMB 2.7
/// -48.15degC
#define TCRYO 225
/// 0degC
#define T0C 273.15
/// 20degC
#define T20C 293.15

///moles in a 2.5 m^3 cell at 101.325 Pa and 20 degC
#define MOLES_CELLSTANDARD (ONE_ATMOSPHERE*CELL_VOLUME/(T20C*R_IDEAL_GAS_EQUATION))
///compared against for superconductivity
#define M_CELL_WITH_RATIO (MOLES_CELLSTANDARD * 0.005)
/// percentage of oxygen in a normal mixture of air
#define O2STANDARD 0.21
/// same but for nitrogen
#define N2STANDARD 0.79
/// O2 standard value (21%)
#define MOLES_O2STANDARD (MOLES_CELLSTANDARD*O2STANDARD)
/// N2 standard value (79%)
#define MOLES_N2STANDARD (MOLES_CELLSTANDARD*N2STANDARD)
/// liters in a cell
#define CELL_VOLUME 2500

/// liters in a normal breath
#define BREATH_VOLUME 0.5
/// Amount of air to take a from a tile
#define BREATH_PERCENTAGE (BREATH_VOLUME/CELL_VOLUME)


//EXCITED GROUPS
/// number of FULL air controller ticks before an excited group breaks down (averages gas contents across turfs)
#define EXCITED_GROUP_BREAKDOWN_CYCLES 4
/// number of FULL air controller ticks before an excited group dismantles and removes its turfs from active
#define EXCITED_GROUP_DISMANTLE_CYCLES 16
/// Ratio of air that must move to/from a tile to reset group processing
#define MINIMUM_AIR_RATIO_TO_SUSPEND 0.1
/// Minimum ratio of air that must move to/from a tile
#define MINIMUM_AIR_RATIO_TO_MOVE 0.001
/// Minimum amount of air that has to move before a group processing can be suspended
#define MINIMUM_AIR_TO_SUSPEND (MOLES_CELLSTANDARD*MINIMUM_AIR_RATIO_TO_SUSPEND)
/// Either this must be active
#define MINIMUM_MOLES_DELTA_TO_MOVE (MOLES_CELLSTANDARD*MINIMUM_AIR_RATIO_TO_MOVE)
/// or this (or both, obviously)
#define MINIMUM_TEMPERATURE_TO_MOVE (T20C+100)
/// Minimum temperature difference before group processing is suspended
#define MINIMUM_TEMPERATURE_DELTA_TO_SUSPEND 4
/// Minimum temperature difference before the gas temperatures are just set to be equal
#define MINIMUM_TEMPERATURE_DELTA_TO_CONSIDER 0.5
#define MINIMUM_TEMPERATURE_FOR_SUPERCONDUCTION (T20C+10)
#define MINIMUM_TEMPERATURE_START_SUPERCONDUCTION (T20C+200)

//HEAT TRANSFER COEFFICIENTS
//Must be between 0 and 1. Values closer to 1 equalize temperature faster
//Should not exceed 0.4 else strange heat flow occur
#define WALL_HEAT_TRANSFER_COEFFICIENT 0.0
#define OPEN_HEAT_TRANSFER_COEFFICIENT 0.4
/// a hack for now
#define WINDOW_HEAT_TRANSFER_COEFFICIENT 0.1
/// a hack to help make vacuums "cold", sacrificing realism for gameplay
#define HEAT_CAPACITY_VACUUM 7000

//FIRE
#define FIRE_MINIMUM_TEMPERATURE_TO_SPREAD (150+T0C)
#define FIRE_MINIMUM_TEMPERATURE_TO_EXIST (100+T0C)
#define FIRE_SPREAD_RADIOSITY_SCALE 0.85
#define FIRE_GROWTH_RATE 40000	//For small fires
#define PLASMA_MINIMUM_BURN_TEMPERATURE (100+T0C)
#define PLASMA_UPPER_TEMPERATURE (1370+T0C)
#define PLASMA_OXYGEN_FULLBURN 10

//COLD FIRE (this is used only for the freon-o2 reaction, there is no fire still)
#define COLD_FIRE_MAXIMUM_TEMPERATURE_TO_SPREAD 263 //fire will spread if the temperature is -10 °C
#define COLD_FIRE_MAXIMUM_TEMPERATURE_TO_EXIST 273 //fire will start if the temperature is 0 °C
#define COLD_FIRE_SPREAD_RADIOSITY_SCALE 0.95
#define COLD_FIRE_GROWTH_RATE 40000
#define FREON_MAXIMUM_BURN_TEMPERATURE 293
#define FREON_LOWER_TEMPERATURE 30 //minimum temperature allowed for the burn to go, we would have negative pressure otherwise
#define FREON_OXYGEN_FULLBURN 10

//GASES
#define MIN_TOXIC_GAS_DAMAGE 1
#define MAX_TOXIC_GAS_DAMAGE 10
/// Moles in a standard cell after which gases are visible
#define MOLES_GAS_VISIBLE 0.25

/// moles_visible * FACTOR_GAS_VISIBLE_MAX = Moles after which gas is at maximum visibility
#define FACTOR_GAS_VISIBLE_MAX 20
/// Mole step for alpha updates. This means alpha can update at 0.25, 0.5, 0.75 and so on
#define MOLES_GAS_VISIBLE_STEP 0.25

//REACTIONS
//return values for reactions (bitflags)
#define NO_REACTION 0
#define REACTING 1
#define STOP_REACTIONS 2

/// what min_cold_protection_temperature is set to for space-helmet quality headwear. MUST NOT BE 0.
#define SPACE_HELM_MIN_TEMP_PROTECT 2.0
/// Thermal insulation works both ways /Malkevin
#define SPACE_HELM_MAX_TEMP_PROTECT 1500
/// what min_cold_protection_temperature is set to for space-suit quality jumpsuits or suits. MUST NOT BE 0.
#define SPACE_SUIT_MIN_TEMP_PROTECT 2.0
#define SPACE_SUIT_MAX_TEMP_PROTECT 1500

/// Cold protection for firesuits
#define FIRE_SUIT_MIN_TEMP_PROTECT 60
/// what max_heat_protection_temperature is set to for firesuit quality suits. MUST NOT BE 0.
#define FIRE_SUIT_MAX_TEMP_PROTECT 30000
/// Cold protection for fire helmets
#define FIRE_HELM_MIN_TEMP_PROTECT 60
/// for fire helmet quality items (red and white hardhats)
#define FIRE_HELM_MAX_TEMP_PROTECT 30000

/// what max_heat_protection_temperature is set to for firesuit quality suits and helmets. MUST NOT BE 0.
#define FIRE_IMMUNITY_MAX_TEMP_PROTECT 35000

/// For normal helmets
#define HELMET_MIN_TEMP_PROTECT 160
/// For normal helmets
#define HELMET_MAX_TEMP_PROTECT 600
/// For armor
#define ARMOR_MIN_TEMP_PROTECT 160
/// For armor
#define ARMOR_MAX_TEMP_PROTECT 600

/// For some gloves (black and)
#define GLOVES_MIN_TEMP_PROTECT 2.0
/// For some gloves
#define GLOVES_MAX_TEMP_PROTECT 1500
/// For gloves
#define SHOES_MIN_TEMP_PROTECT 2.0
/// For gloves
#define SHOES_MAX_TEMP_PROTECT 1500

/// The amount of pressure damage someone takes is equal to (pressure / HAZARD_HIGH_PRESSURE)*PRESSURE_DAMAGE_COEFFICIENT, with the maximum of MAX_PRESSURE_DAMAGE
#define PRESSURE_DAMAGE_COEFFICIENT 4
#define MAX_HIGH_PRESSURE_DAMAGE 4
/// The amount of damage someone takes when in a low pressure area (The pressure threshold is so low that it doesn't make sense to do any calculations, so it just applies this flat value).
#define LOW_PRESSURE_DAMAGE 4

/// Humans are slowed by the difference between bodytemp and BODYTEMP_COLD_DAMAGE_LIMIT divided by this
#define COLD_SLOWDOWN_FACTOR 20

//PIPES
//Atmos pipe limits
/// (kPa) What pressure pumps and powered equipment max out at.
#define MAX_OUTPUT_PRESSURE 4500
/// (L/s) Maximum speed powered equipment can work at.
#define MAX_TRANSFER_RATE 200
/// 10% of an overclocked volume pump leaks into the air
#define VOLUME_PUMP_LEAK_AMOUNT 0.1
//used for device_type vars
#define UNARY 1
#define BINARY 2
#define TRINARY 3
#define QUATERNARY 4

//TANKS
/// temperature in kelvins at which a tank will start to melt
#define TANK_MELT_TEMPERATURE 1000000
/// Tank starts leaking
#define TANK_LEAK_PRESSURE (30.*ONE_ATMOSPHERE)
/// Tank spills all contents into atmosphere
#define TANK_RUPTURE_PRESSURE (35.*ONE_ATMOSPHERE)
/// Boom 3x3 base explosion
#define TANK_FRAGMENT_PRESSURE (40.*ONE_ATMOSPHERE)
/// +1 for each SCALE kPa aboe threshold
#define TANK_FRAGMENT_SCALE (6.*ONE_ATMOSPHERE)
#define TANK_MAX_RELEASE_PRESSURE (ONE_ATMOSPHERE*3)
#define TANK_MIN_RELEASE_PRESSURE 0
#define TANK_DEFAULT_RELEASE_PRESSURE 17

//CANATMOSPASS
#define ATMOS_PASS_YES 1
#define ATMOS_PASS_NO 0
/// ask CanAtmosPass()
#define ATMOS_PASS_PROC -1
/// just check density
#define ATMOS_PASS_DENSITY -2

#define CANATMOSPASS(A, O) ( A.CanAtmosPass == ATMOS_PASS_PROC ? A.CanAtmosPass(O) : ( A.CanAtmosPass == ATMOS_PASS_DENSITY ? !A.density : A.CanAtmosPass ) )
#define CANVERTICALATMOSPASS(A, O) ( A.CanAtmosPassVertical == ATMOS_PASS_PROC ? A.CanAtmosPass(O, TRUE) : ( A.CanAtmosPassVertical == ATMOS_PASS_DENSITY ? !A.density : A.CanAtmosPassVertical ) )

//OPEN TURF ATMOS
/// the default air mix that open turfs spawn
#define OPENTURF_DEFAULT_ATMOS "o2=22;n2=82;TEMP=293.15"
#define OPENTURF_LOW_PRESSURE "o2=14;n2=30;TEMP=293.15"
/// -193,15°C telecommunications. also used for xenobiology slime killrooms
#define TCOMMS_ATMOS "n2=100;TEMP=80"
/// space
#define AIRLESS_ATMOS "TEMP=2.7"
/// -93.15°C snow and ice turfs
#define FROZEN_ATMOS "o2=22;n2=82;TEMP=180"
/// -80°C kitchen coldroom; higher amount of mol to reach about 101.3 kpA
#define KITCHEN_COLDROOM_ATMOS "o2=33;n2=124;TEMP=193.15"
/// used in the holodeck burn test program
#define BURNMIX_ATMOS "o2=2500;plasma=5000;TEMP=370"

//ATMOSPHERICS DEPARTMENT GAS TANK TURFS
#define ATMOS_TANK_N2O "n2o=6000;TEMP=293.15"
#define ATMOS_TANK_CO2 "co2=50000;TEMP=293.15"
#define ATMOS_TANK_PLASMA "plasma=70000;TEMP=293.15"
#define ATMOS_TANK_O2 "o2=100000;TEMP=293.15"
#define ATMOS_TANK_N2 "n2=100000;TEMP=293.15"
#define ATMOS_TANK_AIRMIX "o2=2644;n2=10580;TEMP=293.15"

//LAVALAND
/// what pressure you have to be under to increase the effect of equipment meant for lavaland
#define LAVALAND_EQUIPMENT_EFFECT_PRESSURE 90
#define ICEMOON_DEFAULT_ATMOS "ICEMOON_ATMOS"

//ATMOS MIX IDS
#define LAVALAND_DEFAULT_ATMOS "LAVALAND_ATMOS"

//ATMOSIA GAS MONITOR TAGS
#define ATMOS_GAS_MONITOR_INPUT_O2 "o2_in"
#define ATMOS_GAS_MONITOR_OUTPUT_O2 "o2_out"
#define ATMOS_GAS_MONITOR_SENSOR_O2 "o2_sensor"

#define ATMOS_GAS_MONITOR_INPUT_TOX "tox_in"
#define ATMOS_GAS_MONITOR_OUTPUT_TOX "tox_out"
#define ATMOS_GAS_MONITOR_SENSOR_TOX "tox_sensor"

#define ATMOS_GAS_MONITOR_INPUT_AIR "air_in"
#define ATMOS_GAS_MONITOR_OUTPUT_AIR "air_out"
#define ATMOS_GAS_MONITOR_SENSOR_AIR "air_sensor"

#define ATMOS_GAS_MONITOR_INPUT_MIX "mix_in"
#define ATMOS_GAS_MONITOR_OUTPUT_MIX "mix_out"
#define ATMOS_GAS_MONITOR_SENSOR_MIX "mix_sensor"

#define ATMOS_GAS_MONITOR_INPUT_N2O "n2o_in"
#define ATMOS_GAS_MONITOR_OUTPUT_N2O "n2o_out"
#define ATMOS_GAS_MONITOR_SENSOR_N2O "n2o_sensor"

#define ATMOS_GAS_MONITOR_INPUT_N2 "n2_in"
#define ATMOS_GAS_MONITOR_OUTPUT_N2 "n2_out"
#define ATMOS_GAS_MONITOR_SENSOR_N2 "n2_sensor"

#define ATMOS_GAS_MONITOR_INPUT_CO2 "co2_in"
#define ATMOS_GAS_MONITOR_OUTPUT_CO2 "co2_out"
#define ATMOS_GAS_MONITOR_SENSOR_CO2 "co2_sensor"

#define ATMOS_GAS_MONITOR_INPUT_INCINERATOR "incinerator_in"
#define ATMOS_GAS_MONITOR_OUTPUT_INCINERATOR "incinerator_out"
#define ATMOS_GAS_MONITOR_SENSOR_INCINERATOR "incinerator_sensor"

#define ATMOS_GAS_MONITOR_INPUT_TOXINS_LAB "toxinslab_in"
#define ATMOS_GAS_MONITOR_OUTPUT_TOXINS_LAB "toxinslab_out"
#define ATMOS_GAS_MONITOR_SENSOR_TOXINS_LAB "toxinslab_sensor"

#define ATMOS_GAS_MONITOR_LOOP_DISTRIBUTION "distro-loop_meter"
#define ATMOS_GAS_MONITOR_LOOP_ATMOS_WASTE "atmos-waste_loop_meter"

#define ATMOS_GAS_MONITOR_WASTE_ENGINE "engine-waste_out"
#define ATMOS_GAS_MONITOR_WASTE_ATMOS "atmos-waste_out"

//AIRLOCK CONTROLLER TAGS

//RnD toxins burn chamber
#define INCINERATOR_TOXMIX_IGNITER "toxmix_igniter"
#define INCINERATOR_TOXMIX_VENT "toxmix_vent"
#define INCINERATOR_TOXMIX_DP_VENTPUMP "toxmix_airlock_pump"
#define INCINERATOR_TOXMIX_AIRLOCK_SENSOR "toxmix_airlock_sensor"
#define INCINERATOR_TOXMIX_AIRLOCK_CONTROLLER "toxmix_airlock_controller"
#define INCINERATOR_TOXMIX_AIRLOCK_INTERIOR "toxmix_airlock_interior"
#define INCINERATOR_TOXMIX_AIRLOCK_EXTERIOR "toxmix_airlock_exterior"

//Atmospherics/maintenance incinerator
#define INCINERATOR_ATMOS_IGNITER "atmos_incinerator_igniter"
#define INCINERATOR_ATMOS_MAINVENT "atmos_incinerator_mainvent"
#define INCINERATOR_ATMOS_AUXVENT "atmos_incinerator_auxvent"
#define INCINERATOR_ATMOS_DP_VENTPUMP "atmos_incinerator_airlock_pump"
#define INCINERATOR_ATMOS_AIRLOCK_SENSOR "atmos_incinerator_airlock_sensor"
#define INCINERATOR_ATMOS_AIRLOCK_CONTROLLER "atmos_incinerator_airlock_controller"
#define INCINERATOR_ATMOS_AIRLOCK_INTERIOR "atmos_incinerator_airlock_interior"
#define INCINERATOR_ATMOS_AIRLOCK_EXTERIOR "atmos_incinerator_airlock_exterior"

//Syndicate lavaland base incinerator (lavaland_surface_syndicate_base1.dmm)
#define INCINERATOR_SYNDICATELAVA_IGNITER "syndicatelava_igniter"
#define INCINERATOR_SYNDICATELAVA_MAINVENT "syndicatelava_mainvent"
#define INCINERATOR_SYNDICATELAVA_AUXVENT "syndicatelava_auxvent"
#define INCINERATOR_SYNDICATELAVA_DP_VENTPUMP "syndicatelava_airlock_pump"
#define INCINERATOR_SYNDICATELAVA_AIRLOCK_SENSOR "syndicatelava_airlock_sensor"
#define INCINERATOR_SYNDICATELAVA_AIRLOCK_CONTROLLER "syndicatelava_airlock_controller"
#define INCINERATOR_SYNDICATELAVA_AIRLOCK_INTERIOR "syndicatelava_airlock_interior"
#define INCINERATOR_SYNDICATELAVA_AIRLOCK_EXTERIOR "syndicatelava_airlock_exterior"

//MULTIPIPES
//IF YOU EVER CHANGE THESE CHANGE SPRITES TO MATCH.
#define PIPING_LAYER_MIN 1
#define PIPING_LAYER_MAX 5
#define PIPING_LAYER_DEFAULT 3
#define PIPING_LAYER_P_X 5
#define PIPING_LAYER_P_Y 5
#define PIPING_LAYER_LCHANGE 0.05

/// intended to connect with all layers, check for all instead of just one.
#define PIPING_ALL_LAYER (1<<0)
/// can only be built if nothing else with this flag is on the tile already.
#define PIPING_ONE_PER_TURF (1<<1)
/// can only exist at PIPING_LAYER_DEFAULT
#define PIPING_DEFAULT_LAYER_ONLY (1<<2)
/// north/south east/west doesn't matter, auto normalize on build.
#define PIPING_CARDINAL_AUTONORMALIZE (1<<3)

// Gas defines because i hate typepaths
#define GAS_O2 "o2"
#define GAS_N2 "n2"
#define GAS_CO2 "co2"
#define GAS_PLASMA "plasma"
#define GAS_H2O "water_vapor"
#define GAS_HYPERNOB "nob"
#define GAS_NITROUS "n2o"
#define GAS_NITRYL "no2"
#define GAS_TRITIUM "tritium"
#define GAS_BZ "bz"
#define GAS_STIMULUM "stim"
#define GAS_PLUOXIUM "pluox"
#define GAS_MIASMA "miasma"
#define GAS_FREON "freon"

#define GAS_FLAG_DANGEROUS (1<<0)
#define GAS_FLAG_BREATH_PROC (1<<1)

//HELPERS
#define PIPING_LAYER_SHIFT(T, PipingLayer) \
	if(T.dir & (NORTH|SOUTH)) {									 \
		T.pixel_x = (PipingLayer - PIPING_LAYER_DEFAULT) * PIPING_LAYER_P_X; \
	}																		 \
	if(T.dir & (EAST|WEST)) {										 \
		T.pixel_y = (PipingLayer - PIPING_LAYER_DEFAULT) * PIPING_LAYER_P_Y; \
	}

#define PIPING_FORWARD_SHIFT(T, PipingLayer, more_shift) \
	if(T.dir & (NORTH|SOUTH)) {									 \
		T.pixel_y += more_shift * (PipingLayer - PIPING_LAYER_DEFAULT); \
	}																		 \
	if(T.dir & (EAST|WEST)) {										 \
		T.pixel_x += more_shift * (PipingLayer - PIPING_LAYER_DEFAULT); \
	}

#define PIPING_LAYER_DOUBLE_SHIFT(T, PipingLayer) \
	T.pixel_x = (PipingLayer - PIPING_LAYER_DEFAULT) * PIPING_LAYER_P_X; \
	T.pixel_y = (PipingLayer - PIPING_LAYER_DEFAULT) * PIPING_LAYER_P_Y;

#ifdef TESTING
GLOBAL_LIST_INIT(atmos_adjacent_savings, list(0,0))
#define CALCULATE_ADJACENT_TURFS(T) if (SSadjacent_air.queue[T]) { GLOB.atmos_adjacent_savings[1] += 1 } else { GLOB.atmos_adjacent_savings[2] += 1; SSadjacent_air.queue[T] = 1 }
#else
#define CALCULATE_ADJACENT_TURFS(T) SSadjacent_air.queue[T] = 1
#endif

GLOBAL_VAR(atmos_extools_initialized) // this must be an uninitialized (null) one or init_monstermos will be called twice because reasons
#define ATMOS_EXTOOLS_CHECK if(!GLOB.atmos_extools_initialized){ \
	GLOB.atmos_extools_initialized=TRUE; \
	if(fexists(world.system_type == MS_WINDOWS ? "./byond-extools.dll" : "./libbyond-extools.so")){ \
		var/result = call((world.system_type == MS_WINDOWS ? "./byond-extools.dll" : "./libbyond-extools.so"),"init_monstermos")(); \
		if(result != "ok") {CRASH(result);} \
	} else { \
		CRASH("byond-extools.dll does not exist!"); \
	} \
}

GLOBAL_LIST_INIT(pipe_paint_colors, sortList(list(
	"amethyst" = rgb(130,43,255), //supplymain
	"blue" = rgb(0,0,255),
	"brown" = rgb(178,100,56),
	"cyan" = rgb(0,255,249),
	"dark" = rgb(69,69,69),
	"green" = rgb(30,255,0),
	"grey" = rgb(255,255,255),
	"orange" = rgb(255,129,25),
	"purple" = rgb(128,0,182),
	"red" = rgb(255,0,0),
	"violet" = rgb(64,0,128),
	"yellow" = rgb(255,198,0)
)))

#define MIASMA_CORPSE_MOLES 0.02
#define MIASMA_GIBS_MOLES 0.005
