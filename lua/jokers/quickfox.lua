-- VERSION 1 (UNFUNCTIONAL)

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

-- VERSION 2
SMODS.Joker {
    atlas = 'joker',
    key = 'foxxo',
	pos = { x = 4, y = 0 }, soul_pos = { x = 0, y = 0 },
    set_badges = function(self, card, badges) badges[#badges+1] = tss_badges.SO() end,
    discovered = true,
    rarity = 1,
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