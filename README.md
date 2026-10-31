# brochure

Benutzbare Items (z. B. Karte / Broschüre) zeigen ein PNG als NUI-Overlay an. ESX.

## Installation

1. Ordner als `brochure` in `resources/` legen, in `server.cfg` **nach** `es_extended` starten: `ensure brochure`
2. Bilder: In `html/img/` liegen bereits zwei **Beispielbilder** (`map.png`, `brochure.png` – fiktive Insel
   „Beispielhaven“), damit die Resource sofort testbar ist. Für den Live-Betrieb einfach durch eigene PNGs mit
   gleichem Namen ersetzen (oder in `config.lua` anpassen).
3. Items anlegen:
   - **ESX Standard-Inventar:** `sql/items.sql` importieren.
   - **ox_inventory:** in `ox_inventory/data/items.lua` eintragen (kein `client.export`/`server.export` setzen,
     dann leitet ox_inventory die Nutzung an `ESX.RegisterUsableItem` weiter):
     ```lua
     ['map']      = { label = 'Karte',     weight = 10, stack = false, close = true },
     ['brochure'] = { label = 'Broschüre', weight = 10, stack = false, close = true },
     ```

## Schnelltest

Als Admin ingame das Item geben und im Inventar benutzen:

```
/giveitem <deine-id> map 1
/giveitem <deine-id> brochure 1
```

(Funktioniert sowohl mit ESX als auch mit ox_inventory.)

## Weitere Items

Eintrag in `Config.Items` hinzufügen (`itemName = 'img/datei.png'`), PNG ablegen, Item in DB/ox_inventory anlegen.

## Schließen

ESC, Backspace oder X-Button.
