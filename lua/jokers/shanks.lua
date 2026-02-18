SMODS.Joker{
    atlas = 'joker',
    key = 'shanks',
    pos = { x = 2, y = 1 }, soul_pos = { x = 0, y = 0 },
    set_badges = function(self, card, badges) if (self.discovered) then
		badges[#badges+1] = slimeutils.table_create_badge(tss_badges.Goob)
	end end,
    discovered = true,
    rarity = 3,
    cost = 7,
    config = { extra = { odds = 4, xchips = 3, xmult = 3 } },

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds)
        return {
            vars = {
                numerator,
                denominator,
                card.ability.extra.xchips,
                card.ability.extra.xmult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'tss_shanks', 1, card.ability.extra.odds) then
                G.E_MANAGER:add_event(Event({
                    trigger = "immediate",
                    func = function()
                        play_sound("tss_crit")
                        return true
                    end
                }))
                SMODS.calculate_effect( { message = localize('k_crit'), colour = HEX('00FF00') }, card )
                return {
                    xchips = card.ability.extra.xchips,
                    xmult = card.ability.extra.xmult,
                }
            end
        end
    end
}