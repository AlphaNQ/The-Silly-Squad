## V 0.1.0 /// Kit Expansion

- Adds the Heavenly Kitsune Joker card.
  - 1 in 8 chance to turn scored cards into Aces.
  - 1 in 15 chance to give scored Aces the Kit's favor.

- Adds the Kit's Favour Seal.
  - Retriggers Played Card 5 times.

both additions are cosmetic at the moment and have no calculate functions. 

## V 0.1.1

- Made the Heavenly Kitsune Joker reference "Kit's Favour" instead of "Burned" because im a fucking idiot.

- fixed Kit's Favour text for variable number to be highlighted with {C:attention} instead of {C:green}
  in order to keep consistency with the original game.

- Reformatted Burned Seal text simply for aestetics :3

## V 0.1.2

- Added calculate funciton for Kit's Favour Seal.

## V 0.1.3

- Added calculate function for Heavenly Kitsune Joker card.

- Fixed a bug where Flame Noble's "Burned!" Text would pop up despite no cards being affected.

- Tweaked the Flame Noble Joker card to not reaply the Burned seal on cards that already have it.

## V 0.1.3a

- Added Credits tab.

- Added French Translation.

- Finished half of Heavenly Kitsune's calculate funciton. other half currently under production.

## V 0.1.3b

- Finished the other half of Heavenly Kitsune's calculate function. Still many minor bugs to patch though.

## V 0.2.0 /// Jackalope Expansion

- Added Arcane-nine Joker card (currently cosmetic, no calculate function)
  - Scored aces give X2 Mult
  - Gains X0.5 Mult for every 10 Aces

## V 0.2.1

- Added calculate funciton to Arcane-nine

- Added Arcane-nine's French localization

PLANS:

  - Changing Kit's Favour from Seal to Sticker to allow for both Burned Seal and Kit's Favour to appear on the same card.
    only thing currently stopping me is how much of a pain debugging will be without the ability to manualy add the sticker.

## V 0.2.2

- Adjusted card exclusion on Flame Noble and Heavenly Kitsune to include eachother's seals.

- attempting to fix a bug with Arcane-nine that doesnt reset the count, causing it to repeatedly upgrade after a single set of 
  ten Aces. Currently no luck.

## V 0.3.0 /// Funny Expansion :3

- Added Quick Fox Joker card
  - spawns a "random" Tarot card when least scored hand is played 🙂

- Added a Caption variable for extra flare in card descriptions :3

## V 0.3.1 /// FIRST OFFICIAL RELEASE

- Setup mod's official Github page.

- Added Quick Fox's French localization.

## V 0.3.2

- Fixed mod atlases to be more organised, leading to better preformance (not like it'll be noticable anyway).

- Added disclaimers to joker cards because the visuals are, very obviously, not done yet.

- Added Quick Fox's calculate function.
  to be clear, none of it works yet, and i dont know how to fix it at the moment. but it is there :3

## V 0.3.2a /// Mild Break

- Still attempting to fix Quick Fox with little results, please remain patient. In the meantime, this branch is seperated while i 
focus on other parts of the mod.

- Noticed that V 0.3.2 is still marked in the .json file as V 0.3.1. Sadly not something i can fix but this does not cause any
  major problems, just thought it was worth noting that.

- Adding two new Shop Vouchers
  - Cosmic: Legendary Jokers can appear in the Shop
  - Void: Legendary Jokers spawn 10x more frequently

## V 0.3.2b

- Added a custom icon. Why? Why not, im tired. i'll change the art eventually, i just wanted to figure out how to do it first.

- Quick Fox now... works at the least. it doesnt crash the game, but it still doesnt do exactly what it's supposed to yet.
  In the meantime, i'll be prioritising other projects to avoid losing flow.

## V 0.4.0 /// Overall Overhaul

This is where updates will start to get alot more disorganised. the original plan of this mod has been completed and we now
move on to bugfixes along with the more complimentary additions and changes.

- Added Bubblegum Joker card
  - X0.25 mult for every follower on Alpha's BlueSky Account.
  This is a blatant copy of the Elle card from "ellejokers.". that is the entire joke about this card, and she knows of this
  before I even published this update.

- Added Roulette Joker card
  - Random chance to act as either Flame Noble, Heavenly Kitsune, Arcane-nine or Quick Fox

- Added The F Student Boss Blind
  - All Ace cards are debuffed
  NOTE: with the way this blind is coded, any custom ranks that give the same amount of chips as Aces will also get debuffed.

- Other cards on the way, but currently locked to make sure you dont get them on your runs
  NOTE: do not bother "hacking" them in, they literally do nothing.

- Restructured mod's file system cause i fear this might get big real fast. You can only add so many dividers as comments
before they stop being effective.

## V 0.4.1

- fixed a locked card's localization script.

## V 0.4.2

- Reworded Roulette's description for extra clarity

- Fixed Arcanine's ace counter. short story is that i was an idiot, as per usual.

- Added more sprites and atlases. cant say what it's for yet ;3

## V 0.4.3

- Added more... things~ ;3

- Finally fixed the problem with Quick Fox where it would trigger on every hand. card now works as intended!

- Modified Quick Fox to trigger on most played hand instead of least played.

## V 0.4.4

- Updated French localization

- Changed Roulette to display "k_reset" message instead of "k_reroll" for accuracy.

- Fixed Arcane-nine not reseting ace count properly.

- Fixed Flame Noble applying the Burned Seal for every card in the hand instead of just one.

- Mildly updated Joker Atlas sheet.

- Added Ferret Lady Joker card
  - x4 mult per Flush type hand played this run.

- Added Quick Fox card art.

- Currently working on adding a new Challenge. (IN PROGRESS, NOT CURRENTLY ACCESSIBLE)

## V 0.4.5

- Changed Ferret Lady to be discovered by default

- Lowered Arcanine's rarity for extra odds of appearing

- Fixed Arcane-nine displaying "__ remaining" message despite no Aces being played.

- Updated all card rarities and costs to be more balanced.

- Fixed mild bug of Arcane-nine's "Upgrade!" message not displaying correctly.

- Fixed bug with Flame noble and Heavenly Kitsune where they would only trigger for one card in hand.
  NOTE: This fix has now caused another problem where their trigger message pops up despite cards not triggering. another fix is currently in progress.

## V.0.4.6

- Fixed the trigger message problem mentioned last update.

- Updated mod requirements to reflect upcoming cards along with adding links to each requirement.