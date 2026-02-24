SMODS.Joker{
    atlas = 'joker',
    key = 'helix',
    pos = { x = 9, y = 0 }, soul_pos = { x = 0, y = 0 },
    set_badges = function(self, card, badges) if (self.discovered) then
		badges[#badges+1] = slimeutils.table_create_badge(tss_badges.Goob)
	end end,
    discovered = true,
    blueprint_compat = false,
    rarity = 1,
    cost = 4,
    config = { extra = { mult = 1, mult_mod = 0.2 } },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.extra.mult_mod,
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.setting_blind then
            local my_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    my_pos = i
                    break
                end
            end
            if my_pos and G.jokers.cards[my_pos + 1] and not SMODS.is_eternal(G.jokers.cards[my_pos + 1], card) and not G.jokers.cards[my_pos + 1].getting_sliced then
                local eaten_card = G.jokers.cards[my_pos + 1]
                eaten_card.getting_sliced = true
                G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.joker_buffer = 0
                        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
                        card:juice_up(0.8, 0.8)
                        eaten_card:start_dissolve({ HEX("FFCC00") }, nil, 0.6)  
                        return true
                    end
                }))
                return {
                    message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult + card.ability.extra.mult_mod } },
                    colour = G.C.RED,
                    no_juice = true
                }
            end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}