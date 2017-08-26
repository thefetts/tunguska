local g = Global

function hideRows()
    for _, row in pairs(g.frame.scrollFrame.rows) do
        row:Hide()
    end
end

function back()
    hideRows()
    if #g.frame.location == 0 then
        makeList(g.data)
        BackButton:Hide()
    end
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
    local row = g.frame.scrollFrame.rows[index]
    row:SetText(entry.name)
    row:SetScript('OnClick', function()
        if #entry.entries > 0 then
            hideRows()
            makeList(entry.entries)
            BackButton:Show()
        end
    end)
    row:Show()
end
