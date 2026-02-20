SMODS.Challenge{
    key = "burning_love",
    rules = {
        modifiers = {
            { id = 'hands', value = 5 },
            { id = 'discards', value = 5 },
        },
        custom = {
            { id = "tss_hearts_only" }
        }
    },
    jokers = {
        { id = "j_tss_flame", eternal = true }
    },
    restrictions = {
        banned_cards = {
            { id = 'j_smeared' },
            { id = 'j_rough_gem' },
            { id = 'j_arrowhead' },
            { id = 'j_onyx_agate' },
            { id = 'j_flower_pot' },
            { id = 'j_seeing_double' },
            { id = 'c_star' },
            { id = 'c_moon' },
            { id = 'c_sun' },
            { id = 'c_world' },
            { id = 'c_sigil' }
        },
        banned_other = {
            { id = 'bl_club', type = 'blind' },
            { id = 'bl_goad', type = 'blind' },
            { id = 'bl_window', type = 'blind' },
        }
    },
    deck = {
        type = 'Challenge Deck',
        cards = {
            { s = 'H', r = 'A' },
            { s = 'H', r = 'K' },
            { s = 'H', r = 'Q' },
            { s = 'H', r = 'J' },
            { s = 'H', r = 'T' },
            { s = 'H', r = '9' },
            { s = 'H', r = '8' },
            { s = 'H', r = '7' },
            { s = 'H', r = '6' },
            { s = 'H', r = '5' },
            { s = 'H', r = '4' },
            { s = 'H', r = '3' },
            { s = 'H', r = '2' },
            { s = 'H', r = '2' },
            { s = 'H', r = '2' },
            { s = 'H', r = '2' },
            { s = 'H', r = '2' },
            { s = 'H', r = '2' },
            { s = 'H', r = '2' },
            { s = 'H', r = '2' },
        }
    }
}