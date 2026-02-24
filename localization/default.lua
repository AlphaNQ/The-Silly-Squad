return {
    descriptions = {
        Back = {},
        Blind = {
            bl_tss_student = {
                name = 'The "F" Student',
                text = {
                    "All Ace cards",
                    "are debuffed"
                }
            }
        },
        Edition = {},
        Enhanced = {},
        Joker = {
            j_tss_arcanine = {
                name = "Arca-nine",
                text = {
                    "Scored Aces give {X:mult,C:white}X#1#{} Mult,",
                    "gains {X:mult,C:white}X#2#{} Mult for",
                    "every {C:attention}#3#{} {C:inactive}[#4#]{} Aces",
                    "{C:inactive}(Currently {X:mult,C:white}X#5#{C:inactive} Mult)"
                }
            },
            j_tss_bankroll = {
                name = "Bankroll",
                text = {
                    "{C:attention}Once per Round:",
                    "Gamble half your {C:money}$$${} {C:inactive}[#1#]{},",
                    "{C:green}win double back{} {C:inactive}[#2#]{} or",
                    "{C:red}double required chips"
                }
            },
            j_tss_bribery = {
                name = "Bribery",
                text = {
                    "pay {C:money}$#1#{} to instantly",
                    "win blind."
                }
            },
            j_tss_ferret_lady = {
                name = "Ferret Lady",
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand is a {C:attention}Flush{} type"
                }
            },
            j_tss_flame_noble = {
                name = "Flame Noble",
                text = {
                    "{C:green}#1# in #2#{} chance to", 
                    "{C:burn,E:1}burn{} cards when scored"
                }
            },
            j_tss_funky = {
                name = "Funky",
                text = {
                    "{C:green}#1# in #2#{} chance to",
                    "give {X:mult,C:white}X#3#{} Mult, or else",
                    "gives {X:mult,C:white}X#4#{} Mult"
                },
                unlock = {
                    "ERR 404: Card Not Found",
                }
            },
            j_tss_giggles = {
                name = "Giggles",
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "eat food-based Joker", 
                    "to the right and add {C:attention}double{}",
                    "its sell value to {X:mult,C:white}XMult{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult)"
                }
            },
            j_tss_goblin_tactics = {
                name = "Goblin Tactics",
                text = {
                    {
                        "{X:mult,C:white}X#1#{} Mult for",
                        "every {C:money}$#2#{} you have",
                        "{C:inactive}(Currently {X:mult,C:white}X#3#{C:inactive} Mult)"
                    }, {
                        "Lose {C:money}$#2#{} when triggered",
                        "Card {C:red}destroyed{} if you",
                        "run out of money",
                    }
                }
            },
            j_tss_ham_shanks = {
                name = {
                    "Hamuel's 518",
                    "Ham Shanks"
                },
                text = {
                    {
                        "{C:green}#1# in #2#{} chance to",
                        "{C:crit}CRITICAL HIT{} when",
                        "a card is triggered"
                    }, {
                        "{C:crit}CRITICAL HIT{}:",
                        "{X:chips,C:white}X#3#{} Chips | {X:mult,C:white}X#4#{} Mult"
                    }
                }
            },
            j_tss_heavenly_kitsune = {
                name = "Heavenly Kitsune",
                text = {
                    "{C:green}#1# in #2#{} chance to turn", 
                    "scored cards into an Ace", 
                    "{C:green}#3# in #4#{} chance to give", 
                    "scored Aces the {C:purple,E:1}Kit's Favor{}" --1 in 8, 1 in 16
                }
            },
            j_tss_helix = {
                name = "Helix",
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "destroy Joker to the right", 
                    "and add {C:mult}+#1#{} Mult per Joker.",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)"
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
                name = "The Better m",
                text = {
                    "Jokers with similar keywords",
                    "to those you own are more likely",
                    "to appear in the shop"
                },
                unlock = {
                    "ERR 404: Card Not Found",
                }
            },
            j_tss_quick_fox = {
                name = "Quick Fox",
                text = {
                    'Creates a {E:1}"random"{} {C:tarot}Tarot{} card',
                    "when {C:attention}most scored hand{} is played",
                    "{C:inactive}(Must have room){}",
                    caption.."The sneakiest in the animal kingdom ;3c"
                }
            },
            j_tss_roulette = {
                name = "Roulette",
                text = {
                    "At {C:attention}end of round{},",
                    "randomly switches between",
                    "{C:red}Flame Noble{}, {C:planet}Heavenly Kitsune{},",
                    "{C:purple}Arca-nine{}, and {C:attention}Quick Fox{}",
                    "{C:inactive}(Currently: {C:blue}#1#{C:inactive})"
                }
            },
            j_tss_starla = {
                name = "Starla",
                text = {
                    "{X:mult,C:white}X#1#{} Mult per {C:attention}Follower",
					"on {C:burn}Amber{}'s {C:blue}BlueSky{} account",
					"{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
					caption.."*blows you up with my mind*",
                },
                unlock = {
					"{E:1,s:1.3}?????"
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
                    "{C:blue}#1#{} Chips | {X:mult,C:white}X#2#{} Mult",
                    "Destroys after",
                    "{C:attention}#3#{} {C:inactive}[#4#]{} uses"
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
        Planet = {},
        Spectral = {},
        Stake = {},
        Tag = {},
        Tarot = {},
        Voucher = {}
    },
    misc = {
        achievement_descriptions = {},
        achievement_names = {},
        blind_states = {},
        challenge_names = {
            c_tss_burning_love = "Burning Love"
        },
        collabs = {},
        dictionary = {
            k_burn = "Burned!",
            k_char = "Charred!",
            k_crit = "CRITICAL HIT!",
            k_kiss = "*Mwah~!*",
            k_poof = "*Poof!*",
            tss_credits_label = "Credits",
            tss_credits_developer = "Developed By:",
            tss_credits_assistant = "Assistant Programmer:",
            tss_credits_specialthanks = "Special Thanks:",
            tss_joker_bribe = "BRIBE"
        },
        high_scores = {},
        labels = {
            tss_burned_seal = "Burned Seal",
            tss_favour_seal = "Favor Seal"
        },
        poker_hand_descriptions = {},
        poker_hands = {},
        quips = {},
        ranks = {},
        suits_plural = {},
        suits_singular = {},
        tutorial = {},
        v_dictionary = {},
        v_text = {
            ch_c_tss_hearts_only = { "Deck can {C:red}only{} contain cards with the {C:hearts}Heart{} suit." },
        },
    }
}