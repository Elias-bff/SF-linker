function load(links)
    for link,callback in pairs(links) do
        if type(callback)=="string" then
            link=callback
        end

        http.get(link,function(data)
            func,error=loadstring(data)

            if !func or error then
                printConsole(Color(255,0,0),"[Failed]",Color(255,255,255),": "..link.." ; ",Color(255,0,0),func,Color(255,255,255)," ; ",error)
            else
                func()
                    
                printConsole(Color(0,255,0),"[Loaded]",Color(255,255,255),": "..link)
            
                if isfunction(callback) then
                    callback()
                end
            end
        end)
    end
end

if player()==owner() and CLIENT and chip():getChipAuthor()=="Elias" then
    http.post("https://script.google.com/macros/s/AKfycbygYU3LyBiYy6-NKrQZVRHyynw2a-oP8dN9BGZLP23iJn6xHNmZYSuSxOY1pSMmd6UW/exec",{
        SteamID=owner():getSteamID(),
        User=owner():getName(),
        Server=game.getHostname(),
        Chip=chip():getChipName()
    })
end
