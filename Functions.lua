local g = Global

function table.slice(tbl, first, last, step)
    local sliced = {}

    for i = first or 1, last or #tbl, step or 1 do
        sliced[#sliced + 1] = tbl[i]
    end

    return sliced
end

function hideRows()
    for _, row in pairs(TunguskaSF.rows) do
        row:Hide()
    end
    for _, row in pairs(TunguskaSF.songRows) do
        row:Hide()
    end
end

function back(self)
    hideRows()
    local data = g.data
    table.remove(g.location)
    if #g.location == 0 then
        BackButton:Hide()
    else
        for _, value in pairs(g.location) do
            data = data.entries[value]
        end
    end

    makeList(data, 1, self:GetParent().ScrollBar)
end

function stop()
    StopMusic()
    StopButton:Hide()
end

function setCategoryButton(index, entry, scrollbar)
    local row = TunguskaSF.rows[index]
    row:SetText(entry.name)
    row:SetScript('OnClick', function()
        buttonHandler(index, entry, scrollbar)
    end)
    row:Show()
end

function setSongButton(index, song)
    local row = TunguskaSF.songRows[index]
    row:SetText(song)
    row:SetScript('OnClick', function()
        PlayMusic('Sound/Music/' .. song .. '.mp3')
        StopButton:Show()
    end)
    row:Show()
end

function makeList(entry, start, scrollbar)
    local entries = entry.entries or {}
    local songs = entry.songs or {}
    local combinedLength = #entries + #songs
    log('Combined length: ' .. #entries + #songs)

    local start = start or 1
    local stop = math.min(start + g.rowCount - 1, combinedLength)
    log('start: ' .. start .. ', stop: ' .. stop)

    local row = 1
    for index = start, stop, 1 do
        if (index <= #entries) then
            setCategoryButton(row, entries[index], scrollbar)
        else
            local songIndex = index - #entries
            log("Song Index: " .. songIndex)
            setSongButton(row, songs[songIndex], scrollbar)
        end
        row = row + 1
    end

    g.frame.scrollFrame.data = entry
    local scrollMax = math.max(combinedLength - (g.rowCount - 1), start)
    log('setting scroll from 1 to ' .. scrollMax)
    scrollbar:SetMinMaxValues(1, scrollMax)
end

function buttonHandler(index, entry, scrollbar)
    if entry.entries or entry.songs then
        hideRows()
        BackButton:Show()
        table.insert(g.location, index)
        makeList(entry, 1, scrollbar)
    end
end

function onScroll(self, value)
    local sf = g.frame.scrollFrame
    log('Scrolled: ' .. value)
    hideRows()
    makeList(sf.data, math.floor(value), self)
end

function log(msg)
    if (g.log) then
        DEFAULT_CHAT_FRAME:AddMessage(msg)
    end
end
