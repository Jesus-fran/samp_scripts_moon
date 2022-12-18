script_name('cerrar auto');
script_author('Jesus-fran');
script_description('cierra automaticamente la puerta del auto al bajar');

require 'lib.moonloader';
local sampev = require 'lib.samp.events'
local color_green = 0x03CF66;

function main()
    if not isSampLoaded() or not isSampfuncsLoaded() then
        return
    end
    while not isSampAvailable() do
        wait(100);
    end
    Thread = lua_thread.create_suspended(Cerrar);
end


function sampev.onSendExitVehicle()
    Thread:run();
end

function Cerrar()
    wait(200);
    sampSendChat('/cerrar');
end
