local frame = CreateFrame("FRAME"); -- Need a frame to respond to events
frame:RegisterEvent("ADDON_LOADED"); -- Fired when saved variables are loaded
frame:RegisterEvent("PLAYER_LOGOUT"); -- Fired when about to log out

function frame:OnEvent(event, arg1)
 if event == "ADDON_LOADED" and arg1 == "COMBAT_DUMP" then
  print("LOADED COMBAT DUMP")
  if (LoggingCombat()) then -- LoggingCombat() uses the built in one
    DEFAULT_CHAT_FRAME:AddMessage("Combat is already being logged");
  else
    DEFAULT_CHAT_FRAME:AddMessage("Combat is not being logged - starting it!");  
    LoggingCombat(1);
  end
 elseif event == "PLAYER_LOGOUT" then
 end
end

frame:SetScript("OnEvent", frame.OnEvent);
SLASH_CDPdump1 = "/CDP";
function SlashCmdList.CDPdump(msg)
    print(CombatLogGetCurrentEventInfo());
end

frame:SetScript("OnEvent", frame.OnEvent);
SLASH_CDPtoggle1 = "/CDPtoggle";
function SlashCmdList.CDPtoggle(msg)
  if (LoggingCombat()) then
    DEFAULT_CHAT_FRAME:AddMessage("Turning off combat log");
    LoggingCombat(0);
  else
    DEFAULT_CHAT_FRAME:AddMessage("Starting Combat log");  
    LoggingCombat(1);
  end
end

local function OnEvent(self, event)
	print(date("%m/%d/%y %H:%M:%S",CombatLogGetCurrentEventInfo())) -- seems to only track outgoing events triggered by player
end

local f = CreateFrame("Frame")
f:RegisterEvent("COMBAT_LOG_EVENT")
f:SetScript("OnEvent", OnEvent)