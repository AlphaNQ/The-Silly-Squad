return {
    descriptions = {
        Blind = {
            bl_tss_student = {
                name = 'The "F" Student',
                text = {
                    "All Ace cards",
                    "are debuffed"
                }
            }
        },
        Joker = {
            j_tss_bnop = {
                name = "Arcane-nine",
                text = {
                    "Scored Aces give {X:mult,C:white}X#1#{} Mult",
                    "Gains {X:mult,C:white}X#2#{} Mult for every {C:attention}#3#{} Aces",
                    "{C:inactive}(Currently {X:mult,C:white}X#4#{C:inactive} Mult)",
                    "{C:inactive}(#5# Aces Remaining){}"
                }
            },
            j_tss_bubble = {
                name = "Bubblegum",
                text = {
                    "{X:mult,C:white}X#1#{} Mult per {C:attention}Follower",
					"on {C:burn}Alpha{}'s {C:blue}BlueSky{} account",
					"{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
					caption.."*blows you up with my mind*",
                },
                unlock = {
					"{E:1,s:1.3}?????"
				}
            },
            j_tss_ferret = {
                name = "Ferret Lady",
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand is a {C:attention}Flush{} type"
                }
            },
            j_tss_flame = {
                name = "Flame Noble",
                text = {
                    '{C:green}#1# in #2#{} chance to', 
                    '{C:burn,E:1}burn{} cards when scored' --1 in 5
                }
            },
            j_tss_foxxo = {
                name = "Quick Fox",
                text = {
                    'Creates a {E:1}"random"{} {C:tarot}Tarot{} card',
                    "when {C:attention}most scored hand{} is played",
                    "{C:inactive}(Must have room){}",
                    caption.."The sneakiest in the animal kingdom ;3c"
                }
            },
            j_tss_giggles = {
                name = "Giggles",
                text = {
                    "At the start of the round, eats",
                    "any food based Joker to its", 
                    "right and adds double the sell",
                    "value to mult"
                },
                unlock = {
                    "ERR 404: Card Not Found",
                }
            },
            j_tss_helix = {
                name = "Helix",
                text = {
                    "Eats a random Joker to either",
                    "side of itself and gains 0.1",
                    "mult per Joker eaten"
                },
                unlock = {
                    "ERR 404: Card Not Found",
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
            j_tss_mtceleste = {
                name = "Mt. Celeste",
                text = {
                    "While this Joker is active,",
                    "spawns {C:red}strawberries{}",
                    "across the screen,",
                    "giving various buffs.",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)"
                },
                unlock = {
                    "ERR 404: Card Not Found",
                }
            },
            j_tss_mykra = {
                name = "MYKRA",
                text = {
                    "Jokers with similar keywords",
                    "to those you own are more likely",
                    "to appear in the shop"
                },
                unlock = {
                    "ERR 404: Card Not Found",
                }
            },
            j_tss_roulette = {
                name = "Roulette",
                text = {
                    "At {C:attention}end of round{},",
                    "randomly switches between",
                    "{C:red}Flame Noble{}, {C:planet}Heavenly Kitsune{},",
                    "{C:purple}Arcane-nine{}, and {C:attention}Quick Fox{}",
                    "{C:inactive}(Currently: {C:blue}#1#{C:inactive})"
                }
            }
        },
        Other = {
            tss_berry_n = {
                name = "Strawberry",
                text = {
                    "Mt. Celeste gains",
                    "{X:mult,C:white}X0.5{} Mult"
                }
            },
            tss_berry_w = {
                name = {
                    "Winged",
                    "Strawberry"
                },
                text = {
                    "{C:attention}+1{} hand"
                }
            },
            tss_berry_g = {
                name = "Golden Strawberry",
                text = {
                    "Mt. Celeste gains",
                    "{X:mult,C:white}X1{} Mult"
                }
            },
            tss_berry_wg = {
                name = {
                    "Winged Golden",
                    "Strawberry"
                },
                text = {
                    "{C:attention}+2{} hands"
                }
            },
            tss_berry_m = {
                name = "Moon Strawberry",
                text = {
                    "Adds {C:dark_edition}Negative{} to",
                    "a random Joker"
                }
            },
            tss_burned_seal = {
                name = 'Burned',
                text = {
                    '{C:blue}#1#{} Chips | {X:mult,C:white}X#2#{} Mult', 
                    'Destroys after {C:attention}#3#{} uses', 
                    '{C:inactive}(#4# Use(s) left){}'  -- -50 chips, X4 Mult, 10 uses, (use counter)
                }
            },
            tss_favour_seal = {
                name = "Kit's Favor",
                text = {
                    'Retrigger this',
                    'card {C:attention}#1#{} times{}' -- 5 times
                }
            }
        },
        Voucher = {
            v_tss_cosmic = {
                name = "Cosmic",
                text = {
                    "{C:legendary,E:1}Legendary{} Jokers appear",
                    "{X:mult,C:white}#1#X{} more often",
                }
            },
            v_tss_void = {
                name = "Void",
                text = {
                    "{C:legendary,E:1}Legendary{} Jokers appear",
                    "{X:mult,C:white}#1#X{} more often",
                },
                unlock = {
                    "Unlock 1 {C:legendary,E:1}Legendary{} Joker"
                }
            }
        }
    },
    misc = {
        labels = {
            tss_burned_seal = "Burned Seal",
            tss_favour_seal = "Favor Seal"
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