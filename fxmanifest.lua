fx_version 'adamant'
game 'gta5'
lua54 'yes'


client_scripts {
    'config/config.lua',
    'client/*.lua',
    'tables/blacklistplate.lua',
    'client/acloader.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'config/config.lua',
    'server/server.lua',
    'tables/blacklistplate.lua'
}
