SMODS.Joker{
    atlas = 'joker',
    key = 'funky',
    pos = { x = 3, y = 1 }, soul_pos = { x = 0, y = 0 },
    set_badges = function(self, card, badges) if (self.discovered) then
		badges[#badges+1] = slimeutils.table_create_badge(tss_badges.Goob)
	end end,
    discovered = false,
    unlocked = false,
    rarity = 2,
    cost = 5,
    config = { extra = { xmult_1 = 810, xmult_2 = 0.8, funk_odds = 20 } },

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.funk_odds)
        return {
            vars = {
                numerator,
                denominator,
                self.config.extra.xmult_1,
                self.config.extra.xmult_2
            }
        }
    end,
    
    calculate = function(self, card, context)
        if context.joker_main then
            if SMODS.pseudorandom_probability(card, 'tss_funky', 1, card.ability.extra.funk_odds) then
                return {
                    xmult = card.ability.extra.xmult_1
                }
            else
                return {
                    xmult = card.ability.extra.xmult_2
                }
            end
        end
    end
}