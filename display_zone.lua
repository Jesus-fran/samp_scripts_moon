script_name('display_zone');
script_author('Jesus-fran');
script_description('Muestra el nombre de la zona donde el jugador se encuentra');

require('lib.moonloader');
local notify = import('imgui_notf.lua');
local actived_zone = false;
local name_ant = '';

function main()
    if not isSampLoaded() or not isSampfuncsLoaded() then
        return
    end
    while not isSampAvailable() do
        wait(100);
    end
    sampRegisterChatCommand('lugar', ShowNameZone);
    while true do
        wait(5000);
        if actived_zone then
            local positionX, positionY, positionZ = getCharCoordinates(PLAYER_PED);
            local name = getNameOfZone(positionX, positionY, positionZ);
            if name ~= name_ant then
                name_ant = name;
                notify.addNotification(string.format('Andas en:\n\n %s \n \n', FindName(name)), 5);
            end
        end
    end
end

function ShowNameZone()
    if actived_zone then
        actived_zone = false;
        name_ant = '';
        notify.addNotification(string.format('\n Desactivaste /lugar \n \n'), 3);
    else
        actived_zone = true;
    end
end

function FindName(name)

    if name == 'SAN_AND' then
        return 'San Andreas, Bob.';
    elseif name == 'MARKST' then
        return ' Market Station. Train Station that goes underground.';
    elseif name ==  'UNITY' then
        return ' Unity Station.';
    elseif name ==  'PER1' then
        return 'Pershing Square.';
    elseif name ==  'PLS' then
        return 'Playa del seville';
    elseif name ==  'CRANB' then
        return 'Cranberry Station';
    elseif name ==  'CALT' then
        return ' Calton Heights';
    elseif name ==  'SUNMA' then
        return 'Bayside Marina';
    elseif name ==  'SUN' then
        return ' Temple';
    elseif name ==  'BATTP' then
        return 'Battery Point';
    elseif name ==  'BAYV' then
        return 'Palisades';
    elseif name ==  'PARA' then
        return 'Paradiso';
    elseif name ==  'JUNIHI' then
        return 'Juniper Hill';
    elseif name ==  'JUNIHO' then
        return ' Juniper Hollow';
    elseif name ==  'CIVI' then
        return ' Santa Flora';
    elseif name ==  'CHINA' then
        return 'Chinatown';
    elseif name ==  'FINA' then
        return ' Financial';
    elseif name ==  'CITYS' then
        return ' City Hall';
    elseif name ==  'GARC' then
        return 'Garcia';
    elseif name ==  'HASH' then
        return 'Hashburry.';
    elseif name ==  'HILLP' then
        return 'Missionary Hill';
    elseif name ==  'LINDEN' then
        return ' Linden Station';
    elseif name ==  'YELLOW' then
        return 'Yellow Bell Station';
    elseif name ==  'YBELL2' then
        return 'Yellow Bell Station';
    elseif name ==  'YBELL1' then
        return 'Yellow Bell Station';
    elseif name ==  'RIE' then
        return ' Randolph Industrial Estate';
    elseif name ==  'LDM' then
        return 'Last Dime Motel';
    elseif name ==  'RSE' then
        return ' Rockshore East';
    elseif name ==  'LDS' then
        return ' Linden Side';
    elseif name ==  'SRY' then
        return 'Sobell Rail Yards';
    elseif name ==  'WWE' then
        return 'Whitewood Estates';
    elseif name ==  'WWE1' then
        return 'Whitewood Estates, read above';
    elseif name ==  'PINT' then
        return 'Pilson Intersection';
    elseif name ==  'HGP' then
        return 'Harry Gold Parkway';
    elseif name ==  'SPIN' then
        return 'Spinybed, ouch!';
    elseif name ==  'OVS' then
        return ' Old Venturas Strip';
    elseif name ==  'CREE' then
        return 'Creek.';
    elseif name ==  'STRIP1' then
        return 'Strip Club 1';
    elseif name ==  'STRIP2' then
        return 'Strip Club 2';
    elseif name ==  'STRIP3' then
        return 'Strip Club 59';
    elseif name ==  'STRIP4' then
        return ' Strip Club 4';
    elseif name ==  'RING' then
        return 'The Clowns Pocket';
    elseif name ==  'ISLE' then
        return ' The Emerald Isle.';
    elseif name ==  'ROY' then
        return 'Royal Casino';
    elseif name ==  'CAM' then
        return 'The Camels Toe';
    elseif name ==  'LOT' then
        return 'Come-A-Lot';
    elseif name ==  'PIRA' then
        return ' Pirates in Mens Pants';
    elseif name ==  'DRAG' then
        return ' Four Dragons Casino.';
    elseif name ==  'PINK' then
        return 'The Pink Swan';
    elseif name ==  'HIGH' then
        return 'The High Roller';
    elseif name ==  'ANGPI' then
        return ' Angel Pine';
    elseif name ==  'SHACA' then
        return 'Shady Cabin';
    elseif name ==  'BEACO' then
        return 'Beacon Hill';
    elseif name ==  'BACKO' then
        return 'Back o Beyond';
    elseif name ==  'FARM' then
        return ' The Farm';
    elseif name ==  'PALO' then
        return 'Palomino Creek';
    elseif name ==  'MONT' then
        return 'Montgomery';
    elseif name ==  'MONT1' then
        return 'Montgomery 2';
    elseif name ==  'HBARNS' then
        return ' Hampton Barns';
    elseif name ==  'DILLI' then
        return 'Dillimore';
    elseif name ==  'TOPFA' then
        return 'Hilltop Farm';
    elseif name ==  'BLUEB' then
        return ' Blueberry';
    elseif name ==  'BLUEB1' then
        return 'Bluberry 2';
    elseif name ==  'PANOP' then
        return ' The Panopticon';
    elseif name ==  'BLUAC' then
        return ' Blueberry Acres';
    elseif name ==  'CREEK' then
        return ' Shady Creeks';
    elseif name ==  'CREEK1' then
        return 'Shady Creeks 2';
    elseif name ==  'MAKO' then
        return 'The Mako Span';
    elseif name ==  'FERN' then
        return ' Fern Ridge';
    elseif name ==  'NROCK' then
        return 'North Rock. Rockstar';
    elseif name ==  'HANKY' then
        return 'Hankypanky Point';
    elseif name ==  'LEAFY' then
        return 'Leafy Hollow';
    elseif name ==  'RED' then
        return 'Red County';
    elseif name ==  'FLINTC' then
        return 'Flint County';
    elseif name ==  'WHET' then
        return 'Whetstone';
    elseif name ==  'BIGE' then
        return 'The Big Ear';
    elseif name ==  'ELQUE' then
        return 'El Quebrados';
    elseif name ==  'BARRA' then
        return 'Las Barrancas';
    elseif name ==  'CARSO' then
        return ' Fort Carson';
    elseif name ==  'PAYAS' then
        return 'Las Payasadas';
    elseif name ==  'PROBE' then
        return ' Lil Probe Inn';
    elseif name ==  'ELCA' then
        return 'El Castillo del Diablo';
    elseif name ==  'FLINTR' then
        return 'Flint Range';
    elseif name ==  'ARCO' then
        return 'Arco del Oeste';
    elseif name ==  'VALLE' then
        return 'Valle Ocultado';
    elseif name ==  'FLINTI' then
        return 'Flint Intersection';
    elseif name ==  'MONINT' then
        return 'Montgomery Intersection';
    elseif name ==  'ROBINT' then
        return 'Robada Intersection';
    elseif name ==  'TOM' then
        return 'Regular Tom';
    elseif name ==  'ALDEA' then
        return 'Aldea Malvada';
    elseif name ==  'BRUJA' then
        return ' Las Brujas';
    elseif name ==  'ROBAD' then
        return 'Tierra Robada';
    elseif name ==  'BONE' then
        return 'Bone County';
    elseif name ==  'HAUL' then
        return 'Fallen Tree';
    elseif name ==  'QUARY' then
        return 'Hunter Quarry';
    elseif name ==  'OCTAN' then
        return 'Octane Springs';
    elseif name ==  'PALMS' then
        return 'Green Palms';
    elseif name ==  'EBAY' then
        return ' Easter Bay';
    elseif name ==  'EBAY2' then
        return 'Easter Bay Chemicals';
    elseif name ==  'DAM' then
        return ' The Sherman Dam';
    elseif name ==  'DOH' then
        return 'Doherty';
    elseif name ==  'THEA' then
        return 'Kings';
    elseif name ==  'WESTP' then
        return 'Queens';
    elseif name ==  'SILLY' then
        return 'Foster Valley';
    elseif name ==  'EASB' then
        return 'Easter Basin';
    elseif name ==  'SFDWT' then
        return 'Downton San Fierro';
    elseif name ==  'REST' then
        return 'Area Restringida';
    elseif name ==  'SMB' then
        return 'Santa Maria Beach';
    elseif name ==  'LAIR' then
        return 'Los Santos International';
    elseif name ==  'BLUF' then
        return 'Verdant Bluffs';
    elseif name ==  'LMEX' then
        return 'Little Mexico';
    elseif name ==  'COM' then
        return 'Commerce';
    elseif name ==  'GLN' then
        return 'Glen Park';
    elseif name ==  'JEF' then
        return 'Jefferson';
    elseif name ==  'GAN' then
        return 'Ganton';
    elseif name ==  'LDOC' then
        return 'Ocean Docks';
    else
        return name;
    end    
end
