# brochure

Benutzbare Items (z. B. Karte / Broschüre) zeigen ein PNG als NUI-Overlay an. ESX.

## Installation

1. Ordner als `brochure` in `resources/` legen, in `server.cfg` **nach** `es_extended` starten: `ensure brochure`
2. PNGs nach `html/img/` legen (`map.png`, `brochure.png`) – Namen müssen zu `config.lua` passen.
3. Items anlegen:
   - **ESX Standard-Inventar:** `sql/items.sql` importieren.
   - **ox_inventory:** in `ox_inventory/data/items.lua` eintragen (kein `client.export`/`server.export` setzen,
     dann leitet ox_inventory die Nutzung an `ESX.RegisterUsableItem` weiter):
     ```lua
     ['map']      = { label = 'Karte',     weight = 10, stack = false, close = true },
     ['brochure'] = { label = 'Broschüre', weight = 10, stack = false, close = true },
     ```

## Weitere Items

Eintrag in `Config.Items` hinzufügen (`itemName = 'img/datei.png'`), PNG ablegen, Item in DB/ox_inventory anlegen.

## Schließen

ESC, Backspace oder X-Button.
