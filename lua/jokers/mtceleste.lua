SMODS.Joker{
    atlas = 'joker',
    key = 'mtceleste',
    pos = { x = 8, y = 1 }, soul_pos = { x = 8, y = 2 },
    set_badges = function(self, card, badges) if (self.discovered) then
		badges[#badges+1] = slimeutils.table_create_badge(tss_badges.LoL)
	end end,
    discovered = false,
    unlocked = false,
    rarity = 3,
    cost = 8,
    config = { extra = { xmult = 2.5 } },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {set = "Other", key = "tss_berry_n"}
        info_queue[#info_queue+1] = {set = "Other", key = "tss_berry_w"}
        info_queue[#info_queue+1] = {set = "Other", key = "tss_berry_g"}
        info_queue[#info_queue+1] = {set = "Other", key = "tss_berry_wg"}
        info_queue[#info_queue+1] = {set = "Other", key = "tss_berry_m"}
        return {
            vars = {
                card.ability.extra.xmult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.xmult
            }
        end
    end
}