local food = {
    j_gros_michel = true,
    j_egg = true,
    j_ice_cream = true,
    j_cavendish = true,
    j_turtle_bean = true,
    j_diet_cola = true,
    j_popcorn = true,
    j_ramen = true,
    j_seltzer = true,
    j_tss_shanks = true
}

SMODS.Joker{
    atlas = 'joker',
    key = 'giggles',
    pos = { x = 8, y = 0 },
    set_badges = function(self, card, badges) if (self.discovered) then
		badges[#badges+1] = slimeutils.table_create_badge(tss_badges.Goob)
	end end,
    discovered = true,
    blueprint_compat = false,
    rarity = 3,
    cost = 8,
    config = { extra = { xmult = 0 } },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult
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
            if my_pos and G.jokers.cards[my_pos + 1] and food[G.jokers.cards[my_pos+1].config.center_key] and not SMODS.is_eternal(G.jokers.cards[my_pos + 1], card) and not G.jokers.cards[my_pos + 1].getting_sliced then
                local eaten_card = G.jokers.cards[my_pos + 1]
                eaten_card.getting_sliced = true
                G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.joker_buffer = 0
                        card.ability.extra.xmult = card.ability.extra.xmult + eaten_card.sell_cost * 2
                        card:juice_up(0.8, 0.8)
                        eaten_card:start_dissolve({ HEX("FF6CDD") }, nil, 0.6)  
                        return true
                    end
                }))
                return {
                    message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult + 2 * eaten_card.sell_cost } },
                    colour = G.C.RED,
                    no_juice = true
                }
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}