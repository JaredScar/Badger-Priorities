# Badger-Priorities
## What is it?
So it's just a priority cooldown script... I know what you're thinking. This is already a thing, it's already made! Well actually I found problems with the ones I found on the Fivem forums, so I decided to make a new one with some extra features. Another feature is that when the cooldowns are on (priority in progress, priorities on hold, or cooldown is above 0), then a message will be displayed to players driving a car 80 MPH or faster. This can be disabled in the configuration file too if you don't want this feature though.
## Commands
`/cooldown <time>` Sets the amount of time priority cooldown is on (minutes) 

`/inprogress` Sets the priority to in progress. Use this when a priority begins. 

`/onhold` This puts all priorities on hold. It is an alternative to PeaceTime except players are able to attack others. 

`/resetpcd` Changes Priority Cooldown back to 0 Minutes.

## Permissions
`add_ace group.trialmoderator Badger-Priorities.ResetPCD allow` - Allowed to use /resetpcd
  
`add_ace group.trialmoderator Badger-Priorities.InProgress allow` - Allowed to use /inprogress

`add_ace group.trialmoderator Badger-Priorities.OnHold allow` - Allowed to use /onhold

`add_ace group.trialmoderator Badger-Priorities.Cooldown allow` - Allowed to use /cooldown

`add_ace group.trialmoderator Badger-Priorities.Commands allow` - Allowed to use all commands in the script

## Screenshots
![](https://i.gyazo.com/343b467912371eb048f9242d4f3ebc03.png)
  
![](https://i.gyazo.com/3111b17b03d45248b19b233f75505428.png)

![](https://i.gyazo.com/985329e40e72f10a22e6801b72246957.png)

![](https://i.gyazo.com/7210b532e55502b948f0ad2e50c3e5cb.png)

![](https://i.gyazo.com/b58d0d94b3b149bb48fea90a83bf58ff.png)

![](https://i.gyazo.com/35eb0c6207d57444803517cacfea1678.png)

![https://i.gyazo.com/877b6cc2c933453c272da2c27efdeaf5.gif](https://i.gyazo.com/877b6cc2c933453c272da2c27efdeaf5.gif)
## Configuration
```
Config = {
	prefix = "^7[^1Badger-Priorities^7] ^3",
	Options = {
		EnableSpeedMessage = true,
		EnablePCDMessage = true,
		EnableHoldMessage = true,
		EnableProgressMessage = true,
		EnableCooldownMessage = true,
		CenterText = true,
		AlwaysDisplay = true, -- Always display the priority cooldown text even with 0 mins left?
		CooldownDisplay = "~w~Priority Cooldown: ~r~{MINS} ~w~mins",
		InProgressDisplay = "~w~Priority Cooldown: ~g~Priority in Progress",
		OnHoldDisplay = "~w~Priority Cooldown: ~b~Priorities are on Hold",
		-- TooFastDisplay triggers when a car is going over 80 MPH and priorities are in progress, on hold, or a cooldown is active 
		TooFastDisplay = "~r~NOTICE: ~b~You cannot run from police currently. You are risking staff punishment!",
		resetDisplay = "~r~Cooldown: ~b~None"
	},
	Messages = {
		CooldownMessage = 'A priority was just conducted... The cooldown has been activated. ' -- You can also use {MINS} parameter here
		.. '^1You cannot run from police or cause any priorities (violent RP) until the cooldown has concluded!',
		InProgressMessage = 'There is a priority in progress... ^1You cannot run from police or cause any priorities (violent RP) until priorities are off hold!',
		OnHoldMessage = 'Priorities are now on hold... ^1You cannot run from police or cause any priorities (violent RP) until priorities are off hold!',
		resetMessage = 'Priorities Have Been Reset!'
	}, 
	DisplayLocation = {
		x = .50,
		y = .005
	}
}
```
