ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

function RandomItemi()
    return Config.Itemit[math.random(#Config.Itemit)]
end
function RandomItemii()
    return Config.Itemiit[math.random(#Config.Itemiit)]
end

RegisterServerEvent('BubsiRoskis')
AddEventHandler('BubsiRoskis', function()
    local Pelaaja = ESX.GetPlayerFromId(source)
    local ei = math.random(1, 10)
    local nimi = GetPlayerName(source)
    local Itemi = RandomItemi()
    local maara = math.random(Config.minItemi, Config.maxItemi)
    local raha = math.random(Config.minRaha, Config.maxRaha)

        if ei == 3 then
            Pelaaja.showNotification('Et löytänyt mitään')
        elseif ei == 5 then
            Pelaaja.addMoney(raha)
            Dclogit(Config.vari, "Prison", nimi.. " found **" ..raha.. "€** from trascan")
	    Pelaaja.showNotification('You found money ~g~'..raha.. '$')
        else
            Pelaaja.addInventoryItem(Itemi, maara)
            Dclogit(Config.vari, "Prison", nimi.. " found **" ..Itemi.."** X **" ..maara.."** From trascan")
     end
end)

RegisterServerEvent('BubsiKaappi')
AddEventHandler('BubsiKaappi', function()
    local Pelaaja = ESX.GetPlayerFromId(source)
    local ei = math.random(1, 10)
    local nimi = GetPlayerName(source)
    local Itemi = RandomItemii()
    local maara = math.random(Config.MiniItemi, Config.MaxiItemi)
    local raha = math.random(Config.MiniRaha, Config.MaxiRaha)

        if ei == 3 then
            Pelaaja.ShowNotification('Et löytänyt mitään')
        elseif ei == 5 then
            Pelaaja.addMoney(raha)
	    Pelaaja.showNotification('You found money ~g~'..raha.. '$')
            Dclogit(Config.vari, "Prison", nimi.. " found **" ..raha.. "€** from shelf")
        else
            Pelaaja.addInventoryItem(Itemi, maara)
            Dclogit(Config.vari, "Prison", nimi.. " found **" ..Itemi.."** X **" ..maara.."** From shelf")
     end
end)

function Dclogit(color, name, message, footer)
    local footer = 'Bubsi - '..os.date("%d/%m/%Y - %X")
    local embed = {
          {
              ["color"] = color,
              ["title"] = "**".. name .."**",
              ["description"] = message,
              ["footer"] = {
              ["text"] = footer,
              },
          }
      }
    PerformHttpRequest(Config.WEBHOOKKI, function(err, text, headers) end, 'POST', json.encode({username = Config.BotinNimi, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

-- Bubsi was not here dont tell anyone