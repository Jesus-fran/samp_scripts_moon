script_name('obtener_ping');
script_author('Jesus-fran');
script_description('muestra el ping del jugador al apuntarlo');

require 'lib.moonloader';
local actived = true;
local ping = 0;

function main()
    
    if not isSampfuncsLoaded() or not isSampLoaded() then return end
    while not isSampAvailable() do wait(0) end
    
   
    while true do
		wait(100)
        if actived then
            local result, player_ped = getCharPlayerIsTargeting(playerHandle);
            if result then
                local result, id_player = sampGetPlayerIdByCharHandle(player_ped);
                if result then
					ping = sampGetPlayerPing(id_player);
					local textLabel = sampCreate3dText(string.format('%d', ping), 0xFF0FF9CF, 0, 0, -1, 80, false, id_player, -1);
					wait(4000);
					sampDestroy3dText(textLabel);
					ping = 0;
                end
            end
		end
    end
end
