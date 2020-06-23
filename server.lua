-------------------------
--- Badger-Priorities ---
-------------------------

function msg(src, text)
  -- Send message 
  TriggerClientEvent('chatMessage', src, Config.prefix .. text);
end

RegisterNetEvent('Badger-Priorities:TriggerCheck')
AddEventHandler('Badger-Priorities:TriggerCheck', function()
  local src = source;
  if inProgess or onHold or (currentCooldownTime > 0) then 
    TriggerClientEvent('Badger-Priorities:TriggerTrue', src)
  end
end)

RegisterCommand("resetpcd", function(source, args, rawCommand)
  -- /resetpcd
  local src = source;
  if src <= 0 or IsPlayerAceAllowed(src, "Badger-Priorities.ResetPCD") or IsPlayerAceAllowed(src, "Badger-Priorities.Commands") then
    onHold = false;
    inProgress = false;
    currentCooldownTime = 0;
    local display = Config.Options.CooldownDisplay:gsub("{MINS}", currentCooldownTime);
    TriggerClientEvent('Badger-Priorities:DrawText', -1, display)
    if src > 0 then 
      msg(src, 'You have reset the priority cooldown...');
    else 
      print("You have reset the priority cooldown...");
    end
  end
end)
RegisterCommand("inprogress", function(source, args, rawCommand)
  -- /inprogress 
  local src = source;
  if src <= 0 or IsPlayerAceAllowed(src, "Badger-Priorities.InProgress") or IsPlayerAceAllowed(src, "Badger-Priorities.Commands") then
    onHold = false;
    inProgress = true;
    currentCooldownTime = 0;
    --msg(src, 'There is a priority in progress...');
    TriggerClientEvent('Badger-Priorities:DrawText', -1, Config.Options.InProgressDisplay:gsub("{MINS}", currentCooldownTime))
    msg(-1, Config.Messages.InProgressMessage) 
    if src <= 0 then 
      print(Config.Messages.InProgressMessage)
    end
  end
end)
RegisterCommand("onhold", function(source, args, rawCommand)
  -- /onhold 
  local src = source;
  if src <= 0 or IsPlayerAceAllowed(src, "Badger-Priorities.OnHold") or IsPlayerAceAllowed(src, "Badger-Priorities.Commands") then
    inProgress = false;
    onHold = true  
    currentCooldownTime = 0;
    --msg(src, 'The priorities have been set on hold...');
    TriggerClientEvent('Badger-Priorities:DrawText', -1, Config.Options.OnHoldDisplay:gsub("{MINS}", currentCooldownTime))
    msg(-1, Config.Messages.OnHoldMessage)
    if src <= 0 then 
      print(Config.Messages.OnHoldMessage)
    end
  end
end)
RegisterCommand("cooldown", function(source, args, rawCommand)
  -- /cooldown <time>
  local src = source;
  if src <= 0 or IsPlayerAceAllowed(src, "Badger-Priorities.Cooldown") or IsPlayerAceAllowed(src, "Badger-Priorities.Commands") then 
    if #args > 0 then 
      -- Check if number 
      if tonumber(args[1]) ~= nil then 
        local coold = tonumber(args[1]);
        currentCooldownTime = coold;
        inProgress = false;
        onHold = false;
        --msg(src, 'The cooldown has been set to ^7' .. args[1] .. ' ^3minutes...');
        local display = Config.Options.CooldownDisplay:gsub("{MINS}", currentCooldownTime);
        TriggerClientEvent('Badger-Priorities:DrawText', -1, display)
        if src > 0 then 
          msg(-1, Config.Messages.CooldownMessage:gsub("{MINS}", args[1]));
        else 
          msg(-1, Config.Messages.CooldownMessage:gsub("{MINS}", args[1]));
          print(Config.Messages.CooldownMessage:gsub("{MINS}", args[1]))
        end
      else 
        -- Not a number 
        msg(src, '^1ERROR: That is not a valid number');
      end
    else 
      -- You need an argument length over 0
      msg(src, '^1ERROR: The command usage is /cooldown <time>');
    end
  end 
end)

currentCooldownTime = 0;
onHold = false;
inProgress = false 

Citizen.CreateThread(function()
  while true do 
    Wait((1000 * 5));
    if not onHold and not inProgress then 
      if Config.Options.AlwaysDisplay then 
        local display = Config.Options.CooldownDisplay:gsub("{MINS}", currentCooldownTime);
        TriggerClientEvent('Badger-Priorities:DrawText', -1, display);
      else
        if currentCooldownTime <= 0 then 
          local display = Config.Options.CooldownDisplay:gsub("{MINS}", currentCooldownTime);
          TriggerClientEvent('Badger-Priorities:DrawText', -1, "");
        else 
          local display = Config.Options.CooldownDisplay:gsub("{MINS}", currentCooldownTime);
          TriggerClientEvent('Badger-Priorities:DrawText', -1, display);
        end
      end
    end 
    if onHold and not inProgress then  
      -- Print on screen, the priorities are on hold 
      TriggerClientEvent('Badger-Priorities:DrawText', -1, Config.Options.OnHoldDisplay:gsub("{MINS}", currentCooldownTime))
    end 
    if inProgress then 
      TriggerClientEvent('Badger-Priorities:DrawText', -1, Config.Options.InProgressDisplay:gsub("{MINS}", currentCooldownTime))
    end 
  end
end)

Citizen.CreateThread(function()
  while true do 
    Wait((1000 * 60));
    -- Every 60 seconds 
    if not onHold and not inProgress then 
      -- Print on screen, the cooldown time 
      if Config.Options.AlwaysDisplay then 
        local display = Config.Options.CooldownDisplay:gsub("{MINS}", currentCooldownTime);
        TriggerClientEvent('Badger-Priorities:DrawText', -1, display);
      else
        if currentCooldownTime <= 0 then 
          local display = Config.Options.CooldownDisplay:gsub("{MINS}", currentCooldownTime);
          TriggerClientEvent('Badger-Priorities:DrawText', -1, "");
        else 
          local display = Config.Options.CooldownDisplay:gsub("{MINS}", currentCooldownTime);
          TriggerClientEvent('Badger-Priorities:DrawText', -1, display);
        end
      end
      if currentCooldownTime > 0 then 
        currentCooldownTime = currentCooldownTime - 1;
      end
    end 
  end
end)