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
end

function back(self)
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

    makeCategoryList(data, 1, self:GetParent().ScrollBar)
end

function stop()
    StopMusic()
    StopButton:Hide()
end

function makeCategoryList(categories, start, scrollbar)
    g.frame.scrollFrame.dataType = 'categories'
    makeList(categories, start, scrollbar, setCategoryButton)
end

function makeSongList(songs, start, scrollbar)
    g.frame.scrollFrame.dataType = 'songs'
    makeList(songs, start, scrollbar, setSongButton)
end

function makeList(items, start, scrollbar, method)
    log("making list for " .. #items .. " items")
    local start = start or 1
    local stop = math.min(start + g.rowCount - 1, #items)
    log("start: " .. start .. ", stop: " .. stop)
    for index, item in pairs(table.slice(items, start, stop, 1)) do
        method(index, item, scrollbar)
    end
    g.frame.scrollFrame.data = items
    local scrollMax = math.max(#items - (g.rowCount - 1), start)
    log("setting scroll from 1 to " .. scrollMax)
    scrollbar:SetMinMaxValues(1, scrollMax)
    log("done setting scroll")
end

function buttonHandler(index, entry, scrollbar)
    if entry.entries or entry.songs then
        hideRows()
        BackButton:Show()
        table.insert(g.location, index)

        if entry.entries and #entry.entries > 0 then
            makeCategoryList(entry.entries, 1, scrollbar)
        elseif entry.songs and #entry.songs > 0 then
            makeSongList(entry.songs, 1, scrollbar)
        end
    end
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
    local row = TunguskaSF.rows[index]
    row:SetText(song)
    row:SetScript('OnClick', function()
        PlayMusic('Sound/Music/' .. song .. '.mp3')
        StopButton:Show()
    end)
    row:Show()
end

function onScroll(self, value)
    local sf = g.frame.scrollFrame
    log("Scrolled: " .. value);
    log("Data size: " .. table.getn(sf.data))
    if sf.dataType == 'categories' then
        makeCategoryList(sf.data, math.floor(value), self)
    else
        makeSongList(sf.data, math.floor(value), self)
    end
end

function log(msg)
    if (g.log) then
        DEFAULT_CHAT_FRAME:AddMessage(msg)
    end
end
