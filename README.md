# PeaMacros
An addon for World of Warcraft to set personal action bar preferences

**TL/DR:** Create 12 macros. Each as a version for each character specialization. On Talent swaps, load the new speciialization.

## What is this?

### The Idea
I play many alt characters. I like messing around with various talents and specializations, and I'm a fan of conditional macros to accomplish thinks like mouseovers or attack my focus. Problem for me, I was running out of space in a 255 line macro to account for three specs, multiple talents, and conditionals.  

### The Style
As I've played alts, classes tend to follow patterns. For example, a Death Knight builds Runic Power, a Paladin builds up Holy Power, a Mage Arcane or Frost power, or a Warlock generates Soul Shards (or w/e they're called now).  So, I typically have a few 'power builder' actions and a few 'power spender' actions.  I also like a clean UI, so I like having one action bar. Meaning, I have conditionals in the macros where the same macro supports a SHIFT, CTRL or ALT option (and sometimes combinations).  Which leads to a library of 12 actions that may each be placed on the main action bar.

### Specialization Swapping
With having three versions of 12 actions, now we can tailor a macro library for each specialization. No more worrying about [spec:1] conditionals!  As you edit these spec-based macros, the addon saves your changes and recalls them for the next time.

### Current Features:
1. The ability to save 12 macros for each talent specialization. These persist through changes and update as you edit/fine tune them.
2. The macros are standard Blizzard macros - up to 255 characters.  All we're doing is saving them and replacing them with spec-versions.
3. A library of my pathetic knowledge of various classes. (Still adding classes - I dont play anything well, and some classes I'm just bad at).

### Future Features (no guarantee of *when*):
1. Add macros to action bars (configurable)

## CHANGELOG

### v1.00.003
1. Hunter default macros for Beast Master, Marksmanship and Survival

### v1.00.002
1. Added integration to CurseForge

### v1.00.001
1. Added save functionality so the 12 macros we create may be updated by the user, saved, and not overwritten by our defaults each talent swap.
2. Added slashcommand support /peamac reset to reset to default macros
3. Added class defaults for Demon Hunter, Paladin, Rogue, Warlock

### v1.00
1. Hello World!  I wrote a thing.
