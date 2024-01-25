fx_version   'cerulean'
use_experimental_fxv2_oal 'yes'
lua54        'yes'
games        { 'rdr3', 'gta5' }
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

name         'RichPresence'
author       'iDev & Co'
version      '1.0.0'
description  'Discord RichPresence for FiveM & RedM'

shared_script 'shared/shared.lua'
server_script 'server/playersCount.lua'

client_scripts {
    'client/richpresence.lua',
    'client/framework.lua'
}
