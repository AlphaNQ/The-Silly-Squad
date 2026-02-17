SMODS.Joker {
    atlas = 'joker',
    key = 'foxxo',
	pos = { x = 4, y = 0 }, soul_pos = { x = 0, y = 0 },
    set_badges = function(self, card, badges) badges[#badges+1] = tss_badges.SO() end,
    discovered = true,
    rarity = 1,
    cost = 4,
    config = { extra = { tarot_odds = 10 } },

    calculate = function(self, card, context)
        if context.final_scoring_step and #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            --log most played hand
            local handname, played = 'High Card', -1
            for hand_key, hand in pairs(G.GAME.hands) do
                if hand.played > played then
                    played = hand.played
                    handname = hand_key
                end
            end
            local most_played = handname
            if context.scoring_name == most_played then --checks if the current hand is the most played
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                --tarot spawn
                --game crashes if self.config is replaced with card.ability, not sure why
                if SMODS.pseudorandom_probability(card, 'tss_foxxo', 1, self.config.extra.tarot_odds) then 
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    SMODS.add_card {
                                        set = 'Tarot', 
                                        key = 'c_judgement'
                                    }
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
                                    SMODS.add_card {
                                        set = 'Tarot', 
                                        key = 'c_fool'
                                    }
                                    G.GAME.consumeable_buffer = 0
                                    return true
                                end
                            }))
                            SMODS.calculate_effect({ message = localize('k_plus_tarot'), colour = G.C.PURPLE }, context.blueprint_card or card)
                            return true
                        end)
                    }))
                end
            end
        end
    end
}