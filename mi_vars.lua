script_name('mi_vars');
script_author('Jesus-fran');
script_description('muestra el vars del jugador cada minuto');

require 'lib.moonloader';
local notify = import('imgui_notf.lua');
local encoding = require('lib.encoding');
encoding.default = 'CP1252'
u8 = encoding.UTF8;
local actived_mi_vars = true;

function main()
    
    if not isSampfuncsLoaded() or not isSampLoaded() then return end
    while not isSampAvailable() do wait(0) end
    
    sampRegisterChatCommand('onmivars', ActiVars);
   
    while true do
		wait(60000)
        if actived_mi_vars then
         
			local result, id_player = sampGetPlayerIdByCharHandle(PLAYER_PED);
			if result then
				sampSendChat("/vars %d", id_player); 
			end
       
        end
    end
end


function ActiVars()
    if actived_mi_vars then
        actived_mi_vars = false
        print('Mi Vars desactivado');
        notify.addNotification(u8'\n		mi /vars desactivado \n \n', 5);
    else
        actived_mi_vars = true;
        print('Vars activado');
        notify.addNotification(u8'\n		mi /vars activado \n \n', 5);
    end
end
