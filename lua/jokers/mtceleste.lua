SMODS.Joker{
    atlas = 'joker',
    key = 'mtceleste',
    pos = { x = 0, y = 1 }, soul_pos = { x = 1, y = 1 },
    set_badges = function(self, card, badges) badges[#badges+1] = tss_badges.LoL() end,
    discovered = false,
    unlocked = false,
    rarity = 3,
    cost = 8,

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {set = "Other", key = "tss_berry_n"}
        info_queue[#info_queue+1] = {set = "Other", key = "tss_berry_w"}
        info_queue[#info_queue+1] = {set = "Other", key = "tss_berry_g"}
    end
}