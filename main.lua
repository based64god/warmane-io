--[[
	main.lua
		The warmane-io driver thingy
--]]

WarmaneIO = LibStub('AceAddon-3.0'):NewAddon('WarmaneIO', 'AceEvent-3.0', 'AceConsole-3.0')
local L = LibStub('AceLocale-3.0'):GetLocale('WarmaneIO')

--[[
	Startup
--]]

function WarmaneIO:OnInitialize()
	self.frames = {}
	self:RegisterAutoDisplayEvents()
	self:AddSlashCommands()
end

function WarmaneIO:RegisterAutoDisplayEvents()
end

function WarmaneIO:AddSlashCommands()
    self:RegisterChatCommand('warmaneio', 'HandleSlashCommand')
    self:RegisterChatCommand('wio', 'HandleSlashCommand')
end

function WarmaneIO:HandleSlashCommand(cmd)
    cmd = cmd and cmd:lower() or ''
    if cmd == 'version' then
        self:PrintVersion()
    elseif cmd == 'config' then
        self:ShowOptions()
    elseif cmd == '?' or cmd == 'help' then
        self:PrintHelp()
    else
        if not self:ShowOptions() then
            self:PrintHelp()
        end
    end
end
--[[
	fucking love memes
--]]
function WarmaneIO:PrintVersion()
    self:Print(self.SaveSettings:GetDBVersion())
end

function WarmaneIO:PrintHelp()
    -- local closure to add color to help commands
	local function PrintCmd(cmd, desc)
		print(string.format(' - |cFF33FF99%s|r: %s', cmd, desc))
    end
    self:Print(L.Commands)
    PrintCmd('config', L.CmdShowConfig)
    PrintCmd('version', L.CmdShowVersion)
    PrintCmd('help', L.CmdShowHelp)
end