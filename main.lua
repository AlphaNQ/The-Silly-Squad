--[[TO DO LIST

- Add Heavenly Kitsune                                      [✅]
    - 1 in 8 chance to turn scored cards into Aces
    - 1 in 16 chance for scored Aces to gain Kit's Favour
- Add Kit's Favour                                          [✅]
    - Retriggers card 5 times
- Add Arcane-nine                                           [✅🪲]
    - Scored aces give X2 Mult
    - Gains X0.5 Mult for every 10 Aces
- Add Quick Fox                                             [✅🪲]
    - spawns a "random" Tarot card when Least scored hand is played
    - 99% chance to spawn the fool, 1% chance to spawn judgement
- Add Wild Card(T.B.N)
    - Random Chance to act as Flame Noble, Kit's Favour, Arcanine-nine or Quick Fox(25% chance each)
- Add Vouchers                                              [🔃]
    - Increases odds of seeing legendary jokers in the shop
- Convert Kit's Favour into a Sticker
- Rebalance as necessary
- Add Blind (T.B.N)
    - debuffs all Ace Cards

---- BUG FIXES ----

- Heavenly Kitsune only applies Kit's favour to one card per hand
- Arcane-nine doesnt reset the count.
- Quick fox activates for every played hand
]]

-- ====================META=DATA====================

SMODS.current_mod.extra_tabs = function()
	local scale = 0.75
	return {
		label = localize("tss_credits_label"),
		tab_definition_function = function()
			return {
				n = G.UIT.ROOT,
				config = {
    				align = "cm",
	    			padding = 0,
		    		colour = G.C.CLEAR,
				},
				nodes = { {
					n = G.UIT.R,
					config = {
						padding = 0,
						align = "cl"
					},
					nodes = { {
						n = G.UIT.T,
						config = {
							text = localize("tss_credits_developer"),
							shadow = true,
							scale = scale * 0.8,
							colour = G.C.UI.TEXT_LIGHT
						}
					}, {
						n = G.UIT.T,
						config = {
							text = "Alpha N. Q.",
							shadow = true,
							scale = scale * 0.8,
							colour = G.C.BLUE
						}
					} }
				}, {
					n = G.UIT.R,
					config = {
						padding = 0,
						align = "cl",
						scale = scale * 0.6,
					},
					nodes = { {
						n = G.UIT.T,
						config = {
							text = localize("tss_credits_programminghelp"),
							shadow = true,
							scale = scale * 0.5,
							colour = G.C.UI.TEXT_LIGHT
						}
					}, {
						n = G.UIT.T,
						config = {
							text = "slimestuff.",
							shadow = true,
							scale = scale * 0.5,
							colour = G.C.BLUE
						}
					} }
				}, {
					n = G.UIT.R,
					config = {
						padding = 0,
						align = "cl",
						scale = scale * 0.6,
					},
					nodes = { {
						n = G.UIT.T,
						config = {
							text = localize("tss_credits_specialthanks"),
							shadow = true,
							scale = scale * 0.5,
							colour = G.C.UI.TEXT_LIGHT
						}
					}, {
						n = G.UIT.T,
						config = {
							text = "Slyvie, xCred_64",
							shadow = true,
							scale = scale * 0.5,
							colour = G.C.BLUE
						}
					} }
				}, {
					n = G.UIT.R,
					config = {
						padding = 0.2,
						align = "cm",
					},
					nodes = {
						UIBox_button{
							minw = 3.85,
                            colour = HEX("009DFF"),
							button = "alpha_bsky",
							label = {"BlueSky"}
						},
						UIBox_button{
							minw = 3.85,
							button = "alpha_youtube",
							label = {"YouTube"}
						},
						UIBox_button{
							minw = 3.85,
							colour = HEX("334096"),
							button = "alpha_github",
							label = {"Github"}
						}
					}
				} }
			}
		end
	}
end

function G.FUNCS.alpha_bsky(e) love.system.openURL("https://bsky.app/profile/alphaanimates.bsky.social") end

function G.FUNCS.alpha_youtube(e) love.system.openURL("https://www.youtube.com/@AlphaAnimatez") end

function G.FUNCS.alpha_github(e) love.system.openURL("https://github.com/AlphaNQ") end

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

-- ======================BADGES=====================

tss_badges = {
	["QuakeInc"] = function() return create_badge("Quake Inc.", HEX('888888'), G.C.WHITE, 0.8 ) end,
    ["Gods"] = function() return create_badge("Gods and Monsters", HEX('AAAAAA'), G.C.FILTER, 0.8 ) end,
}

-- ======================JOKERS=====================

SMODS.Joker {
    atlas = "joker",
	key = "flame",
	pos = { x = 1, y = 0 }, soul_pos = { x = 0, y = 0 },
    set_badges = function(self, card, badges) badges[#badges+1] = tss_badges.QuakeInc() end,
    discovered = true,
    rarity = 3,
    cost = 6,
    config = { extra = { burn_num = 1, burn_denom = 5 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_SEALS.tss_burned
        local burn_num, burn_denom = SMODS.get_probability_vars(card, card.ability.extra.burn_num, card.ability.extra.burn_denom)
        return { vars = { burn_num, burn_denom } }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.after then
            if SMODS.pseudorandom_probability(card, 'tss_flame', card.ability.extra.burn_num, card.ability.extra.burn_denom) then
                for _, scored_card in ipairs(context.scoring_hand) do
                    if not card.ability.tss_burned or not card.ability.tss_favour then
                        scored_card:set_seal("tss_burned")
                    end
	            end
                return {
                    message = localize('k_burn'),
                    colour = HEX('660000')
                }
            end
        end
    end
}

SMODS.Joker {
    atlas = 'joker',
    key = 'kitsune',
	pos = { x = 2, y = 0 }, soul_pos = { x = 0, y = 0 },
    set_badges = function(self, card, badges) badges[#badges+1] = tss_badges.Gods() end,
    discovered = true,
    rarity = 4,
    cost = 10,
    config = { extra = { ace_num = 1, ace_denom = 8, fave_num = 1, fave_denom = 16 } },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_SEALS.tss_favour
        local ace_num, ace_denom = SMODS.get_probability_vars(card, card.ability.extra.ace_num, card.ability.extra.ace_denom)
        local fave_num, fave_denom = SMODS.get_probability_vars(card, card.ability.extra.fave_num, card.ability.extra.fave_denom)
        return { vars = { ace_num, ace_denom, fave_num, fave_denom } }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.after then
            for _, scored_card in ipairs(context.scoring_hand) do
                -- Seal Application
                if scored_card:get_id() == 14 then
                    if SMODS.pseudorandom_probability(card, 'tss_kitsune', card.ability.extra.fave_num, card.ability.extra.fave_denom) then
                        if not card.ability.tss_favour or not card.ability.tss_burned then
                            scored_card:set_seal("tss_favour")              --Applies Kit's Favor
                        end
                        return {
                            message = localize('k_kiss'),                   --Shows message under Joker
                            colour = G.C.SECONDARY_SET.Planet
                        }
                    end
                -- Ace Conversion
                else
                    if SMODS.pseudorandom_probability(card, 'tss_arcane', card.ability.extra.ace_num, card.ability.extra.ace_denom) then
                        SMODS.change_base(scored_card, nil, 'Ace')          --Turns card into Ace   
                        return {
                            message = localize('k_poof'),                   --Shows message under Joker
                            colour = G.C.SECONDARY_SET.Planet
                        }
                    end
                end
            end
        end
    end
}

SMODS.Joker {
    atlas = 'joker',
    key = 'bnop',
	pos = { x = 3, y = 0 }, soul_pos = { x = 0, y = 0 },
    set_badges = function(self, card, badges) badges[#badges+1] = tss_badges.Gods() end,
    discovered = true,
    rarity = 4,
    cost = 10,
    config = { extra = { xmult = 2, xmult_mod = 0.5 }, ace_count = 10 },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.extra.xmult, 
                self.config.extra.xmult_mod,
                self.config.ace_count,
                card.ability.extra.xmult,
                card.ability.ace_count
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 14 then
            if card.ability.ace_count > 0 then
                card.ability.ace_count = card.ability.ace_count - 1
            end
            return {
                xmult = card.ability.extra.xmult
            }
        end
        if context.joker_main then
            for _, scored_card in ipairs(context.scoring_hand) do
                if scored_card:get_id() == 14 then
                    if card.ability.ace_count > 0 then
                        return {
                            message = card.ability.ace_count .. " remaining"
                        }
                    end
                    if card.ability.ace_count == 0 then
                        card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod,
                        card.ability.ace_count == 10
                        return {
                            message = localize('k_upgrade_ex'),
                        }
                    end
                end
            end
        end
    end
}

--[[SMODS.Joker {
    atlas = 'joker',
    key = 'foxxo',
	pos = { x = 4, y = 0 }, soul_pos = { x = 0, y = 0 },
    discovered = true,
    rarity = 2,
    cost = 5,
    config = { extra = { tarot_num = 1, tarot_denom = 2 } },
    calculate = function(self, card, context)
        if context.joker_main and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            local _handname, _played = 'High Card', -1
            for hand_key, hand in pairs(G.GAME.hands) do
                if hand.played > _played then
                    if SMODS.pseudorandom_probability(card, 'tss_foxxo', card.ability.extra.tarot_num, card.ability.extra.tarot_denom) then
                        G.E_MANAGER:add_event(Event({
                            func = (function()
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        SMODS.add_card { set = 'Tarot', key = 'c_fool'}
                                        G.GAME.consumeable_buffer = 0
                                        return true
                                    end
                                }))
                                SMODS.calculate_effect({ message = localize('k_plus_tarot'), colour = G.C.PURPLE }, context.blueprint_card or card)
                                return true
                            end)
                        }))
                    else
                        G.E_MANAGER:add_event(Event({
                            func = (function()
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        SMODS.add_card { set = 'Tarot', key = 'c_judgement' }
                                        G.GAME.consumeable_buffer = 0
                                        return true
                                    end
                                }))
                                SMODS.calculate_effect({ message = localize('k_plus_tarot'), colour = G.C.PURPLE }, context.blueprint_card or card)
                                return true
                            end)
                        }))
                    end
                    _played = hand.played
                    _handname = hand_key
                else
                    break
                end
            end
            local most_played = _handname
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
        end
    end
}]]

SMODS.Joker {
    atlas = 'joker',
    key = 'foxxo',
	pos = { x = 4, y = 0 }, soul_pos = { x = 0, y = 0 },
    discovered = true,
    rarity = 2,
    cost = 5,
    --config = { extra = { tarot_num = 1, tarot_denom = 2 } },
    calculate = function(self, card, context)
        if context.joker_main and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            local _handname, _played = 'High Card', -1
            for hand_key, hand in pairs(G.GAME.hands) do
                if hand.played > _played then
                    _played = hand.played
                    _handname = hand_key
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    SMODS.add_card { set = 'Tarot', key = 'c_fool'}
                                    G.GAME.consumeable_buffer = 0
                                    return true
                                end
                            }))
                            SMODS.calculate_effect({ message = localize('k_plus_tarot'), colour = G.C.PURPLE }, context.blueprint_card or card)
                            return true
                        end)
                    }))
                else
                    break --this line is only here because the code spawns multiple cards if it's gone.
                end
            end
            local most_played = _handname
        end
    end
}

-- =======================SEAL======================

SMODS.Seal {
    atlas = 'effect',
    key = "burned",
    pos = { x = 0, y = 0 },
    discovered = true,
    badge_colour = HEX("660000"),
    config = {
        extra = { uses = 5 }, chips = -10, xmult = 4 },
    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.chips, self.config.xmult, self.config.extra.uses, card.ability.seal.extra.uses } }
    end,
    calculate = function(self, card, context)
        -- Seal Effects
        if context.cardarea == G.play and context.main_scoring then
            card.ability.seal.extra.uses = card.ability.seal.extra.uses - 1
            return {
                chips = card.ability.seal.chips,
                xmult = card.ability.seal.xmult,
                message = card.ability.seal.extra.uses .. " remaining"
            }
        end
        -- Destroys card upon last use
        if context.destroy_card and card.ability.seal.extra.uses <= 0 then
            G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 2,
            func = function() 
                card:start_dissolve(no_juice == true)
            return true end }))
            return {
                remove = true,
                message = localize('k_char')
            }
        end
    end
}

-- =====================STICKER=====================

SMODS.Seal {
    atlas = 'effect',
    key = 'favour',
	pos = { x = 1, y = 0 },
    badge_colour = HEX('EE00FF'),
    discovered = true,
    config = { extra = { counts = 5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.extra.counts } }
    end,
    calculate = function(self, card, context)
        if context.repetition then
            return {
                repetitions = card.ability.seal.extra.counts
            }
        end
    end
}

-- =====================VOUCHERS====================

SMODS.Voucher{
    atlas = 'voucher',
    key = "cosmic",
    pos = { x = 0, y = 0 },
    discovered = true,
    cost = 10,
    redeem = function(self, card)
        -- 1 in 20 chance for shop Jokers to be Legendary
        local gcp_hook = get_current_pool
        function get_current_pool(_type, _rarity, _legendary, _append)
            if #SMODS.find_card("v_tss_cosmic")>0 and _type == 'Joker' and _append == 'sho' and pseudorandom('ellerar'..G.GAME.round_resets.ante.._append, 1, 20)==1 then
                _legendary = true 
            end
            return gcp_hook(_type, _rarity, _legendary, _append)
        end
    end
}

SMODS.Voucher{
    atlas = 'voucher',
    key = "void",
    pos = { x = 1, y = 0 },
    discovered = true,
    cost = 50,
    requires = { "v_tss_cosmic" },
    config = { mod_mult = 10 },
    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.mod_mult } }
    end,
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.legendary_mod = G.GAME.legendary_mod * card.ability.mod_mult
                return true
            end
        }))
    end
}