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

function makeList(set)
    for index, entry in pairs(set) do
        if index <= g.rowCount then
            setButton(index, entry)
        else
            break
        end
    end
end

function setButton(index, entry)
    local row = TunguskaSF.rows[index]
    row:SetText(entry.name)
    row:SetScript('OnClick', function()
        if #entry.entries > 0 then
            hideRows()
            makeList(entry.entries)
            BackButton:Show()
            table.insert(g.location, index)
        end
    end)
    row:Show()
end
