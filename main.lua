--[[TO DO LIST

- Add Helix													[🔃]
	- eats joker to either side of itself at random, gains 0.1 mult per joker
- Add MYKRA (uncommon)										[🔃]
    - Jokers you own will be more likely to appear in the shop and be Negative.
- Add Funky
	- 1 in 20 chance to give x810 mult, else it's x0.8
- Add Cat
	- idk yet
- Add Toast
	- idk yet
- Add Cato
	- idk yet
- Add Pedro
	- X1 mult per blind played in a row. resets if blind is skipped.
- Add Totally Balanced
	- 1 in 5 chance to get heads, 8 heads in a row wins the run. can pay to upgrade odds,resets after each played hand.
- Add Hamburger (overcooked)
	- Each round, burger gets cooked by a random amount between 1 and 3. after 15 points, grants X3 mult
	- if it reaches 25, becomes burnt. eternal sticker, does nothing.

- Add Mt. Celeste											[🔃]
	- randomly spawns strawberries across the screen, cookie clicker style:
		- Regular: adds X0.5 mult to joker
		- Winged: gives +1 hand
		- Golden: applies gold seal to random card
		- Winged Golden: gives +2 hands
		- Moonberry: Adds negative to a random joker

- Rebalance as necessary

----   NOTES   ----

- Add seal protection to Flame Noble and Heavenly Kitsune.

---- BUG FIXES ----

- only hearts rule does not affect the loot pool from spectral cards
]]

-- ====================META=DATA====================

-- Credits Tab --

local function display_credits_card(key)
	local card = Card(G.ROOM.T.x,G.ROOM.T.y,G.CARD_W*0.8,G.CARD_H*0.8,nil,G.P_CENTERS[key], { bypass_discovery_center = true, bypass_discovery_ui = true })
	card.no_ui = true
	card.states.drag.can = false
	return card
end

SMODS.current_mod.extra_tabs = function()
	return {
		label = localize("tss_credits_label"),
		tab_definition_function = function()
			return { n = G.UIT.ROOT, config = { r = 0.5, align = "cm", padding = 0.2, colour = G.C.BLACK }, nodes = {
				{ n = G.UIT.C, config = { align = "cm", padding = 0.2, colour = G.C.L_BLACK }, nodes = {
					{ n = G.UIT.R, config = { r = 0.5, align = "cm" }, nodes = {
						{ n = G.UIT.C, config = { align = "cm", padding = 0.2, minw = 5 }, nodes = {
							{ n = G.UIT.R, config = { align = "cm" }, nodes = {
								{ n = G.UIT.T, config = { text = localize("tss_credits_assistant"), shadow = true, scale = 0.5 } }
							} },
							{ n = G.UIT.R, config = { align = "cm" }, nodes = {
								{ n = G.UIT.T, config = { text = "slimestuff.", shadow = true, scale = 0.5, colour = G.C.BLUE } }
							} },
							--[[{ n = G.UIT.R, config = { align = "cm" }, nodes = {
								{ n = G.UIT.O, config = { object = display_credits_card('j_tss_mtceleste') } }
							} }]]
						} },
						{ n = G.UIT.C, config = { align = "cm", padding = 0.2, minw = 5 }, nodes = {
							{ n = G.UIT.R, config = { align = "cm" }, nodes = {
								{ n = G.UIT.T, config = { text = localize("tss_credits_developer"), shadow = true, scale = 0.5 } }
							} },
							{ n = G.UIT.R, config = { align = "cm" }, nodes = {
								{ n = G.UIT.T, config = { text = "Amber N. Q.", shadow = true, scale = 0.5, colour = G.C.BLUE } }
							} },
							--[[{ n = G.UIT.R, config = { align = "cm" }, nodes = {
								{ n = G.UIT.O, config = { object = display_credits_card('j_tss_mtceleste') } }
							} }]]
						} },
						{ n = G.UIT.C, config = { align = "cm", padding = 0.2, minw = 5 }, nodes = {
							{ n = G.UIT.R, config = { align = "cm" }, nodes = {
								{ n = G.UIT.T, config = { text = localize("tss_credits_specialthanks"), shadow = true, scale = 0.5 } }
							} },
							{ n = G.UIT.R, config = { align = "cm" }, nodes = {
								{ n = G.UIT.T, config = { text = "NineTailedMenace", shadow = true, scale = 0.4, colour = G.C.BLUE } }
							} },
							{ n = G.UIT.R, config = { align = "cm" }, nodes = {
								{ n = G.UIT.T, config = { text = "xCred_64", shadow = true, scale = 0.4, colour = G.C.BLUE } }
							} },
							{ n = G.UIT.R, config = { align = "cm" }, nodes = {
								{ n = G.UIT.T, config = { text = "Prodabic", shadow = true, scale = 0.4, colour = G.C.BLUE } }
							} },
							--[[{ n = G.UIT.R, config = { maxw = 3, align = "cm" }, nodes = {
								{ n = G.UIT.O, config = { object = display_credits_card('j_tss_mtceleste') } },
								{ n = G.UIT.O, config = { object = display_credits_card('j_tss_mtceleste') } }
							} }]]
						} }
					} },
					{ n = G.UIT.R, config = { padding = 0.2, align = "cm" }, nodes = {
						UIBox_button{ minw = 3.85, colour = HEX("009DFF"), button = "alpha_bsky", label = {"BlueSky"} },
						UIBox_button{ minw = 3.85, colour = HEX("FF0000"), button = "alpha_youtube", label = {"YouTube"} },
						UIBox_button{ minw = 3.85, colour = HEX("334096"), button = "alpha_github", label = {"Github"} }
					} }	
				} }
			} }
		end
	}
end

-- tab buttons --

function G.FUNCS.alpha_bsky(e) love.system.openURL("https://bsky.app/profile/amberanimatez.bsky.social") end

function G.FUNCS.alpha_youtube(e) love.system.openURL("https://www.youtube.com/@AmberAnimatez") end

function G.FUNCS.alpha_github(e) love.system.openURL("https://github.com/AlphaNQ") end

-- File Indexes --

local files = {
	"misc",
	"strawbs",
	"blinds",
	"challenge",
	--"config",					--currently commented out as its functions do not work atm. working on a fix.
	"http"
}

local jokers = {
    "heavenlykitsune",
    "arcanine",
    "flamenoble",
    "quickfox",
	"roulette",
	"bankroll",
	"ferretlady",
	"mykra",
	"goblintactics",
	"hamshanks",
	"helix",
	"giggles",
	--"funky",
	"bribery",
	"mtceleste",
    "starla"
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
G.ARGS.LOC_COLOURS['crit'] = HEX('00FF00')

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

-- =====================SOUNDS======================

SMODS.Sound {
	key = "crit",
	path = "crit.ogg"
}

-- ======================HOOKS======================

local smods_add_to_pool_ref = SMODS.add_to_pool
function SMODS.add_to_pool(prototype_obj, args)
    if G.GAME.modifiers.tss_hearts_only then
        if SMODS.Suits[prototype_obj.key] and prototype_obj.card_key ~= 'H' then
            return false
        end
    end
    return smods_add_to_pool_ref(prototype_obj, args)
end

-- ======================BADGES=====================

tss_badges = {
	Quake = { text = "The Leader", colour = HEX('FFEE70'), text_colour = G.C.MONEY },
	SO = { text = "The Pookies", colour = HEX('FF0000') },
	Bun = { text = "Bun", colour = HEX('FADFA0'), text_colour = HEX('C17524') },
	Fop = { text = "Fop", colour = HEX('FBA124') },
	Goob = { text = "Goofy Goobers", colour = HEX('45B5FF') },
	Xtra = { text = "Extras", colour = HEX('43524C'), text_colour = G.C.EDITION },
	LoL = { text = "Love of Labor", colour = HEX('FF4DED') }
}