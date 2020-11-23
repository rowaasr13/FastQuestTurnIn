Fast Quest Turn In, v2

* https://www.curseforge.com/wow/addons/fastquestturnin

A tool to help with mass turn in of any repeatable quest.

# What it does?
This addon helps you to turn in large amount of any repeatable quest fast exactly as much as you want. Use `/fq` chat command described below to set any key as "quest turn in key", go to quest giver and press that key until you done turning in desired amount of quests.

# How it is different?
* Other automatic turn in addons are generally tailored to specific quests - Alterac Valley, reputation grinds, etc. If you want repeatedly turn in less popular quests you generally has either find another addon or ask author of some addon to add that quest too. Some quests, like pre-Shadowlands Argent Crusade Scourge tokens turn ins appear for so short time, that nobody bothers to create addons for them at all.
* Automatic turn in addons generally scroll through all the pages without input, so you can't read the text if you interested and didn't see that quest before.
* Other addons are generally "all-in" - they turn in everything whether you like it or not which could mess up some goals, like attaining full reputation in old Dark Iron Dwarves reputation turn ins.

This addon uses semi-automatic on-demand approach that don't have all those problem: it works with any quest, it turns in exactly when you press button and exactly how much you want.

# How to use?

1. Type in chat: `/fq (key)`, to bind it to any key you want, for example `/fq f12` to bind to F12.
2. Target quest giver.
3. Keep pressing the key you've bound until you turned in what you wanted.

# Additional parameters

By default, pressing bound key selects first quest from quest giver and first reward in reward list. If you want to turn in another quest or select another reward, `/fq` command takes two optional parameters after key name: quest number and reward number.

For example:
`/fq f12 3 2` - means bind turn in on F12, turn in 3rd quest and select 2nd reward.

# Turning off

The keybind is temporary. It will be gone after leaving game or reloading UI with `/run ReloadUI()`.

# Useful side-effect

Since one of steps included in turning in quest is "interact with target" - i.e. same as right-clicking, you can use the bound key to catch moving targets in some quests: like scamps in Zuldazar or pig in arena in Freehold. Running around with mouse while pressing the key is easier than to do both just with mouse.
