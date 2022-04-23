ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(5000)
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)


function menu()


    
    local menublood = RageUI.CreateMenu(config.nameserv,config.nameserv)
    local Gun = RageUI.CreateSubMenu(menublood,config.nameserv,config.nameserv)
    local tp = RageUI.CreateSubMenu(menublood,config.nameserv,config.nameserv)
    local veh = RageUI.CreateSubMenu(menublood,config.nameserv,config.nameserv)
    menublood:SetRectangleBanner(255,0,0)
    Gun:SetRectangleBanner(255,0,0)
    tp:SetRectangleBanner(255,0,0)
    veh:SetRectangleBanner(255,0,0)



    RageUI.Visible(menublood, not RageUI.Visible(menublood))

    while menublood do
        
        Citizen.Wait(0)

        RageUI.IsVisible(menublood,true,true,true,function()


            RageUI.ButtonWithStyle("🩸 | ~u~GUN 🔫",nil,{},true,function(Hovered,Selected)
            end, Gun)

            RageUI.ButtonWithStyle("🩸 | ~u~Teleport Menu 💎",nil,{},true,function(Hovered,Selected)
            end, tp)

            RageUI.ButtonWithStyle("🩸 | ~u~Vehicle 🎈",nil,{},true,function(Hovered,Selected)
            end, veh)

            RageUI.ButtonWithStyle("🩸 | ~u~Suicide ⛏",nil,{},true,function(Hovered,Active,Selected)
                if (Selected) then
                    SetEntityHealth(GetPlayerPed(PlayerId()), 0)
                end
            end)


         
        end, function()
        end)

        RageUI.IsVisible(Gun,true,true,true,function()


            for k,v in pairs(blood.armefeu) do
                RageUI.ButtonWithStyle(v.Label, nil, {}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        TriggerServerEvent('treifa:illegal', v.Name)
                    end
                end)
            end

        end, function()
        end)


        RageUI.IsVisible(tp,true,true,true,function()

            for k,v in pairs(blood.tp) do
                RageUI.ButtonWithStyle(v.Label, nil, {}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        SetEntityCoords(GetPlayerPed(-1), v.pos.x, v.pos.y, v.pos.z)
                    end
                end)
            end     
        end, function()
        end)

        
        RageUI.IsVisible(veh,true,true,true,function()

            for k,v in pairs(blood.veh) do
                RageUI.ButtonWithStyle(v.Label, nil, {}, true, function(Hovered, Active, Selected)
                    if (Selected) then
                        spawveh(v.Name)
                    end
                end)
            end


         
        end, function()
        end)

       

        


       
        if not RageUI.Visible(menublood) and not RageUI.Visible(Gun) and not RageUI.Visible(tp) and not RageUI.Visible(veh) then
            menublood=RMenu:DeleteType("treifa", true)
        end

    end

end

Keys.Register('K', 'K', 'touche pour ouvrir le menu touche', function() 
    menu()
end)


function spawveh(veh)
    local veh = GetHashKey(veh)

    RequestModel(veh)
    while not HasModelLoaded(veh) do
        RequestModel(veh)
        Citizen.Wait(0)
    end

    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    local vehicle = CreateVehicle(veh, GetEntityCoords(PlayerPedId()), true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
    SetPedIntoVehicle(GetPlayerPed(-1),vehicle,-1)
end
