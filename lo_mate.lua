script_name('lo_mate');
script_author('Jesus-fran');
script_description('Muestra si el jugador mató a alguien');

require 'lib.sampfuncs'
require 'lib.moonloader'
local as_action = require('lib.moonloader').audiostream_state;
local sampev = require 'lib.samp.events'
local id_player = 65535;

function main()
    if not isSampfuncsLoaded() or not isSampLoaded() then
        return
    end
    while not isSampAvailable() do
        wait(100)
    end
    while true do
        wait(100);
        if id_player ~= 65535 then
            local result, ped = sampGetCharHandleBySampPlayerId(id_player);
            if result then
                local dead = isCharDead(ped);
                local health = sampGetPlayerHealth(id_player);
                local player_on = sampIsPlayerConnected(id_player);
    
                if dead and health < 3 and player_on then
                    -- print(string.format('dead: %s salud: %d', dead, health));    
                    Sound();
                    sampTextdrawCreate(1, string.format("OBJETIVO ELIMINADO"), 420, 360);
                    sampTextdrawSetLetterSizeAndColor(1, 0.6, 2, 0xFF1FA139);
                    sampTextdrawSetStyle(1, 1);
                    sampTextdrawSetShadow(1, 1, 0xFF000000);
                    sampTextdrawSetAlign(1, 3);
                    sampTextdrawSetProportional(1, 0);
                    wait(3000);
                    sampTextdrawDelete(1);
                    id_player = 65535;
                end
            end
        end
    end

end

function sampev.onSendGiveDamage(playerId, damage, weapon, bodypart)
    
    id_player = playerId;

end

function Sound()
    local kill_1 = loadAudioStream("moonloader/sound/kill_1.mp3");
    setAudioStreamState(kill_1, 1);
	setAudioStreamVolume(kill_1, as_action.PLAY);
end
