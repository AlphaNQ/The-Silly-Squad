local bribery = SMODS.Joker{
    atlas = 'joker',
    key = 'bribery',
    pos = { x = 1, y = 1 }, soul_pos = { x = 0, y = 0 },
    set_badges = function(self, card, badges) if (self.discovered) then
		badges[#badges+1] = slimeutils.table_create_badge(tss_badges.Xtra)
	end end,
    discovered = true,
    rarity = 3,
    cost = 9,
    config = { extra = { cost = 50, used = true } },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.extra.cost,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.end_of_round then
            card.ability.extra.used = true
        end
        if context.setting_blind then
            card.ability.extra.used = false
        end
    end
}

bribery.slime_active = {
	calculate = function(self, card)
        ease_dollars(-card.ability.extra.cost)
		card.ability.extra.used = true
        G.GAME.chips = G.GAME.blind.chips
        G.STATE = G.STATES.HAND_PLAYED
        G.STATE_COMPLETE = true
        end_round()
	end,
	can_use = function(self, card)
        return G.GAME.dollars >= 50 and not card.ability.extra.used 
    end,
	should_close = function(self, card) return true end,
    name = function(self, card) return localize("tss_joker_bribe") end
}