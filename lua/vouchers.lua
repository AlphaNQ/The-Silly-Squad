if not next(SMODS.find_mod("ellejokers")) then return end

SMODS.Voucher{
    atlas = 'voucher',
    key = "cosmic",
    pos = { x = 0, y = 0 },
    discovered = false,
    cost = 10,
    config = { mod_mult = 2 },
    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.mod_mult } }
    end,
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.legendary_mod = G.GAME.legendary_mod * card.ability.mod_mult
                return true
            end
        }))
    end
}

SMODS.Voucher{
    atlas = 'voucher',
    key = "void",
    pos = { x = 1, y = 0 },
    discovered = false,
    unlocked = false,
    cost = 50,
    requires = { "v_tss_cosmic" },
    config = { mod_mult = 4 },
    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.mod_mult } }
    end,
    redeem = function(self, card)
        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.legendary_mod = G.GAME.legendary_mod * card.ability.mod_mult
                return true
            end
        }))
    end
}