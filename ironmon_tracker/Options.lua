Options = {
	-- Tracks if any option elements were modified so we know if we need to save them to the Settings.ini file
	settingsUpdated = false,

	FIRST_RUN = true,

	FILES = {
		["ROMs Folder"] = "",
		["Randomizer JAR"] = "",
		["Source ROM"] = "",
		["Settings File"] = "",
	},

	-- 'Default' set of Options, but will get replaced by what's in Settings.ini
	["Disable mainscreen carousel"] = false,
	["Auto swap to enemy"] = true,
	["Hide stats until summary shown"] = false,
	["Right justified numbers"] = false,
	["Show physical special icons"] = true,
	["Show move effectiveness"] = true,
	["Calculate variable damage"] = true,
	["Count enemy PP usage"] = true,
	["Track PC Heals"] = false,
	["PC heals count downward"] = true,
	["Auto save tracked game data"] = true,
	["Pokemon icon set"] = "1", -- Original icon set
	["Show last damage calcs"] = true,
	["Reveal info if randomized"] = true,
	["Animated Pokemon popout"] = false,
	["Use premade ROMs"] = false,
	["Generate ROM each time"] = false,
	["Display repel usage"] = false,

	CONTROLS = {
		["Load next seed"] = "A, B, Start",
		["Toggle view"] = "Start",
		["Cycle through stats"] = "L",
		["Mark stat"] = "R",
	},
}

Options.IconSetMap = {
	totalCount = 4,
	["1"] = {
		name = "Original",
		folder = "pokemon",
		extension = ".gif",
		yOffset = 0,
		adjustQuestionMark = true, -- Whether to adjust the question mark icons in routeInfo screen
	},
	["2"] = {
		name = "Stadium",
		folder = "pokemonStadium",
		extension = ".png",
		yOffset = 4,
		adjustQuestionMark = false,
	},
	["3"] = {
		name = "Gen 7+",
		folder = "pokemonUpdated",
		extension = ".png",
		yOffset = 2,
		adjustQuestionMark = true,
	},
	["4"] = {
		name = "Explorers",
		folder = "pokemonMysteryDungeon",
		extension = ".png",
		yOffset = 4,
		adjustQuestionMark = false,
	}
}

function Options.initialize()
	-- Check if the Toggle View controller button is not default, and update the tip message if so.
	local toggleViewValue = Options.CONTROLS["Toggle view"]
	if toggleViewValue ~= "Start" then
		Constants.OrderedLists.TIPS[3] = Constants.OrderedLists.TIPS[3]:gsub("Start", toggleViewValue)
	end

	Drawing.AnimatedPokemon:create()
end

function Options.updateSetting(optionKey, value)
	Options[optionKey] = value
	Options.settingsUpdated = true
	Program.redraw(true)
end

function Options.forceSave()
	Options.settingsUpdated = true
	Main.SaveSettings()
	Program.redraw(true)
end