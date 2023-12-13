fx_version 'cerulean'
game 'gta5'
lua54 'yes'

name 'krs_banking'
author 'karos7804'
version "1.0.0"

client_scripts {
    
    'client/*.lua'
}

server_scripts {

    'server/*.lua'
}

shared_scripts {
    '@es_extended/imports.lua',
	'@ox_lib/init.lua',
    'shared/*.lua'
}

ui_page 'ui/index.html'

files {
	'ui/index.html',
	'ui/script.js',
	'ui/style.css',
	'ui/logo.png'
}
