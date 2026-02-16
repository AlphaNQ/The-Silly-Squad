SMODS.Joker {
    atlas = 'joker',
    key = 'bnop',
	pos = { x = 3, y = 0 }, soul_pos = { x = 0, y = 0 },
    set_badges = function(self, card, badges) badges[#badges+1] = tss_badges.SO() end,
    discovered = true,
    rarity = 3,
    cost = 10,
    config = { extra = { xmult = 2, xmult_mod = 0.5, ace_count = 10} },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.extra.xmult, 
                self.config.extra.xmult_mod,
                self.config.extra.ace_count,
                card.ability.extra.xmult,
                card.ability.extra.ace_count
            }
        }
    end,
    
    calculate = function(self, card, context)
        local reset = false
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 14 then
            if card.ability.extra.ace_count > 0 then
                card.ability.extra.ace_count = card.ability.extra.ace_count - 1
            end
            return {
                xmult = card.ability.extra.xmult
            }
        end
        if card.ability.extra.ace_count == 0 then
            reset = true
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_mod
            card.ability.extra.ace_count = 10
        end
        if context.joker_main then
            for _, scored_card in ipairs(context.scoring_hand) do
                if card.ability.extra.ace_count > 0 then
                    if reset then
                        reset = false
                        return {
                            message = localize('k_upgrade_ex'),
                        }
                    else
                        return {
                            message = card.ability.extra.ace_count .. " remaining"
                        }
                    end
                end
            end
        end  
    end
}