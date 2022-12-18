script_name('cebug_cambioarma');
script_author('Jesus-fran');
script_description('Ayuda a hacer cbug y cambio de arma para litefoot ');

require('lib.moonloader');
local sampev = require('lib.samp.events');
local notify = import('imgui_notf.lua');
local encoding = require('lib.encoding');
encoding.default = 'CP1252'
u8 = encoding.UTF8;
local actived = true;

local vkey = require "lib.vkeys";
local disparos = 0;
local actived_cbug = false;

function main()
    if not isSampLoaded() or not isSampfuncsLoaded() then
        return
    end
    while not isSampAvailable() do
        wait(100);
    end
	
	sampRegisterChatCommand('cbug', Cbug);
	
    while true do
        wait(0);
		if actived_cbug then
			if isCharShooting(PLAYER_PED) then
				local weapon = getCurrentCharWeapon(PLAYER_PED);
				if weapon == 34 or weapon == 24 then
					
					setVirtualKeyDown(VK_C, true);
					wait(50);
					setVirtualKeyDown(VK_C, false);
				end
				-- if disparos == 5 then
					-- setVirtualKeyDown(VK_Q, true);
					-- wait(200)
					-- setVirtualKeyDown(VK_Q, false);
					-- disparos = 0;
				-- end			
				-- setVirtualKeyDown(VK_C, true);
				-- wait(100);
				-- setVirtualKeyDown(VK_C, false);
				-- disparos = disparos + 1;
			end
		end
		
		
		local delta = getMousewheelDelta();

        if delta == -1 then
			local chat = sampIsChatInputActive();
			local console = isSampfuncsConsoleActive();
			local char_incar = isCharInAnyCar(PLAYER_PED);
			if chat ~= true and char_incar ~= true and console ~= true then
				local weapon = getCurrentCharWeapon(PLAYER_PED);
           
				if weapon == 0 then
				
					setVirtualKeyDown(VK_E, true);
					wait(50);
					setVirtualKeyDown(VK_E, false);
					setVirtualKeyDown(VK_Q, true);
					wait(50);
					setVirtualKeyDown(VK_Q, false);
					
				elseif weapon == 27 or weapon == 25 or weapon == 31 or weapon == 29 or weapon == 34  then
					
					setVirtualKeyDown(VK_Q, true);
					wait(100)
					setVirtualKeyDown(VK_Q, false);
					setVirtualKeyDown(VK_E, true);
					wait(50);
					setVirtualKeyDown(VK_E, false);
					setVirtualKeyDown(VK_Q, true);
					wait(50);
					setVirtualKeyDown(VK_Q, false);
					
				elseif weapon == 24 then
				
					setVirtualKeyDown(VK_Q, true);
					wait(200)
					setVirtualKeyDown(VK_Q, false);
					setVirtualKeyDown(VK_E, true);
					wait(50);
					setVirtualKeyDown(VK_E, false);
					setVirtualKeyDown(VK_Q, true);
					wait(50);
					setVirtualKeyDown(VK_Q, false);
				end
				wait(1000);
			end
        end
    end
end


function Cbug()
    if actived_cbug then
        actived_cbug = false
        print('Cbug desactivado');
        notify.addNotification('\n  Cbug desactivado \n \n', 5);
    else
        actived_cbug = true;
        print('Cbug activado');
        notify.addNotification('\n  Cbug activado \n \n', 5);
    end
end
