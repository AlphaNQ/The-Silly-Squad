local bankroll = SMODS.Joker{
    atlas = 'joker',
    key = 'bankroll',
    pos = { x = 0, y = 1 }, soul_pos = { x = 0, y = 0 },
    set_badges = function(self, card, badges) if (self.discovered) then
		badges[#badges+1] = slimeutils.table_create_badge(tss_badges.Goob)
	end end,
    discovered = true,
    rarity = 2,
    cost = 0,
    config = { extra = { odds = 10, xblind = 2, used = false } },

    loc_vars = function(self, info_queue, card)
        local money = math.floor(G.GAME.dollars/2)
        return {
            vars = {
                money,
                money * 2
            }
        }
    end,

    calculate = function(self, card, context)
        if context.setting_blind then
            card.ability.extra.used = false
            return { message = "Slots reset!" }
        end
    end
}

bankroll.slime_active = {
	calculate = function(self, card)
        local money = math.floor(G.GAME.dollars/2)
        ease_dollars(-money)
		card.ability.extra.used = true
        if SMODS.pseudorandom_probability(card, 'tss_bankroll', 1, card.ability.extra.odds) then
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 3,
                func = function()
                    SMODS.calculate_effect( { message = "777" }, card )
                    ease_dollars(money * 2)
                    return true
                end
            }))
        else
            G.E_MANAGER:add_event(Event({
                trigger = "after",
                delay = 3,
                func = function()
                    SMODS.calculate_effect( { message = "XXX", colour = G.C.RED }, card )
        			G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.xblind
	        		G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
		        	SMODS.juice_up_blind()
                    return true
                end
            }))
        end
	end,
	can_use = function(self, card)
        return G.GAME.dollars > 1 and not card.ability.extra.used 
    end,
	should_close = function(self, card) return true end
}