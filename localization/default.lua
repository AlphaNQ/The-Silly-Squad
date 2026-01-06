return {
    descriptions = {
        Joker = {
            j_tss_flame = {
                name = "Flame Noble",
                text = {
                    '{C:green}#1# in #2#{} chance to', 
                    '{C:burn,E:1}burn{} cards when scored' --1 in 5
                }
            },
            j_tss_kitsune = {
                name = "Heavenly Kitsune",
                text = {
                    "{C:green}#1# in #2#{} chance to turn", 
                    "scored cards into an Ace", 
                    "{C:green}#3# in #4#{} chance to give", 
                    "scored Aces the {C:purple,E:1}Kit's Favor{}" --1 in 8, 1 in 16
                }
            },
            j_tss_bnop = {
                name = "Arcane-nine",
                text = {
                    "Scored Aces give {X:mult,C:white}X#1#{} Mult",
                    "Gains {X:mult,C:white}X#2#{} Mult for every {C:attention}#3#{} Aces",
                    "{C:inactive}(Currently {X:mult,C:white}X#4#{C:inactive} Mult)",
                    "{C:inactive}(#5# Aces Remaining){}"
                }
            },
            j_tss_foxxo = {
                name = "Quick Fox",
                text = {
                    "Creates a {E:1}random{} {C:tarot}Tarot{} card",
                    "when {C:attention}least scored hand{} is played",
                    caption.."The sneakiest in the animal kingdom ;3c",
                }
            }
        },
        Other = {
            tss_burned_seal = {
                name = 'Burned',
                text = {
                    '{C:blue}#1#{} Chips | {X:mult,C:white}X#2#{} Mult', 
                    'Destroys after {C:attention}#3#{} uses', 
                    '{C:inactive}(#4# Use(s) left){}'  -- -50 chips, X4 Mult, 10 uses, (use counter)
                }
            },
            tss_favour = {
                name = "Kit's Favor",
                text = {
                    'Retrigger this',
                    'card {C:attention}#1#{} times{}' -- 5 times
                }
            },
            tss_favour_seal = {
                name = "Kit's Favor",
                text = {
                    'Retrigger this',
                    'card {C:attention}#1#{} times{}' -- 5 times
                }
            }
        }
    },
    misc = {
        labels = {
            tss_burned_seal = "Burned Seal",
            tss_favour_seal = "Favor Seal",
            tss_favour = "Favour"
        },
        dictionary = {
            k_burn = "Burned!",
            k_char = "Charred!",
            k_kiss = "*Mwah~!*",
            k_poof = "*Poof!*",
            tss_credits_label = "Credits",
            tss_credits_developer = "Developed By: ",
            tss_credits_programminghelp = "Assistant Programmer: ",
            tss_credits_specialthanks = "Playtesters: "
        }
    }
}