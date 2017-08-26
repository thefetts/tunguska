local g = Global

function hideRows()
    for _, row in pairs(TunguskaSF.rows) do
        row:Hide()
    end
end

function back()
    hideRows()
    local data = g.data
    table.remove(g.location)
    if #g.location == 0 then
        BackButton:Hide()
    else
        for _, value in pairs(g.location) do
            data = data[value].entries
        end
    end
    makeList(data)
end

function stop()
    StopMusic()
    StopButton:Hide()
end

function makeList(entries)
    for index, entry in pairs(entries) do
        if index <= g.rowCount then
            setButton(index, entry)
        else
            break
        end
    end
end

function makeSongList(songs)
    for index, song in pairs(songs) do
        if index <= g.rowCount then
            setSongButton(index, song)
        else
            break
        end
    end
end

function buttonHandler(index, entry)
    if entry.entries or entry.songs then
        hideRows()
        BackButton:Show()
        table.insert(g.location, index)

        if entry.entries and #entry.entries > 0 then
            makeList(entry.entries)
        elseif entry.songs and #entry.songs > 0 then
            makeSongList(entry.songs)
        end
    end
end

function setButton(index, entry)
    local row = TunguskaSF.rows[index]
    row:SetText(entry.name)
    row:SetScript('OnClick', function()
        buttonHandler(index, entry)
    end)
    row:Show()
end

function setSongButton(index, song)
    local row = TunguskaSF.rows[index]
    row:SetText(song)
    row:SetScript('OnClick', function()
        PlayMusic('Sound/Music/' .. song .. '.mp3')
        StopButton:Show()
    end)
    row:Show()
end
