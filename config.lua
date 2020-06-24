Config = {
	prefix = "^7[^1Badger-Priorities^7] ^3",
	Options = {
		EnableSpeedMessage = true,
		EnablePCDMessage = true,
		EnableHoldMessage = true,
		EnableProgressMessage = true,
		EnableCooldownMessage = true,
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