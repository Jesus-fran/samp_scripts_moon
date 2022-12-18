script_name('recordar');
script_author('Jesus-fran');
script_description('Muestra una recordatorio sobre algo segun el tiempo dado');

require('lib.moonloader');
local notify = import('imgui_notf.lua');
local act_recordatorio = false;
local time = 0;
local text = '';
local hr_act = os.time()
local hr_actived = os.time()

function main()
    if not isSampLoaded() or not isSampfuncsLoaded() then
        return
    end
    while not isSampAvailable() do
        wait(100);
    end
    sampRegisterChatCommand('recordar', Recordar);
    sampRegisterChatCommand('showrecordar', ShowRecordar);
    sampRegisterChatCommand('elimrecordar', ElimRecordar);
    wait(-1);
end

function Recordar(arg)
    local cont = 0;

    if arg == '' then
        sampAddChatMessage('{00E9D7}Uso: /recordar {03CF66}minutos {03CF66}texto  {00E9D7}Ejemp: {FFFFFF} 2 cosechar plantas', -1);
        return false;
    end
    if act_recordatorio == false then
        for str in string.gmatch(arg, "([^%s]+)") do 
        
            if cont == 0  then
                if tonumber(str) == nil then
                    sampAddChatMessage('{03CF66}Error: {FFFFFF}Ingrese un numero', -1);
                    return false;
                else
                    time = tonumber(str) * 60000;
                    print('TIEMPO ESPERA: ');
                    print(time / 1000);
                end
            elseif cont > 0 then
                text = text..str..' ';      
            end
            cont = cont + 1;
        end
        lua_thread.create(function ()
            act_recordatorio = true;
            notify.addNotification(string.format('\nRecordatorio creado\n\n'), 5);
            hr_actived = os.time();
            wait(time)
            notify.addNotification(string.format('Atencion: \n\n%s\n\n', text), 10);
            act_recordatorio = false;
            time = 0;
            text = '';
        end);
    else
        notify.addNotification(string.format('Atencion: \n\nTienes un actual recordatorio \n\n usa /elimrecordar'), 4);
    end    
end

function ShowRecordar()
    if act_recordatorio == true then
        hr_act = os.time();
        local time_ingresed = time / 1000;
        local dif_time = os.difftime(hr_act, hr_actived);
        local time_falt = (time_ingresed - dif_time) / 60;
        local type_time = 'minutos';
        if time_falt < 1 then
            type_time = 'segundos';
        end
        notify.addNotification(string.format('Atencion: \n\n%s\n\n Faltan %.2f %s \n', text, time_falt, type_time), 5);
    else
        notify.addNotification(string.format('Atencion: \n\nNo tienes un recordatorio actual\n\n'), 4);
    end
end

function ElimRecordar()
    act_recordatorio = false;
    time = 0;
    text = '';
    notify.addNotification(string.format('\nRecordatorio eliminado\n\n'), 5);
end