local ESX = exports['es_extended']:getSharedObject()

for itemName, image in pairs(Config.Items) do
    ESX.RegisterUsableItem(itemName, function(source)
        TriggerClientEvent('brochure:open', source, image)
    end)
end
