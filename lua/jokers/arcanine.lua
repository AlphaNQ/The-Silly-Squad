SMODS.Joker {
    atlas = 'joker',
    key = 'bnop',
	pos = { x = 3, y = 0 }, soul_pos = { x = 0, y = 0 },
    set_badges = function(self, card, badges) if (self.discovered) then
		badges[#badges+1] = slimeutils.table_create_badge(tss_badges.Bun)
		badges[#badges+1] = slimeutils.table_create_badge(tss_badges.SO)
	end end,
    discovered = true,
    rarity = 2,
    cost = 6,
    config = { extra = { xmult = 2, xmult_mod = 0.5, ace_count = 10} },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.extra.xmult, 
                self.config.extra.xmult_mod,
                self.config.extra.ace_count,
                card.ability.extra.ace_count,
                card.ability.extra.xmult
            }
        }
    end,
    
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 14 then
            if card.ability.extra.ace_count > 0 then
                card.ability.extra.ace_count = card.ability.extra.ace_count - 1
            end
            if card.ability.extra.ace_count == 0 then
                card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
                card.ability.extra.ace_count = 10
                return {
                    xmult = card.ability.extra.xmult,
                    message = localize('k_upgrade_ex'),
                }
            else
                return {
                    xmult = card.ability.extra.xmult,
                    message = card.ability.extra.ace_count .. " remaining"
                }
            end
        end
    end
}