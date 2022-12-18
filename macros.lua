script_name('macros');
script_author('Jesus-fran');
script_description('macros para superdanova roleplay');

require "lib.moonloader";
local vkey = require "lib.vkeys";
local notify = import('imgui_notf.lua');

local color_red = 0xFF0036;
local color_green = 0x03CF66;
local color_yellow = 0xFFDC00;
local color_cyan = 0x00E9D7;
local color_white = 0xFFFFFF;
local color_purple = 0x9F23F0;
local color_pynk = 0xF97CDF;
local color_magenta = 0xF0239F;


function main()
    if not isSampLoaded() or not isSampfuncsLoaded() then
        return
    end
    while not isSampAvailable() do
        wait(100);
    end

    sampRegisterChatCommand('rmorir', RolMorir);
	sampRegisterChatCommand('redc', RolEdc);
	sampRegisterChatCommand('rm4', RolM);
	sampRegisterChatCommand('rak', RolAk);
	sampRegisterChatCommand('rmp5', RolMp);
	sampRegisterChatCommand('rdk', RolDk);
	sampRegisterChatCommand('rescopeta', RolEscopeta);
	sampRegisterChatCommand('rrifle', RolRifle);
	sampRegisterChatCommand('r9mms', RolPistolas);
	sampRegisterChatCommand('r9mm', RolPistola);
	sampRegisterChatCommand('rllave', RolLlave);
	sampRegisterChatCommand('rabrirauto', RolAbrirAuto);
	sampRegisterChatCommand('rcerrarauto', RolCerrarAuto);
	sampRegisterChatCommand('prot', VenderProte);
    sampRegisterChatCommand('rneu', NeutralizarUser);

    while true do
        wait(0);

        -- Usar farmaco
        if isKeyDown(vkey.VK_LMENU) then
            if isKeyJustPressed(vkey.VK_F) then
                if isCharInAnyCar(PLAYER_PED) then
                    return false;
                else
                    sampSendChat('/usar farmaco');
                end
            end
        end

        -- -- Usar cocaina
         if isKeyDown(vkey.VK_RCONTROL) then
            if isKeyJustPressed(vkey.VK_B) then
               sampSendChat('/usar cocaina');
            end
         end

        -- Abrir maletero
        if isKeyDown(vkey.VK_LMENU) then
            if isKeyJustPressed(vkey.VK_L) then
                sampSendChat('/maletero');
            end
        end

        -- Guardar
        if isKeyDown(vkey.VK_LMENU) then
            if isKeyJustPressed(vkey.VK_O) then
                local weapon = getCurrentCharWeapon(PLAYER_PED);
                local name_weapon = GetNameWeapon(weapon);
                if name_weapon == '' then
                    print(weapon);
                    sampSetChatInputText('/guardar ');
                    sampSetChatInputEnabled(true);
                else
                    sampSendChat(string.format('/guardar %s', name_weapon));
                end
            end
        end

        -- ver ID
        if isKeyDown(vkey.VK_LMENU) then
            if isKeyJustPressed(vkey.VK_I) then
                sampSetChatInputText('/id ');
                sampSetChatInputEnabled(true);
            end
        end

        -- Cerrar coche
        if isKeyDown(vkey.VK_LMENU) then
            if isKeyJustPressed(vkey.VK_V) then
                sampSetChatInputText('/vender ');
                sampSetChatInputEnabled(true);
            end
        end

        -- Proteger
        if isKeyDown(vkey.VK_LMENU) then
            if isKeyJustPressed(vkey.VK_NUMPAD5) then
                wait(200);
                sampSetChatInputText('/prot ');
                sampSetChatInputEnabled(true);
            end
        end

        -- Aceptar protección
        if isKeyDown(vkey.VK_LMENU) then
            if isKeyJustPressed(vkey.VK_NUMPAD6) then
                sampSendChat('/aceptar proteccion');
            end
        end

        -- Reparar auto
        if isKeyDown(vkey.VK_LMENU) then
            if isKeyJustPressed(vkey.VK_0) then
                sampSetChatInputText('/reparar ');
                sampSetChatInputEnabled(true);
            end
        end

        -- Reparar mi auto siendo mecanico
        if isKeyDown(vkey.VK_LMENU) then
            if isKeyJustPressed(vkey.VK_9) then
                local result, id = sampGetPlayerIdByCharHandle(PLAYER_PED);
                if result then
					sampSendChat("/pedir mecanico");
					wait(1300);
                    sampSendChat(string.format('/reparar %d 0', id ));
                    wait(1500);
                    sampSendChat('/aceptar reparacion');
                end
            end
        end

        -- Rendirse y stop
        if isKeyDown(vkey.VK_LMENU) then
            if isKeyJustPressed(vkey.VK_NUMPAD7) then
                sampSendChat('/rendirse');
				wait(300);
				setVirtualKeyDown(VK_F, true);
				wait(200)
				setVirtualKeyDown(VK_F, false);
            end
        end
        

        -- Robar objeto
        if isKeyDown(vkey.VK_LMENU) then
            if isKeyJustPressed(vkey.VK_NUMPAD4) then
                sampSendChat('/robar objeto');
            end
        end


        -- Responder en /dudas
        if isKeyDown(vkey.VK_LMENU) then
            if isKeyJustPressed(vkey.VK_R) then
                sampSetChatInputText('/resp ');
                sampSetChatInputEnabled(true);
            end
        end

        -- Pedir ref
        if isKeyDown(vkey.VK_LMENU) then
            if isKeyJustPressed(vkey.VK_OEM_5) then
                sampSendChat('/ref');
            end
        end

        -- Gritar Aaahhh
        if isKeyDown(vkey.VK_LMENU) then
            if isKeyJustPressed(vkey.VK_2) then
                sampSendChat('/g Aaaaaaaghhh');
            end
        end

        -- Comprar prepiezas
        if isKeyDown(vkey.VK_LMENU) then
            if isKeyJustPressed(vkey.VK_NUMPAD8) then
                sampSendChat('/comprar prepiezas');
            end
        end

        -- Fabricar piezas
        if isKeyDown(vkey.VK_LMENU) then
            if isKeyJustPressed(vkey.VK_NUMPAD9) then
                sampSendChat('/fabricar piezas');
            end
        end

        -- Ser protector
        if isKeyDown(vkey.VK_LMENU) then
            if isKeyJustPressed(vkey.VK_NUMPAD3) then
                sampSendChat('/ser protector');
            end
        end

        -- Renunciar un trabajo
        if isKeyDown(vkey.VK_LMENU) then
            if isKeyJustPressed(vkey.VK_NUMPAD2) then
                wait(200);
				sampSendChat('/renunciar');
				wait(1000);
				local text, prefix, color, pcolor = sampGetChatString(99);
				local contador = 0;
				for str in string.gmatch(text, "([^%s]+)") do 
        
					
					if contador == 2  then
						wait(500);
						print(str);
						sampSendChat(string.format('/renunciar %s', str));
					end
					contador = contador + 1;
				end
				 
                -- sampSetChatInputText('/renunciar ');
                -- sampSetChatInputEnabled(true);
            end
        end

        -- Decir gracias
        if isKeyDown(vkey.VK_LMENU) then
            if isKeyJustPressed(vkey.VK_NUMPAD0) then
                sampSendChat('Gracias');
            end
        end

        -- Aceptar arma
        if isKeyDown(vkey.VK_LMENU) then
            if isKeyJustPressed(vkey.VK_NUMPAD1) then
                sampSendChat('/aceptar arma');
            end
        end



        -- Hablar por radio de banda
        -- if isKeyDown(vkey.VK_RSHIFT) then
            -- if isKeyJustPressed(vkey.VK_1) then	
		-- sampSetChatInputText('! ');
		-- sampSetChatInputEnabled(true);
	    -- end
        -- end

        -- Trabajar
        if isKeyDown(vkey.VK_LMENU) then
            if isKeyJustPressed(vkey.VK_T) then
                sampSendChat('/trabajar');
            end
        end

        -- reportar
        if isKeyDown(vkey.VK_OEM_PERIOD) then
            if isKeyJustPressed(vkey.VK_R) then
                sampSetChatInputText('/report ');
                sampSetChatInputEnabled(true);
            end
        end
		
		-- rodar
        if isKeyDown(vkey.VK_RCONTROL) then
            if isKeyJustPressed(vkey.VK_D) then
               sampSendChat('/rodar');
            end
        end
		
		-- fokear
		if isKeyDown(vkey.VK_RCONTROL) then
			if isKeyJustPressed(vkey.VK_F) then
			   sampSendChat('/fokear');
			end
        end
		
		-- colgar
		if isKeyDown(vkey.VK_RCONTROL) then
			if isKeyJustPressed(vkey.VK_C) then
			   sampSetChatInputText('/colgar');
               sampSetChatInputEnabled(true);
			end
        end
		
		-- abrir auto
		if isKeyDown(vkey.VK_SPACE) then
			if isKeyJustPressed(vkey.VK_Y) then
			   sampSendChat('/abrir');
			end
        end
    end
    
    -- wait(-1); Usar esto en caso de no tener un while
end


function RolMorir()
    lua_thread.create(function()
        sampSendChat('/me mueve su mano derecha hacia su bolsillo y saca una pildora.');
        wait(500);
        sampSendChat('/do El cual contenia una dosis de cianuro altamente letal.');
        wait(500);
        sampSendChat('/me lleva la pildora a su boca y la toma rapidamente.');
        wait(500);
        sampSendChat('/do Moriria al instante.');
        wait(900);
        sampSendChat('/morir');
    end)
   
end

function RolEdc()
    lua_thread.create(function()
        sampSendChat('/me lleva su diestra hacia su espalda, toma una Escopeta de Combate y con la mano izquierda le quita el seguro.');
		wait(1000);
		sampSendChat('/do El arma estaria lista para ser utilizada.');
    end)
end

function RolM()
    lua_thread.create(function()
        sampSendChat('/me lleva su diestra hacia su espalda, toma una M4 y con la mano izquierda le quita el seguro.');
		wait(1000);
		sampSendChat('/do El arma estaria lista para ser utilizada.');
	end)
end

function RolAk()
    lua_thread.create(function()
        sampSendChat('/me lleva su diestra hacia su espalda, toma una AK-47 y con la mano izquierda le quita el seguro.');
		wait(1000);
		sampSendChat('/do El arma estaria lista para ser utilizada.');
    end)
end

function RolMp()
    lua_thread.create(function()
        sampSendChat('/me lleva su diestra hacia su cintura, toma una MP5 y le quita el seguro.');
		wait(1000);
		sampSendChat('/do El arma estaria lista para ser utilizada.');
    end)
end

function RolDk()
    lua_thread.create(function()
        sampSendChat('/me lleva su diestra hacia su cintura, saca una Desert Eagle y le quita el seguro.');
		wait(1000);
		sampSendChat('/do El arma estaria lista para ser utilizada.');
    end)
end


function RolEscopeta()
    lua_thread.create(function()
        sampSendChat('/me lleva su diestra hacia su espalda, toma una escopeta y con la mano izquierda le quita el seguro.');
		wait(1000);
		sampSendChat('/do El arma estaria lista para ser utilizada.');
    end)
end


function RolRifle()
    lua_thread.create(function()
        sampSendChat('/me lleva su diestra hacia su espalda, toma un rifle y con la mano izquierda le quita el seguro.');
		wait(1000);
		sampSendChat('/do El arma estaria lista para ser utilizada.');
    end)
end

function RolPistolas()
    lua_thread.create(function()
        sampSendChat('/me lleva su diestra hacia su cintura, saca una 9mm silenciada y le quita el seguro.');
		wait(1000);
		sampSendChat('/do El arma estaria lista para ser utilizada.');
    end)
end

function RolPistola()
    lua_thread.create(function()
        sampSendChat('/me lleva su diestra hacia su cintura, saca una 9mm y le quita el seguro.');
		wait(1000);
		sampSendChat('/do El arma estaria lista para ser utilizada.');
    end)
end

function RolLlave()
    lua_thread.create(function()
        sampSendChat('/me baja su mano derecha hacia su bolsillo');
		wait(1000);
		sampSendChat('/do Dentro estaria la llave de su auto');
		wait(1000);
		sampSendChat('/me Saca la llave y levanta su mano');	
    end)
end

function RolAbrirAuto()
    lua_thread.create(function()
        sampSendChat('/me Introduce una llave en la ranura de la puerta de su auto');
		wait(1000);
		sampSendChat('/do Las puertas del auto estarian desbloqueadas');	
    end)
end

function RolCerrarAuto()
    lua_thread.create(function()
        sampSendChat('/me Intruduce una llave en la ranura de la puerta su auto');
		wait(1000);
		sampSendChat('/do Las puertas del auto estarian bloqueadas');
		wait(1000);		
		sampSendChat('/me Saca la llave de la puerta y las guarda en su bolsillo');
    end)
end

function VenderProte(id_person)
    if id_person == '' then
        return false;
    else
        for str in string.gmatch(id_person, "([^%s]+)") do 
            if tonumber(str) == nil then
                sampSendChat(string.format('/proteger %s 200', str));
                return false;
            else
                sampSendChat(string.format('/proteger %d 200', tonumber(str)));
                return false;
            end
        end
    end
end

function NeutralizarUser()
    lua_thread.create(function()
        sampSendChat('/me Mueve su arma con agilidad y apunta');
        wait(1000);
        sampSendChat('/g Arriba las manos y no te muevas o disparo');
        wait(1000);
        sampSendChat('/do Con mucha precision apuntaba el arma hacia la persona, listo para disparar');
        wait(1000);
        sampSendChat('No te muevas o te vuelo los sesos de la cabeza, Esta claro?');
    end)
end

function GetNameWeapon(id)
    if id == 27 then
        return 'edc';
    elseif id == 31 then
        return 'm4';
    elseif id == 30 then
        return 'ak';
    elseif id == 29 then
        return 'mp5';
    elseif id == 24 then
        return 'dk';
    elseif id == 33 then
        return 'rifle';
    elseif id == 25 then
        return 'escopeta';
    elseif id == 22 then
        return '9mm';
    elseif id == 23 then
        return '9mm-s';
    elseif id == 2 then
        return 'palo';
    elseif id == 4 then
        return 'cuchillo'
    elseif id == 5 then
        return 'bate';
    elseif id == 6 then
        return 'pala';
    elseif id == 8 then
        return 'katana';
    elseif id == 10 then
        return 'dildo-purpura';
    elseif id == 11 then
        return 'dildo';
    elseif id == 12 then
        return 'vibrador';
    elseif id == 14 then
        return 'flores';
    elseif id == 43 then
        return 'camara';
    else
        return '';
    end    
end
