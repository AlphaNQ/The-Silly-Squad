-- ======================SEALS======================

SMODS.Seal {
    atlas = 'effect',
    key = "burned",
    pos = { x = 0, y = 0 },
    discovered = true,
    badge_colour = HEX("660000"),
    config = {
        extra = { uses = 5 }, chips = -10, xmult = 4 },
    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.chips, self.config.xmult, self.config.extra.uses, card.ability.seal.extra.uses } }
    end,
    calculate = function(self, card, context)
        -- Seal Effects
        if context.cardarea == G.play and context.main_scoring then
            card.ability.seal.extra.uses = card.ability.seal.extra.uses - 1
            return {
                chips = card.ability.seal.chips,
                xmult = card.ability.seal.xmult,
                message = card.ability.seal.extra.uses .. " remaining"
            }
        end
        -- Destroys card upon last use
        if context.destroy_card and card.ability.seal.extra.uses <= 0 then
            G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 2,
            func = function() 
                card:start_dissolve(no_juice == true)
            return true end }))
            return {
                remove = true,
                message = localize('k_char')
            }
        end
    end
}

SMODS.Seal {
    atlas = 'effect',
    key = 'favour',
	pos = { x = 1, y = 0 },
    badge_colour = HEX('EE00FF'),
    discovered = true,
    config = { extra = { counts = 5 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.extra.counts } }
    end,
    calculate = function(self, card, context)
        if context.repetition then
            return {
                repetitions = card.ability.seal.extra.counts
            }
        end
    end
}