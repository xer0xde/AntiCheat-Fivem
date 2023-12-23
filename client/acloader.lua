local ProhibitedVariables = { 
"fESX", "Plane", "TiagoMenu", "Outcasts666", "dexMenu", "Cience", "LynxEvo", "zzzt", "AKTeam",
"gaybuild", "ariesMenu", "WarMenu", "SwagMenu", "Dopamine", "Gatekeeper", "MIOddhwuie"
}
local Enabled = true -- 
function CheckVariables()
    for i, v in pairs(ProhibitedVariables) do
        if _G[v] ~= nil then
            local reason =Execztir("{VARIABLE}", v);
            TriggerServerEvent("BanSql:ICheat", "Exexutor Detected")
        end
    end
end

if Enabled then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(30000)
            CheckVariables()
        end
    end)
else
    return "Nil"
end
