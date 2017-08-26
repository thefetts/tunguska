local t = Tunguska

function hideRows()
    for _, row in pairs(t.f.rows) do
        row:Hide()
    end
end

function back()
    hideRows()
    if #t.f.location == 0 then
        makeList(t.data)
    end
end

function makeList(set)
    for index, entry in pairs(set) do
        if index <= 10 then
            setButton(index, entry)
        else
            break
        end
    end
end

function setButton(index, entry)
    local r = t.f.rows[index]
    r:SetText(entry.name)
    r:SetScript("OnClick", function()
        if #entry.entries > 0 then
            hideRows()
            makeList(entry.entries)
        end
    end)
    r:Show()
end
