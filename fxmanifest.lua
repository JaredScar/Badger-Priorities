author "Badger#0002"
description "Badger Priorites"
fx_version "cerulean"
game "gta5"

client_script "client.lua"

server_script "server.lua"

shared_scripts {
    "config.lua",
}

exports {
    "GetPrioStatus"
}