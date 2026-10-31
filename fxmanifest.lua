fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'brochure'
description 'Benutzbare Items (Karte/Broschüre), die ein PNG als NUI-Overlay anzeigen'
version '1.0.0'

shared_script 'config.lua'
server_script 'server/main.lua'
client_script 'client/main.lua'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/img/*.png'
}

dependency 'es_extended'
