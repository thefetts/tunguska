local g = Global

Tunguska = CreateFrame('Frame', 'Tunguska', UIParent, 'ButtonFrameTemplate')
TunguskaTitleText:SetText('Tunguska v' .. g.version)
SetPortraitToTexture(TunguskaPortrait, 'Interface\\Icons\\trade_archaeology_delicatemusicbox');

local frame = Tunguska
frame:SetPoint('Center', 0, 0)
frame:SetFrameStrata('high')
frame:SetMovable(true)
frame:EnableMouse(true)
frame:SetClampedToScreen(true)
frame:RegisterForDrag('LeftButton')
frame:SetScript('OnDragStart', frame.StartMoving)
frame:SetScript('OnDragStop', frame.StopMovingOrSizing)
frame:SetWidth(300)
frame:SetHeight(350)
frame:Show()
g.location = {}
g.frame = frame

local texture = frame:CreateTexture(nil, 'Artwork')
texture:SetColorTexture(0, 0, 0, 0.3)
texture:SetAllPoints(frame)

local scrollFrame = CreateFrame('ScrollFrame', 'TunguskaSF', frame)
scrollFrame:SetPoint('TopLeft', frame, 'TopLeft', 9, -65)
scrollFrame:SetPoint('BottomRight', frame, 'BottomRight', -11, 30)
scrollFrame:Show()
scrollFrame.rows = {}
frame.scrollFrame = scrollFrame

local scrollbar = CreateFrame("Slider", 'ScrollBar', scrollFrame, "UIPanelScrollBarTemplate")
scrollbar:SetPoint("TOPRIGHT", scrollFrame, "TOPRIGHT", 0, -15)
scrollbar:SetPoint("BOTTOMRIGHT", scrollFrame, "BOTTOMRIGHT", 0, 15)
scrollbar:SetScript("OnValueChanged", onScroll)
scrollbar.back = scrollbar:CreateTexture(nil, "BACKGROUND")
scrollbar.back:SetColorTexture(0,0,0,0.4)
scrollbar.back:SetAllPoints(scrollbar)
scrollbar:SetMinMaxValues(1, 1)
scrollbar:SetValueStep(1)
scrollbar.CurrentValue = 1
scrollbar:SetWidth(16)
scrollbar:EnableMouseWheel(true)
frame:EnableMouseWheel(true)
frame.ScrollBar = scrollbar

local texture2 = scrollFrame:CreateTexture(nil, 'Artwork')
texture2:SetColorTexture(0, 0, 0, 0.2)
texture2:SetAllPoints(scrollFrame)

local backButton = CreateFrame('Button', 'BackButton', frame, 'UIPanelButtonTemplate')
backButton:SetPoint('TopRight', frame, 'TopRight', -10, -35)
backButton:SetHeight(20)
backButton:SetWidth(50)
backButton:SetText('Back')
backButton:SetScript('OnClick', back)
backButton:Hide()

local stopButton = CreateFrame('Button', 'StopButton', frame, 'UIPanelButtonTemplate')
stopButton:SetPoint('TopRight', backButton, 'TopLeft', 0, 0)
stopButton:SetHeight(20)
stopButton:SetWidth(50)
stopButton:SetText('Stop')
stopButton:SetScript('OnClick', stop)
stopButton:Hide()
frame.stopButton = stopButton

g.rowCount = 12
for i = 1, g.rowCount do
    local r = CreateFrame('Button', nil, scrollFrame, 'UIPanelButtonTemplate')
    r:SetPoint('TopLeft', scrollFrame, 'TopLeft', 5, -(20 * i) + 15)
    r:SetHeight(20)
    r:SetWidth(scrollFrame:GetWidth() - 25)
    table.insert(scrollFrame.rows, r)
    r:Hide()
end

SLASH_tunguska1 = '/tgk'
SLASH_tunguska2 = '/tunguska'
SlashCmdList['tunguska'] = function()
    g.frame:Show()
end
