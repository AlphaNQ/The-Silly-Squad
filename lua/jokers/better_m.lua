SMODS.Joker{
    atlas = 'joker',
    key = 'better_m',
    pos = { x = 7, y = 0 }, soul_pos = { x = 0, y = 0 },
    set_badges = function(self, card, badges) if (self.discovered) then
		badges[#badges+1] = slimeutils.table_create_badge(tss_badges.Goob)
	end end,
    discovered = false,
    unlocked = false,
    rarity = 3,
    cost = 7,
    config = { extra = { rate = 2 } },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                self.config.extra.rate
            }
        }
    end,

    calculate = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.tarot_rate = 4 * card.ability.extra.rate
                return true
            end
        }))
    end
}