-- Nur für ESX mit Standard-Inventar (Tabelle `items`).
-- Bei ox_inventory stattdessen in ox_inventory/data/items.lua eintragen (siehe README).
INSERT IGNORE INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
    ('map', 'Karte', 1, 0, 1),
    ('brochure', 'Broschüre', 1, 0, 1);
