-- In this file you can set up all the properties and settings for your game mode.
USE_DEBUG = false                       -- Should we print statements on almost every function/event call? For debugging.

ENABLE_HERO_RESPAWN = true              -- Should the heroes automatically respawn on a timer or stay dead until manually respawned
UNIVERSAL_SHOP_MODE = false             -- Should the shops contain all items?
ALLOW_SAME_HERO_SELECTION = false       -- Should we let people select the same hero as each other
LOCK_TEAMS = false                      -- Should we Lock (true) or unlock (false) team assignemnt. If team assignment is locked players cannot change teams.

CUSTOM_GAME_SETUP_TIME = 25.0           -- How long should custom game setup last - the screen where players pick a team?
HERO_SELECTION_TIME = 30.0              -- How long should we let people select their hero?
HERO_SELECTION_PENALTY_TIME = 30.0      -- How long should the penalty time for not picking a hero last? During this time player loses gold.
ENABLE_BANNING_PHASE = false            -- Should we enable banning phase? Set to true if "EnablePickRules" is "1" in 'addoninfo.txt'
BANNING_PHASE_TIME = 20.0               -- How long should the banning phase last? This will work only if "EnablePickRules" is "1" in 'addoninfo.txt'
STRATEGY_TIME = 20.0                    -- How long should strategy time last? Bug: You can buy items during strategy time and it will not be spent!
SHOWCASE_TIME = 12.0                    -- How long should show case time be?
PRE_GAME_TIME = 5.0                    -- How long after people select their heroes should the horn blow and the game start?
POST_GAME_TIME = 60.0                   -- How long should we let people look at the scoreboard before closing the server automatically?
TREE_REGROW_TIME = 60.0                 -- How long should it take individual trees to respawn after being cut down/destroyed?

GOLD_PER_TICK = 0                     -- How much gold should players get per tick?
GOLD_TICK_TIME = 0                      -- How long should we wait in seconds between gold ticks?

NORMAL_START_GOLD = 600                 -- Starting Gold

RECOMMENDED_BUILDS_DISABLED = true     -- Should we disable the recommened builds for heroes
CAMERA_DISTANCE_OVERRIDE = 1600          -- How far out should we allow the camera to go?  Use -1 for the default (1134) while still allowing for panorama camera distance changes

MINIMAP_ICON_SIZE = 1                   -- What icon size should we use for our heroes?
MINIMAP_CREEP_ICON_SIZE = 1             -- What icon size should we use for creeps?
MINIMAP_RUNE_ICON_SIZE = 1              -- What icon size should we use for runes?

BUYBACK_ENABLED = false                 -- Should we allow people to buyback when they die?
CUSTOM_BUYBACK_COST_ENABLED = true      -- Should we use a custom buyback cost setting?
CUSTOM_BUYBACK_COOLDOWN_ENABLED = true  -- Should we use a custom buyback time?
CUSTOM_BUYBACK_COOLDOWN_TIME = 480.0    -- Custom buyback cooldown time (needed if CUSTOM_BUYBACK_COOLDOWN_ENABLED is true).
BUYBACK_FIXED_GOLD_COST = 500           -- Fixed custom buyback gold cost (needed if CUSTOM_BUYBACK_COST_ENABLED is true).

CUSTOM_SCAN_COOLDOWN = 210              -- Custom cooldown of Scan in seconds. Doesn't affect Scan's starting cooldown!
CUSTOM_GLYPH_COOLDOWN = 300             -- Custom cooldown of Glyph in seconds. Doesn't affect Glyph's starting cooldown!

DISABLE_FOG_OF_WAR_ENTIRELY = false     -- Should we disable fog of war entirely for both teams?
USE_UNSEEN_FOG_OF_WAR = true -- NOTE: DISABLE_FOG_OF_WAR_ENTIRELY must be false for USE_UNSEEN_FOG_OF_WAR to work
USE_STANDARD_DOTA_BOT_THINKING = false  -- Should we have bots act like they would in Dota? (This requires 3 lanes, normal items, etc)
USE_STANDARD_HERO_GOLD_BOUNTY = false    -- Should we give gold for hero kills the same as in Dota, or allow those values to be changed?
HERO_KILL_GOLD_BASE = 110               -- Hero gold bounty base value
HERO_KILL_GOLD_PER_LEVEL = 10           -- Hero gold bounty increase per level
HERO_KILL_GOLD_PER_STREAK = 60          -- Hero gold bounty per his kill-streak (Killing Spree: +HERO_KILL_GOLD_PER_STREAK gold; Ultrakill: +2 x HERO_KILL_GOLD_PER_STREAK gold ...)
DISABLE_ALL_GOLD_FROM_HERO_KILLS = false    -- Should we remove gold gain from hero kills? USE_CUSTOM_HERO_GOLD_BOUNTY needs to be true.
-- NOTE: DISABLE_ALL_GOLD_FROM_HERO_KILLS requires GoldFilter.
USE_CUSTOM_HERO_LEVELS = false          -- Should the heroes give a custom amount of XP when killed? Can malfunction for levels above 30!

USE_CUSTOM_TOP_BAR_VALUES = false        -- Should we do customized top bar values or use the default kill count per team?
TOP_BAR_VISIBLE = false                  -- Should we display the top bar score/count at all?
SHOW_KILLS_ON_TOPBAR = false             -- Should we display kills only on the top bar? (No denies, suicides, kills by neutrals)  Requires USE_CUSTOM_TOP_BAR_VALUES


ENABLE_TOWER_BACKDOOR_PROTECTION = false-- Should we enable backdoor protection for our towers?
REMOVE_ILLUSIONS_ON_DEATH = false       -- Should we remove all illusions if the main hero dies?
DISABLE_GOLD_SOUNDS = false             -- Should we disable the gold sound when players get gold?

END_GAME_ON_KILLS = false                -- Should the game end after a certain number of kills?
KILLS_TO_END_GAME_FOR_TEAM = 99         -- How many kills for a team should signify an end of game?

USE_CUSTOM_HERO_LEVELS = true           -- Should we allow heroes to have custom levels?
MAX_LEVEL = 12                          -- What level should we let heroes get to?
USE_CUSTOM_XP_VALUES = true             -- Should we use custom XP values to level up heroes, or the default Dota numbers?

-- Fill this table up with the required XP per level if you want to change it
XP_PER_LEVEL_TABLE = {}
XP_PER_LEVEL_TABLE[1] = 0
for i = 2, MAX_LEVEL do
  XP_PER_LEVEL_TABLE[i] = XP_PER_LEVEL_TABLE[i-1] + i*100
end

ENABLE_FIRST_BLOOD = false               -- Should we enable first blood for the first kill in this game?
HIDE_KILL_BANNERS = true               -- Should we hide the kill banners that show when a player is killed?
LOSE_GOLD_ON_DEATH = false               -- Should we have players lose the normal amount of dota gold on death?
SHOW_ONLY_PLAYER_INVENTORY = false      -- Should we only allow players to see their own inventory even when selecting other units?
DISABLE_STASH_PURCHASING = true        -- Should we prevent players from being able to buy items into their stash when not at a shop?
DISABLE_ANNOUNCER = true               -- Should we disable the announcer from working in the game?
FORCE_PICKED_HERO = nil                 -- What hero should we force all players to spawn as? (e.g. "npc_dota_hero_axe").  Use nil to allow players to pick their own hero.
-- This will not work if "EnablePickRules" is "1" in 'addoninfo.txt'!

ADD_ITEM_TO_HERO_ON_SPAWN = false       -- Add an example item to the picked hero when he spawns?

-- NOTE: use FIXED_RESPAWN_TIME if you want the same respawn time on every level.
MAX_RESPAWN_TIME = 125					-- Default Dota doesn't have a limit (it can go above 125). Fast game modes should have 20 seconds.
USE_CUSTOM_RESPAWN_TIMES = false		-- Should we use custom respawn times (true) or dota default (false)?

-- Fill this table with respawn times on each level if USE_CUSTOM_RESPAWN_TIMES is true.
CUSTOM_RESPAWN_TIME = {}
CUSTOM_RESPAWN_TIME[1] = 5
CUSTOM_RESPAWN_TIME[2] = 7
CUSTOM_RESPAWN_TIME[3] = 9
CUSTOM_RESPAWN_TIME[4] = 13
CUSTOM_RESPAWN_TIME[5] = 16
CUSTOM_RESPAWN_TIME[6] = 26
CUSTOM_RESPAWN_TIME[7] = 28
CUSTOM_RESPAWN_TIME[8] = 30
CUSTOM_RESPAWN_TIME[9] = 32
CUSTOM_RESPAWN_TIME[10] = 34
CUSTOM_RESPAWN_TIME[11] = 36
CUSTOM_RESPAWN_TIME[12] = 44
CUSTOM_RESPAWN_TIME[13] = 46
CUSTOM_RESPAWN_TIME[14] = 48
CUSTOM_RESPAWN_TIME[15] = 50
CUSTOM_RESPAWN_TIME[16] = 52
CUSTOM_RESPAWN_TIME[17] = 54
CUSTOM_RESPAWN_TIME[18] = 65
CUSTOM_RESPAWN_TIME[19] = 70
CUSTOM_RESPAWN_TIME[20] = 75
CUSTOM_RESPAWN_TIME[21] = 80
CUSTOM_RESPAWN_TIME[22] = 85
CUSTOM_RESPAWN_TIME[23] = 90
CUSTOM_RESPAWN_TIME[24] = 95
CUSTOM_RESPAWN_TIME[25] = 100

if MAX_LEVEL > 25 then
	for i = 26, MAX_LEVEL do
		CUSTOM_RESPAWN_TIME[i] = CUSTOM_RESPAWN_TIME[i-1] + 5
	end
end

FOUNTAIN_CONSTANT_MANA_REGEN = -1       -- What should we use for the constant fountain mana regen?  Use -1 to keep the default dota behavior.
FOUNTAIN_PERCENTAGE_MANA_REGEN = -1     -- What should we use for the percentage fountain mana regen?  Use -1 to keep the default dota behavior.
FOUNTAIN_PERCENTAGE_HEALTH_REGEN = -1   -- What should we use for the percentage fountain health regen?  Use -1 to keep the default dota behavior.
MAXIMUM_ATTACK_SPEED = 700              -- What should we use for the maximum attack speed?
MINIMUM_ATTACK_SPEED = 10               -- What should we use for the minimum attack speed?

DISABLE_DAY_NIGHT_CYCLE = false         -- Should we disable the day night cycle from naturally occurring? (Manual adjustment still possible)
DISABLE_KILLING_SPREE_ANNOUNCER = false -- Should we disable the killing spree announcer?
DISABLE_STICKY_ITEM = false             -- Should we disable the sticky item button in the quick buy area?
ENABLE_PAUSING = true                   -- Should we allow players to pause the game?
DEFAULT_DOTA_COURIER = true             -- Enable courier for each player with default dota properties

FORCE_MINIMAP_ON_THE_LEFT = false       -- Should we disable hud flip aka force the default dota hud positions? 
-- Note: Some players have minimap on the right and gold/shop on the left.

USE_DEFAULT_RUNE_SYSTEM = true          -- Should we use the default dota rune spawn timings and the same runes as dota have?
BOUNTY_RUNE_SPAWN_INTERVAL = 300        -- How long in seconds should we wait between bounty rune spawns? BUGGED! WORKS FOR POWERUPS TOO!
POWER_RUNE_SPAWN_INTERVAL = 120         -- How long in seconds should we wait between power-up runes spawns? BUGGED! WORKS FOR BOUNTIES TOO!


MAX_NUMBER_OF_TEAMS = 2                         -- How many potential teams can be in this game mode?
USE_CUSTOM_TEAM_COLORS = false                  -- Should we use custom team colors?
USE_CUSTOM_TEAM_COLORS_FOR_PLAYERS = false      -- Should we use custom team colors to color the players/minimap?

TEAM_COLORS = {}                        -- If USE_CUSTOM_TEAM_COLORS is set, use these colors.
TEAM_COLORS[DOTA_TEAM_GOODGUYS] = { 61, 210, 150 }  --    Teal
TEAM_COLORS[DOTA_TEAM_BADGUYS]  = { 243, 201, 9 }   --    Yellow
TEAM_COLORS[DOTA_TEAM_CUSTOM_1] = { 197, 77, 168 }  --    Pink
TEAM_COLORS[DOTA_TEAM_CUSTOM_2] = { 255, 108, 0 }   --    Orange
TEAM_COLORS[DOTA_TEAM_CUSTOM_3] = { 52, 85, 255 }   --    Blue
TEAM_COLORS[DOTA_TEAM_CUSTOM_4] = { 101, 212, 19 }  --    Green
TEAM_COLORS[DOTA_TEAM_CUSTOM_5] = { 129, 83, 54 }   --    Brown
TEAM_COLORS[DOTA_TEAM_CUSTOM_6] = { 27, 192, 216 }  --    Cyan
TEAM_COLORS[DOTA_TEAM_CUSTOM_7] = { 199, 228, 13 }  --    Olive
TEAM_COLORS[DOTA_TEAM_CUSTOM_8] = { 140, 42, 244 }  --    Purple

USE_AUTOMATIC_PLAYERS_PER_TEAM = true   -- Should we set the number of players to 10 / MAX_NUMBER_OF_TEAMS?

CUSTOM_TEAM_PLAYER_COUNT = {}           -- If we're not automatically setting the number of players per team, use this table
CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_GOODGUYS] = 5 -- you need to set this for each map if maps have a different max number of players per team
CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_BADGUYS]  = 5 -- you need to set this for each map if maps have a different max number of players
CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_1] = 0
CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_2] = 0
CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_3] = 0
CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_4] = 0
CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_5] = 0
CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_6] = 0
CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_7] = 0
CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_8] = 0

RUNE_SPAWN_TIME = 120                   -- How long in seconds should we wait between rune spawns?



FIXED_RESPAWN_TIME = 8                 -- What time should we use for a fixed respawn timer?  Use -1 to keep the default dota behavior.
FOUNTAIN_CONSTANT_MANA_REGEN = -1       -- What should we use for the constant fountain mana regen?  Use -1 to keep the default dota behavior.
FOUNTAIN_PERCENTAGE_MANA_REGEN = -1     -- What should we use for the percentage fountain mana regen?  Use -1 to keep the default dota behavior.
FOUNTAIN_PERCENTAGE_HEALTH_REGEN = -1   -- What should we use for the percentage fountain health regen?  Use -1 to keep the default dota behavior.
MAXIMUM_ATTACK_SPEED = 600              -- What should we use for the maximum attack speed?
MINIMUM_ATTACK_SPEED = 20               -- What should we use for the minimum attack speed?

GAME_END_DELAY = -1                     -- How long should we wait after the game winner is set to display the victory banner and End Screen?  Use -1 to keep the default (about 10 seconds)
VICTORY_MESSAGE_DURATION = 3            -- How long should we wait after the victory message displays to show the End Screen?  Use 
STARTING_GOLD = 0                     -- How much starting gold should we give to each player?
DISABLE_DAY_NIGHT_CYCLE = false         -- Should we disable the day night cycle from naturally occurring? (Manual adjustment still possible)
DISABLE_KILLING_SPREE_ANNOUNCER = true -- Shuold we disable the killing spree announcer?
DISABLE_STICKY_ITEM = true             -- Should we disable the sticky item button in the quick buy area?
SKIP_TEAM_SETUP = true                 -- Should we skip the team setup entirely?
ENABLE_AUTO_LAUNCH = true               -- Should we automatically have the game complete team setup after AUTO_LAUNCH_DELAY seconds?
AUTO_LAUNCH_DELAY = 30                  -- How long should the default team selection launch timer be?  The default for custom games is 30.  Setting to 0 will skip team selection.
LOCK_TEAM_SETUP = false                 -- Should we lock the teams initially?  Note that the host can still unlock the teams 


-- NOTE: You always need at least 2 non-bounty type runes to be able to spawn or your game will crash!
ENABLED_RUNES = {}                      -- Which runes should be enabled to spawn in our game mode?
ENABLED_RUNES[DOTA_RUNE_DOUBLEDAMAGE] = true
ENABLED_RUNES[DOTA_RUNE_HASTE] = true
ENABLED_RUNES[DOTA_RUNE_ILLUSION] = true
ENABLED_RUNES[DOTA_RUNE_INVISIBILITY] = true
ENABLED_RUNES[DOTA_RUNE_REGENERATION] = true
ENABLED_RUNES[DOTA_RUNE_BOUNTY] = true
ENABLED_RUNES[DOTA_RUNE_ARCANE] = true


MAX_NUMBER_OF_TEAMS = 2                -- How many potential teams can be in this game mode?
USE_CUSTOM_TEAM_COLORS = false           -- Should we use custom team colors?
USE_CUSTOM_TEAM_COLORS_FOR_PLAYERS = false          -- Should we use custom team colors to color the players/minimap?

TEAM_COLORS = {}                        -- If USE_CUSTOM_TEAM_COLORS is set, use these colors.
TEAM_COLORS[DOTA_TEAM_GOODGUYS] = { 61, 210, 150 }  --    Teal
TEAM_COLORS[DOTA_TEAM_BADGUYS]  = { 243, 201, 9 }   --    Yellow
TEAM_COLORS[DOTA_TEAM_CUSTOM_1] = { 197, 77, 168 }  --    Pink
TEAM_COLORS[DOTA_TEAM_CUSTOM_2] = { 255, 108, 0 }   --    Orange
TEAM_COLORS[DOTA_TEAM_CUSTOM_3] = { 52, 85, 255 }   --    Blue
TEAM_COLORS[DOTA_TEAM_CUSTOM_4] = { 101, 212, 19 }  --    Green
TEAM_COLORS[DOTA_TEAM_CUSTOM_5] = { 129, 83, 54 }   --    Brown
TEAM_COLORS[DOTA_TEAM_CUSTOM_6] = { 27, 192, 216 }  --    Cyan
TEAM_COLORS[DOTA_TEAM_CUSTOM_7] = { 199, 228, 13 }  --    Olive
TEAM_COLORS[DOTA_TEAM_CUSTOM_8] = { 140, 42, 244 }  --    Purple


USE_AUTOMATIC_PLAYERS_PER_TEAM = false   -- Should we set the number of players to 10 / MAX_NUMBER_OF_TEAMS?

CUSTOM_TEAM_PLAYER_COUNT = {}           -- If we're not automatically setting the number of players per team, use this table
CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_GOODGUYS] = 5
CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_BADGUYS]  =	5
CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_1] = 0
CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_2] = 0
CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_3] = 0
CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_4] = 0
CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_5] = 0
CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_6] = 0
CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_7] = 0
CUSTOM_TEAM_PLAYER_COUNT[DOTA_TEAM_CUSTOM_8] = 0

GLOBAL_VARIABLE_HERO_DPS_PER_LEVEL = 10*1.42
GLOBAL_VARIABLE_CREEP_DPS_PER_LEVEL = 5 

-- to be called on event GameMode:OnPlayerLevelUp()
GLOBAL_VARIABLE_CURRENT_HERO_LEVEL = 1
GLOBAL_VARIABLE_ADDITIONAL_DIFFICULTY_HERO_LEVEL = 0
GLOBAL_VARIABLE_COMBINED_DIFFICULTY = 0

GLOBAL_VARIABLE_TOTAL_COMBAT_TIME = 8
GLOBAL_VARIABLE_ADDITIONAL_HEALTH_PER_LEVEL = GLOBAL_VARIABLE_HERO_DPS_PER_LEVEL
--GLOBAL_VARIABLE_BASE_HEALTH = GLOBAL_VARIABLE_HERO_DPS_PER_LEVEL*GLOBAL_VARIABLE_TOTAL_COMBAT_TIME

GLOBAL_CONST_MOB_TYPE_HEALTH_MULTIPLIER_MINION = 0.45
GLOBAL_CONST_MOB_TYPE_HEALTH_MULTIPLIER_STANDARD = 1.0
GLOBAL_CONST_MOB_TYPE_HEALTH_MULTIPLIER_ELITE = 3.0
GLOBAL_CONST_MOB_TYPE_HEALTH_MULTIPLIER_BOSS = 15.0

GLOBAL_VARIABLE_ENABLE_GLOBAL_VARIABLE_INFO_TABLE = true

GLOBAL_VARIABLE_TOTAL_HEROES_IN_GAME = 0


HOME_TELEPORT_LOCATION_NPC_NAME_STRING = "tp_home_location"

NPC_AI_WANDER_DISTANCE = 256

GLOBAL_VARIABLE_WHITE_DROP_CHANCE = 35
GLOBAL_VARIABLE_GREEN_DROP_CHANCE = 25
GLOBAL_VARIABLE_BLUE_DROP_CHANCE = 15
GLOBAL_VARIABLE_PURPLE_DROP_CHANCE = 8
GLOBAL_VARIABLE_ORANGE_DROP_CHANCE = 1




GLOBAL_LEVELING_DATA_TABLE_CUSTOM = {}
-- you start at lvl 1, so no exp required to get to 1
GLOBAL_LEVELING_DATA_TABLE_CUSTOM.lvl1_to_2EXP = 400
GLOBAL_LEVELING_DATA_TABLE_CUSTOM.lvl2_to_3EXP = 1500
GLOBAL_LEVELING_DATA_TABLE_CUSTOM.lvl3_to_4EXP = 2200
GLOBAL_LEVELING_DATA_TABLE_CUSTOM.lvl4_to_5EXP = 2800
GLOBAL_LEVELING_DATA_TABLE_CUSTOM.lvl5_to_6EXP = 4200
GLOBAL_LEVELING_DATA_TABLE_CUSTOM.lvl6_to_7EXP = 4200
GLOBAL_LEVELING_DATA_TABLE_CUSTOM.lvl7_to_8EXP = 4200
GLOBAL_LEVELING_DATA_TABLE_CUSTOM.lvl8_to_9EXP = 4200
GLOBAL_LEVELING_DATA_TABLE_CUSTOM.lvl9_to_10EXP = 4200
GLOBAL_LEVELING_DATA_TABLE_CUSTOM.lvl10_to_11EXP = 4200
GLOBAL_LEVELING_DATA_TABLE_CUSTOM.lvl11_to_12EXP = 4200


-- 1.0 = 100% health
GLOBAL_VARIABLE_MAX_HEALTH_REGEN_PCT_FLOAT = 0.01
GLOBAL_VARIABLE_MAX_HEALTH_REGEN_PCT_PER_5_FLOAT = GLOBAL_VARIABLE_MAX_HEALTH_REGEN_PCT_FLOAT*5

GLOBAL_VARIABLE_MANA_REGEN_PER_INT = 1.0
-- int heroes that have recently cast a spell will regen a percentage of their standard mana regen - this multiplier is below
GLOBAL_VARIABLE_FSR_PERCENTAGE = 0.3




GLOBAL_STR_HERO_BASE_CRIT_CHANCE = 15.0
GLOBAL_STR_HERO_BASE_CRIT_DAMAGE = 1.75

GLOBAL_AGI_HERO_BASE_CRIT_CHANCE = 15.0
GLOBAL_AGI_HERO_BASE_CRIT_DAMAGE = 1.75
GLOBAL_AGI_RANGED_HERO_BASE_CRIT_CHANCE = 15.0
GLOBAL_AGI_RANGED_HERO_BASE_CRIT_DAMAGE = 1.75

GLOBAL_INT_HERO_BASE_CRIT_CHANCE = 12.0
GLOBAL_INT_HERO_BASE_CRIT_DAMAGE = 2.00


GLOBAL_VARIABLE_TRACKING_TOTAL_GATHERING_NODE_SPAWNS = 0
GLOBAL_VARIABLE_TRACKING_TOTAL_GATHERING_NODE_SPAWNS_ACTIVE = 0