script_name('vars');
script_author('Jesus-fran');
script_description('muestra el vars del jugador al que se apunta');

require 'lib.moonloader';
local notify = import('imgui_notf.lua');
local encoding = require('lib.encoding');
encoding.default = 'CP1252'
u8 = encoding.UTF8;
local actived = true;

function main()
    
    if not isSampfuncsLoaded() or not isSampLoaded() then return end
    while not isSampAvailable() do wait(0) end
    
    sampRegisterChatCommand('onvars', ActiVars)
   
    while true do
		wait(1000)
        if actived then
            local result, player_ped = getCharPlayerIsTargeting(playerHandle);
            if result then
                local result, id_player = sampGetPlayerIdByCharHandle(player_ped);
                if result then	
					sampSendChat("/vars %d", id_player);
                end
            end
        end
    end
end


function ActiVars()
    if actived then
        actived = false
        print('Vars desactivado');
        notify.addNotification(u8'\n  /vars desactivado \n \n', 5);
    else
        actived = true;
        print('Vars activado');
        notify.addNotification(u8'\n  /vars activado \n \n', 5);
    end
end