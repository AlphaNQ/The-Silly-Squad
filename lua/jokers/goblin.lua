SMODS.Joker{
    atlas = 'joker',
    key = 'goblin',
    pos = { x = 1, y = 1 }, soul_pos = { x = 0, y = 0 },
    set_badges = function(self, card, badges) if (self.discovered) then
		badges[#badges+1] = slimeutils.table_create_badge(tss_badges.Goob)
	end end,
    discovered = true,
    rarity = 2,
    cost = 6,
    config = { extra = { xmult = 1, cost = 5 } },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.cost,
                card.ability.extra.xmult * math.floor(((G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0)) / card.ability.extra.cost)
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            if (math.floor(((G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0)))) < card.ability.extra.cost then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:start_dissolve()
                        return true
                    end
                }))
            else
                return{
                    xmult = card.ability.extra.xmult * math.floor(((G.GAME.dollars or 0) + (G.GAME.dollar_buffer or 0)) / card.ability.extra.cost),
                    ease_dollars(-card.ability.extra.cost)
                }
            end
        end
    end
}