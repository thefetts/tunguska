local t = Tunguska

local f = CreateFrame("FRAME", "Tunguska", UIParent)
f:SetPoint("CENTER", 0, 0)
f:SetFrameStrata("high")
f:SetMovable(true)
f:EnableMouse(true)
f:SetClampedToScreen(true)
f:RegisterForDrag("LeftButton")
f:SetScript("OnDragStart", f.StartMoving)
f:SetScript("OnDragStop", f.StopMovingOrSizing)
f:SetWidth(200)
f:SetHeight(212)
f:Show()
f.rows = {}
f.location = {}
t.f = f

local tx = f:CreateTexture(nil, "ARTWORK")
f.bg = tx
tx:SetColorTexture(0, 0, 0, 0.8)
tx:SetAllPoints(f)

local x = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
x:SetPoint("TOPRIGHT", f, "TOPRIGHT", -5, -5)
x:SetText("X")
x:SetWidth("22")
x:SetHeight("22")
x:SetScript("OnClick", function() f:Hide() end)

local b = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
b:SetPoint("TOPRIGHT", f, "TOPRIGHT", -5, -27)
b:SetText("<")
b:SetWidth("22")
b:SetHeight("22")
b:SetScript("OnClick", back)

rowCount = 10
for i = 1, rowCount do
    local r = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
    r:SetPoint("TOPLEFT", f, "TOPLEFT", 5, -(20 * i) + 15)
    r:SetHeight(20)
    r:SetWidth(f:GetWidth() - 35)
    table.insert(f.rows, r)
    r:Hide()
end
