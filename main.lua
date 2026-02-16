--[[TO DO LIST

- Add Heavenly Kitsune                                      [✅🪲]
    - 1 in 8 chance to turn scored cards into Aces
    - 1 in 16 chance for scored Aces to gain Kit's Favour
- Add Vouchers                                              [🔃]
    - Increases odds of seeing legendary jokers in the shop

- Add Cred (boss blind)										[❌]
	- first hand only scores if it's more than 25% of required score
- Add Helix
	- eats joker to either side of itself at random, gains 0.1 mult per joker
- Add MYKRA (uncommon)
    - Jokers with similar keywords to those you own are more likely to appear in the shop
- Add Giggles
	- At start of round, will eat any food based joker to its right and will add double the sell value to mult
	
- Add Mt. Celeste											[🔃]
	- randomly spawns strawberries across the screen, cookie clicker style:
		- Regular: adds X0.5 mult to joker
		- Winged: gives +1 hand
		- Golden: applies gold seal to random card
		- Winged Golden: gives +2 hands
		- Moonberry: Adds negative to a random joker
- Rebalance as necessary

---- BUG FIXES ----
- Flame Noble applies burn seal by the hand and not by the card.
- Heavenly Kitsune only applies Kit's favour to one card per hand
- Arcane-nine doesnt have working upgrade message.
]]

-- ====================META=DATA====================

-- Credits Tab --

SMODS.current_mod.extra_tabs = function()
	return {
		label = localize("tss_credits_label"),
		tab_definition_function = function()
			return {
				n = G.UIT.ROOT, config = { r = 0.5, align = "cm", padding = 0.2, colour = G.C.BLACK }, nodes = {
					{ n = G.UIT.R, config = { padding = 0, align = "cl" }, nodes = { 
						{ n = G.UIT.T, config = { text = localize("tss_credits_developer"), shadow = true, scale = 0.6 } },
						{ n = G.UIT.T, config = { text = "Alpha N. Q.", shadow = true, scale = 0.6, colour = G.C.BLUE } } 
					} }, 
					{ n = G.UIT.R, config = { padding = 0, align = "cl", scale = 0.5 }, nodes = {
						{ n = G.UIT.T, config = { text = localize("tss_credits_programminghelp"), shadow = true, scale = 0.45 } },
						{ n = G.UIT.T, config = { text = "slimestuff.", shadow = true, scale = 0.45, colour = G.C.BLUE } } 
					} },
					{ n = G.UIT.R, config = { padding = 0, align = "cl", scale = 0.1 }, nodes = {
						{ n = G.UIT.T, config = { text = localize("tss_credits_specialthanks"), shadow = true, scale = 0.45 } },
						{ n = G.UIT.T, config = { text = "Slyvie, xCred_64", shadow = true, scale = 0.45, colour = G.C.BLUE } } 
					} },
					{ n = G.UIT.R, config = { padding = 0.2, align = "cm" }, nodes = {
						UIBox_button{ minw = 3.85, colour = HEX("009DFF"), button = "alpha_bsky", label = {"BlueSky"} },
						UIBox_button{ minw = 3.85, colour = HEX("FF0000"), button = "alpha_youtube", label = {"YouTube"} },
						UIBox_button{ minw = 3.85, colour = HEX("334096"), button = "alpha_github", label = {"Github"} }
					} } 
				}
			}
		end
	}
end

-- tab buttons --

function G.FUNCS.alpha_bsky(e) love.system.openURL("https://bsky.app/profile/alphaanimates.bsky.social") end

function G.FUNCS.alpha_youtube(e) love.system.openURL("https://www.youtube.com/@AlphaAnimatez") end

function G.FUNCS.alpha_github(e) love.system.openURL("https://github.com/AlphaNQ") end

-- File Indexes --

local files = {
    "vouchers",
	"misc",
	"strawbs",
	"blinds",
	--"config",
	"http"
}

local jokers = {
    "heavenlykitsune",
    "arcanine",
    "flamenoble",
    "quickfox",
	"roulette",
	"ferretlady",
	"mykra",
	"giggles",
	"helix",
	"mtceleste",
    "bubblegum"
}

-- File Loader --

for i, v in ipairs(files) do
	assert(SMODS.load_file("lua/"..v..".lua"))()
end

for i, v in ipairs(jokers) do
	assert(SMODS.load_file("lua/jokers/"..v..".lua"))()
end

-- Text Colours --

loc_colour('red')
G.ARGS.LOC_COLOURS['quote'] = HEX('FA620CFF')
G.ARGS.LOC_COLOURS['burn'] = HEX('660000')

-- Text Prefix --

caption = '{C:quote,s:0.7,E:1}'

-- =====================ATLASES=====================

SMODS.Atlas {
    key = "modicon",
    path = "modicon.png",
    px = 32,
    py = 32
}

SMODS.Atlas {
    key = "joker",
    path = "jokers.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "effect",
    path = "effects.png",
    px = 71,
    py = 95,
}

SMODS.Atlas {
    key = "voucher",
    path = "vouchers.png",
    px = 71,
    py = 95,
}

SMODS.Atlas {
    key = "blind",
    path = "blinds.png",
    px = 34,
	py = 34,
	atlas_table = 'ANIMATION_ATLAS',
	frames = 21
}

SMODS.Atlas {
    key = "strawb",
    path = "strawb_soul.png",
    px = 71,
	py = 95,
	atlas_table = 'ANIMATION_ATLAS',
	frames = 9
}

SMODS.Atlas {
    key = "berry_n",
    path = "strawberry.png",
    px = 0,
	py = 0,
	atlas_table = 'ANIMATION_ATLAS',
	frames = 7
}

SMODS.Atlas {
    key = "berry_w",
    path = "wingberry.png",
    px = 36,
	py = 20,
	atlas_table = 'ANIMATION_ATLAS',
	frames = 9
}

SMODS.Atlas {
    key = "berry_g",
    path = "goldberry.png",
    px = 14,
	py = 17,
	atlas_table = 'ANIMATION_ATLAS',
	frames = 6
}

-- ======================BADGES=====================

tss_badges = {
	["Quake"] = function() return create_badge("The Leader", HEX('FFEE70'), G.C.MONEY, 0.8 ) end,
	["SO"] = function() return create_badge("The Associates", HEX('FF0000'), G.C.WHITE, 0.8 ) end,
	["Goob"] = function() return create_badge("Goofy Goobers", HEX('45B5FF'), G.C.WHITE, 0.8 ) end,
	["Xtra"] = function() return create_badge("Extras", HEX('43524C'), G.C.EDITION, 0.8 ) end,
	["LoL"] = function() return create_badge("Love of Labor", HEX('FF4DED'), G.C.WHITE, 0.8 ) end
}