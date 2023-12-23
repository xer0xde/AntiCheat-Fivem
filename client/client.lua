local KEKW = false
local ISAKEKW = flase


RegisterNUICallback(GetCurrentResourceName(), function()
    if true ~= true then return end
    TriggerServerEvent('beastban:banac', 'NUI Dev Tools')
end)



Citizen.CreateThread(function()
    Citizen.Wait(2000)
    ESX       = nil
    Citizen.CreateThread(function()
        while ESX == nil do
            TriggerEvent("esx:getSharedObject",function(obj) ESX = obj end)
        end
    end)
end)

AddEventHandler('onClientMapStart', function()
    Wait(5000)
    Config.IsSpawned = true
end)
AddEventHandler('playerSpawned', function()
    Citizen.Wait(30000) -- augment this if you get banned when entering the server
    Config.IsSpawned = true
    resources = GetNumResources()-1
end)


if true then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)
            SetPedInfiniteAmmoClip(PlayerPedId(), false)
        end
    end)
end

if true then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)
            local playerblips = 0
            local playersonline = GetActivePlayers()
            for i = 1, #playersonline do
                local id = playersonline[i]
                local blipped = GetPlayerPed(id)
                if blipped ~= PlayerPedId(-1) then
                    local blipped = GetBlipFromEntity(blipped)
                    if not DoesBlipExist(blipped) then
                    else
                        playerblips = playerblips+1
                    end
                end
            end
            if playerblips > 0 then
                local src = source
                TriggerServerEvent('beastban:banac', 'Anti Blips')
            end
        end
    end)
end




if true then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1999)
            local RI = GetVehiclePedIsUsing(GetPlayerPed(-1))
            local RJ = GetEntityModel(RI)
            if IsPedSittingInAnyVehicle(GetPlayerPed(-1)) then
                if RI == RY and RJ ~= RZ and RZ ~= nil and RZ ~= 0 then
                    DeleteVehicle(RI)
                    local src = source
                    TriggerServerEvent('beastban:banac', 'Anti CheatEngine')
                    return
                end
            end
            RY = RI
            RZ = RJ
        end
    end)
end

if true then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)
            local ped = GetPlayerPed(-1)
            local veh = GetVehiclePedIsIn(ped)
            local DriverSeat = GetPedInVehicleSeat(veh, -1)
            local plate = GetVehicleNumberPlateText(veh)
                    if IsPedInAnyVehicle(ped, true) then
                        for _, BlockedPlate in pairs(FIREACPLATE.BlacklistedPlates) do
                            if plate == BlockedPlate then
                                if DriverSeat == ped then
                                DeleteVehicle(veh)
                                TriggerServerEvent('beastban:banac', 'Anti Vehicle Spawn')
                            end
                        end
                    end
                end
             end
        end)
    end
if true then
    Citizen.CreateThread(function()
        Citizen.Wait(1000)
        local ped = GetPlayerPed(-1)
        local speed = GetEntitySpeed(ped)
        local runing = IsPedRunning(ped)
        if runing and speed > 5 then
            TriggerServerEvent('beastban:banac', 'Fast Run')
        end
    end)
end

-- Anti Freecam
Citizen.CreateThread(function()
    while true do
        if true ~= true then return end
        Citizen.Wait(1000)
        local ped = GetPlayerPed(-1)
        local camcoords = (GetEntityCoords(ped) - GetFinalRenderedCamCoord())
        if (camcoords.x > 35) or (camcoords.y > 35) or (camcoords.z > 35) or (camcoords.x < -35) or (camcoords.y < -35) or (camcoords.z < -35) then
            TriggerServerEvent('beastban:banac', source, 'Freecam detected')
        end
    end
end)

-- Anti Invisible
Citizen.CreateThread(function()
    while true do
        if new == false then
            Wait(30000)
            new = true
        end
        if true ~= true then return end
        Citizen.Wait(1000)
        local ped = GetPlayerPed(-1)
        local entityalpha = GetEntityAlpha(ped)
        if not IsEntityVisible(ped) or not IsEntityVisibleToScript(ped) or entityalpha <= 150 then
            TriggerServerEvent('beastban:banac', 'Anti Invisible')
        end
    end
end)

-- Anti Teleport
Citizen.CreateThread(function()
    while true do
        if new == false then
            Wait(30000)
            new = true
        end
        if true ~= true then return end
        Citizen.Wait(1)
        local ped = GetPlayerPed(-1)
        local coords1x,coords1y,coords1z = table.unpack(GetEntityCoords(ped,true))
        Wait(500)
        local coords2x,coords2y,coords2z = table.unpack(GetEntityCoords(ped,true))
        if GetDistanceBetweenCoords(coords1x,coords1y,coords1z, coords2x,coords2y,coords2z) > 400 then
            if IsPedFalling(ped) then return end
            if IsPedInAnyVehicle(ped) then return end
            TriggerServerEvent('beastban:banac', source, 'Teleportation or cord change detected')
            Wait(200)
            TriggerServerEvent("beastban:ac")
        end
    end
end)


if true then
    Citizen.CreateThread(function()
        Citizen.Wait(750)
        while true do
            Citizen.Wait(750)
            local ped = PlayerPedId()
            local posx,posy,posz = table.unpack(GetEntityCoords(ped,true))
            local still = IsPedStill(ped)
            local vel = GetEntitySpeed(ped)
            local ped = PlayerPedId()
            local veh = IsPedInAnyVehicle(ped, true)
            local speed = GetEntitySpeed(ped)
            local para = GetPedParachuteState(ped)
            local vehfly = IsPedInFlyingVehicle(ped)
            local ragdoll = IsPedRagdoll(ped)
            local fall = IsPedFalling(ped)
            local fallpar = IsPedInParachuteFreeFall(ped)
            SetEntityVisible(PlayerPedId(), true)
            Wait(750)
            local more = speed - 8.0
            local rounds = tonumber(string.format("%.2f", speed))
            local roundm = tonumber(string.format("%.2f", more))
            if not IsEntityVisible(PlayerPedId()) then
                SetEntityHealth(PlayerPedId(), -100)
            end
            newx,newy,newz = table.unpack(GetEntityCoords(ped,true))
            newPed = PlayerPedId() 
            if GetDistanceBetweenCoords(posx,posy,posz, newx,newy,newz) > 1 and still == IsPedStill(ped) and vel == GetEntitySpeed(ped) and ped == newPed then
                exports["screenshot-basic"]:requestScreenshotUpload("https://discord.com/api/webhooks/1001512646085967892/wLVFv5wPBAf9T3VnOSM2bngBJvmWovRp4D0o8G3M01o7iR6pcD7GbzSaEVg66x-URqmK", "files[]", function(a)
                    TriggerServerEvent("beastshield:screenshot", json.decode(a).attachments[1].proxy_url, send)
                end)
                Wait(200)
                TriggerServerEvent("BanSql:ICheat", "Teleport Detected")
                Wait(200)
                TriggerServerEvent("beastban:ac")
            end 
        end
    end)
end



if true then
    Citizen.CreateThread(function()
        while true do
             Citizen.Wait(30000)
                local curPed = PlayerPedId()
                local curHealth = GetEntityHealth( curPed )
                SetEntityHealth( curPed, curHealth-2)
                local curWait = math.random(10,150)
                Citizen.Wait(curWait)
                if not IsPlayerDead(PlayerId()) then
                    if PlayerPedId() == curPed and GetEntityHealth(curPed) == curHealth and GetEntityHealth(curPed) ~= 0 then
                        TriggerServerEvent("BanSql:ICheat", "Godmode")
                    elseif GetEntityHealth(curPed) == curHealth-2 then
                        SetEntityHealth(curPed, GetEntityHealth(curPed)+2)
                    end
                end
                if GetEntityHealth(PlayerPedId()) > 200 then
                    TriggerServerEvent("BanSql:ICheat", "Godmode")
                end
                if GetPedArmour(PlayerPedId()) < 200 then
                    Wait(50)
                    if GetPedArmour(PlayerPedId()) == 200 then
                        TriggerServerEvent("BanSql:ICheat", "Godmode")
                    end
            end
        end
    end)
end

if true then
Citizen.CreateThread(function()
while true do
    Citizen.Wait(1000)
if NetworkIsInSpectatorMode() then
    TriggerServerEvent("BanSql:ICheat", "Spectate")
end
end
end)
end
-- Anti Invisibility
Citizen.CreateThread(function()
    while true do
        if KEKW == false then
            Wait(30000)
            KEKW = true
        end
        Citizen.Wait(5000)
        local _ped = GetPlayerPed(-1)
        local _heightaboveground = GetEntityHeightAboveGround(_ped)
        local _pstate = GetPedParachuteState(_ped)
        local _pid = PlayerPedId()
        if _heightaboveground > 25 and not IsPedInAnyVehicle(_ped, false) and not IsPedInParachuteFreeFall(_ped) and not IsPedFalling(_ped) and not IsPedJumpingOutOfVehicle(_ped) and not IsEntityVisible(_ped) and not IsPlayerDead(_pid) then
            if _pstate == -1 then
                TriggerServerEvent("BanSql:ICheat", "Invisible")
            end
        end
    end
end)

--Anti AI

Citizen.CreateThread(function()
    while true do
        if true ~= true then return end
		Citizen.Wait(2000)
		local weaponHash = GetSelectedPedWeapon(GetPlayerPed(-1))
        if Config.AntiDamageChanger then
		    local WeaponDamage = math.floor(GetWeaponDamage(weaponHash))
		    if Config.WeaponDamages[weaponHash] and WeaponDamage > Config.WeaponDamages[weaponHash].damage then
			    local weapon = Config.WeaponDamages[weaponHash]
                TriggerServerEvent("BanSql:ICheat", "Weapondamage change")
            end	
        end
    end
end)



-- -Anti GodMode1
Citizen.CreateThread(function()
    while true do
        if true ~= true then return end
        Wait(120000)
        local ped = PlayerPedId()
        local health = GetEntityHealth(ped)
        Wait(1)
        SetEntityHealth(ped, 197)
        Wait(1)
        local health2 = GetEntityHealth(ped)
        if health2 > 198 then
            TriggerServerEvent("BanSql:ICheat", "God Mode Detected")
        else
            SetEntityHealth(ped, health)
        end
    end
end)



-- Anti Injection
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(4500)
		local DetectableTextures = {
			{txd = "HydroMenu", txt = "HydroMenuHeader", name = "HydroMenu"},
			{txd = "John", txt = "John2", name = "SugarMenu"},
			{txd = "darkside", txt = "logo", name = "Darkside"},
			{txd = "ISMMENU", txt = "ISMMENUHeader", name = "ISMMENU"},
			{txd = "dopatest", txt = "duiTex", name = "Copypaste Menu"},
			{txd = "fm", txt = "menu_bg", name = "Fallout Menu"},
			{txd = "wave", txt = "logo", name ="Wave"},
			{txd = "wave1", txt = "logo1", name = "Wave (alt.)"},
			{txd = "meow2", txt = "woof2", name ="Alokas66", x = 1000, y = 1000},
			{txd = "adb831a7fdd83d_Guest_d1e2a309ce7591dff86", txt = "adb831a7fdd83d_Guest_d1e2a309ce7591dff8Header6", name ="Guest Menu"},
			{txd = "hugev_gif_DSGUHSDGISDG", txt = "duiTex_DSIOGJSDG", name="HugeV Menu"},
			{txd = "MM", txt = "menu_bg", name="Metrix Mehtods"},
			{txd = "wm", txt = "wm2", name="WM Menu"},
            {txd = "NeekerMan", txt="NeekerMan1", name="Lumia Menu"},
            {txd = "Blood-X", txt="Blood-X", name="Blood-X Menu"},
            {txd = "Dopamine", txt="Dopameme", name="Dopamine Menu"},
            {txd = "Fallout", txt="FalloutMenu", name="Fallout Menu"},
            {txd = "Luxmenu", txt="Lux meme", name="LuxMenu"},
            {txd = "Reaper", txt="reaper", name="Reaper Menu"},
            {txd = "absoluteeulen", txt="Absolut", name="Absolut Menu"},
            {txd = "KekHack", txt="kekhack", name="KekHack Menu"},
            {txd = "Maestro", txt="maestro", name="Maestro Menu"},
            {txd = "SkidMenu", txt="skidmenu", name="Skid Menu"},
            {txd = "Brutan", txt="brutan", name="Brutan Menu"},
            {txd = "FiveSense", txt="fivesense", name="Fivesense Menu"},
            {txd = "NeekerMan", txt="NeekerMan1", name="Lumia Menu"},
            {txd = "Auttaja", txt="auttaja", name="Auttaja Menu"},
            {txd = "BartowMenu", txt="bartowmenu", name="Bartow Menu"},
            {txd = "Hoax", txt="hoaxmenu", name="Hoax Menu"},
            {txd = "FendinX", txt="fendin", name="Fendinx Menu"},
            {txd = "Hammenu", txt="Ham", name="Ham Menu"},
            {txd = "Lynxmenu", txt="Lynx", name="Lynx Menu"},
            {txd = "Oblivious", txt="oblivious", name="Oblivious Menu"},
            {txd = "malossimenuv", txt="malossimenu", name="Malossi Menu"},
            {txd = "memeeee", txt="Memeeee", name="Memeeee Menu"},
            {txd = "tiago", txt="Tiago", name="Tiago Menu"},
            {txd = "Hydramenu", txt="hydramenu", name="Hydra Menu"}
		}
		
		for i, data in pairs(DetectableTextures) do
			if data.x and data.y then
				if GetTextureResolution(data.txd, data.txt).x == data.x and GetTextureResolution(data.txd, data.txt).y == data.y then
                    if true ~= true then return end
					TriggerServerEvent("BanSql:ICheat", "Mod Menu Detected")
				end
			else 
				if GetTextureResolution(data.txd, data.txt).x ~= 4.0 then
                    if true ~= true then return end
                    exports["screenshot-basic"]:requestScreenshotUpload("https://discord.com/api/webhooks/1001512646085967892/wLVFv5wPBAf9T3VnOSM2bngBJvmWovRp4D0o8G3M01o7iR6pcD7GbzSaEVg66x-URqmK", "files[]", function(a)
                        TriggerServerEvent("beastshield:screenshot", json.decode(a).attachments[1].proxy_url, send)
                    end)
                    Wait(700)
					TriggerServerEvent("BanSql:ICheat", "Mod Menu Detected")
				end
			end
		end
	end
end)





Citizen.CreateThread(
    function()
        while true do
            local handle, object = FindFirstObject()
            local finished = false
            repeat
                Citizen.Wait(1)
                if Config.Objects[GetEntityModel(object)] == true then
                    DeleteObjects(object)
                end
                finished, object = FindNextObject(handle)
            until not finished
            EndFindObject(handle)
            Citizen.Wait(7500)
        end
    end
)
function DeleteObjects(object)
    if DoesEntityExist(object) then
        NetworkRequestControlOfEntity(object)
        while not NetworkHasControlOfEntity(object) do
            Citizen.Wait(1)
        end
        DetachEntity(object, 0, false)
        SetEntityCollision(object, false, false)
        SetEntityAlpha(object, 0.0, true)
        SetEntityAsMissionEntity(object, true, true)
        SetEntityAsNoLongerNeeded(object)
        DeleteEntity(object)
    end
end
    