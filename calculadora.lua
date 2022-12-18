script_name('calc');
script_author('Jesus-fran');
script_description('Calculadora básica');

require 'lib.moonloader';
local encoding = require('lib.encoding');
encoding.default = 'CP1252'
u8 = encoding.UTF8;

function main()
    
    if not isSampfuncsLoaded() or not isSampLoaded() then return end
    while not isSampAvailable() do wait(0) end
    
    sampRegisterChatCommand('calc', Calc);
    wait(-1);   
end


function Calc(arg)
    local t={}
    local cont = 0;
    local num1 = 0.0;
    local operacion = '';
    local num2 = 0.0;
    local result = 0;

    if arg == '' then
        sampAddChatMessage('{00E9D7}Uso: {03CF66}numero1 {FFFFFF}operador {03CF66}numero2  {00E9D7}Ejemp: {FFFFFF}2 + 3', -1);
        return false;
    end

    for str in string.gmatch(arg, "([^%s]+)") do 
        
        if cont == 0  then
            
            if tonumber(str) == nil then
                sampAddChatMessage('{FF0036}Error: {FFFFFF}Ingrese un numero', -1);
                return false;
            else
                num1 = tonumber(str);
            end
        
        elseif cont == 1 then
            operacion = str;

        elseif cont == 2 then

            if tonumber(str) == nil then
                sampAddChatMessage('{FF0036}Error: {FFFFFF}Ingrese un numero', -1);
                return false;
            else
                num2 = tonumber(str);
            end
        end
        cont = cont + 1;
    end
    cont = 0;
    if operacion == '+' then
        result = num1 + num2;
    elseif  operacion == '-' then
        result = num1 - num2;
    elseif  operacion == '*' then
        result = num1 * num2;
        operacion = 'x'

    elseif  operacion == '/' then
        result = num1 / num2;
        operacion = string.char(247);
    else
        sampAddChatMessage('{FF0036}Error: {FFFFFF}Ingrese un operador', -1);
        return false;
    end

    if result == 1 / 0 then
        result = 'Infinito';
    elseif result == 0 / 0 then
        result = 'Imposible de calcular';
    end
    sampAddChatMessage(string.format(u8'{03CF66}%s {FFFFFF}%s {03CF66}%s {FFFFFF}= {03CF66}%s', tostring(num1), tostring(operacion), tostring(num2), tostring(result)), -1);
end

