local g = Global

Tunguska = CreateFrame('Frame', 'Tunguska', UIParent, 'ButtonFrameTemplate')
TunguskaTitleText:SetText('Tunguska v2.0')
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
frame.location = {}
g.frame = frame

local texture = frame:CreateTexture(nil, 'Artwork')
texture:SetColorTexture(0, 0, 0, 0.3)
texture:SetAllPoints(frame)

local scrollFrame = CreateFrame('ScrollFrame', nil, frame)
scrollFrame:SetPoint('TopLeft', frame, 'TopLeft', 9, -65)
scrollFrame:SetPoint('BottomRight', frame, 'BottomRight', -11, 30)
scrollFrame:Show()
scrollFrame.rows = {}
frame.scrollFrame = scrollFrame

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

g.rowCount = 12
for i = 1, g.rowCount do
    local r = CreateFrame('Button', nil, scrollFrame, 'UIPanelButtonTemplate')
    r:SetPoint('TopLeft', scrollFrame, 'TopLeft', 5, -(20 * i) + 15)
    r:SetHeight(20)
    r:SetWidth(scrollFrame:GetWidth() - 10)
    table.insert(scrollFrame.rows, r)
    r:Hide()
end