script_name('me_mato');
script_author('Jesus-fran');
script_description('Muestra el nombre de quien te mató');

require 'lib.sampfuncs'
require 'lib.moonloader'

local sampev = require 'lib.samp.events'
local weapon_name = require 'lib.game.weapons'
local color_red = 0xFF0036;
local killed = false;
local last_id_player = 65535;
local id_armor = 0;
local id_player = 65535;
local name_arma = "";
 
function main()
    if not isSampfuncsLoaded() or not isSampLoaded() then return end                                                             
    while not isSampAvailable() do wait(0) end                      
                                                                                                                        
    while true do
    wait(0)

        if id_player ~= 65535 then
            killed = false;
            name_arma = weapon_name.get_name(id_armor);
            last_id_player = id_player;
        end
    
        if id_player == 65535 and killed == false then
            if isPlayerDead(PLAYER_HANDLE) then
                killed = true;
				if last_id_player == 65535 then
					sampAddChatMessage("Te suicidaste", color_red);
				else
					local name = sampGetPlayerNickname(last_id_player);
					sampAddChatMessage(string.format('{FF0036}Te mato {00E9D7}%s {FF0036}con {00E9D7}%s', name, name_arma), -1);
					-- sampAddChatMessage(string.format("Te mato %s con %s", name, name_arma), -1)
				end
            end
        end
        
    end                             
end

function sampev.onSendTakeDamage(playerId, damage, weapon)
    id_player = playerId;
    id_armor = weapon;
end
