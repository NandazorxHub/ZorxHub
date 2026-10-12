
--============================================================
-- ZORX HUB - FIX TOTAL UI
-- PART 1/5
-- SERVICE, COLORS, MAIN FRAME, TOP BAR, PILLS
--============================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local MarketplaceService = game:GetService("MarketplaceService")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Hapus UI lama agar tidak duplikat
local oldUI = playerGui:FindFirstChild("ZorXHub")
if oldUI then
    oldUI:Destroy()
end

--============================================================
-- BASE COLORS
--============================================================

local Colors = {
    Background = Color3.fromRGB(15, 15, 18),
    Sidebar = Color3.fromRGB(18, 18, 22),
    Panel = Color3.fromRGB(22, 22, 27),
    Slot = Color3.fromRGB(28, 28, 34),
    SlotHover = Color3.fromRGB(38, 38, 46),
    Text = Color3.fromRGB(240, 240, 240),
    SubText = Color3.fromRGB(140, 140, 150),
    Stroke = Color3.fromRGB(45, 45, 55),
    PillBg = Color3.fromRGB(28, 28, 34),
    PillStroke = Color3.fromRGB(45, 45, 55),
    PillText = Color3.fromRGB(240, 240, 240),
}

local DefaultPillBg = Colors.PillBg
local DefaultPillStroke = Colors.PillStroke
local DefaultPillText = Colors.PillText
local DefaultBorder = Colors.Stroke

local InfoLogoBorder = Color3.fromRGB(160, 80, 255)
local NoneDotColor = Color3.fromRGB(45, 45, 55)

--============================================================
-- AUTO DETECT GAME
--============================================================

local function getGameName()
    local name = game.Name

    local success, info = pcall(function()
        return MarketplaceService:GetProductInfo(game.PlaceId)
    end)

    if success and info and info.Name then
        name = info.Name
    end

    return name or "Unknown Game"
end

local function getTodayDate()
    return os.date("%d/%m/%Y")
end

--============================================================
-- THEME COLORS
--============================================================

local ThemeColors = {
    None = {
        bg = DefaultPillBg,
        stroke = DefaultPillStroke,
        text = DefaultPillText,
        border = DefaultBorder,
        infoLogo = InfoLogoBorder
    },

    Biru = {
        bg = Color3.fromRGB(25, 55, 130),
        stroke = Color3.fromRGB(60, 120, 220),
        text = Color3.fromRGB(220, 235, 255),
        border = Color3.fromRGB(60, 120, 220),
        infoLogo = Color3.fromRGB(60, 120, 220)
    },

    Ungu = {
        bg = Color3.fromRGB(80, 35, 130),
        stroke = Color3.fromRGB(160, 90, 220),
        text = Color3.fromRGB(235, 220, 255),
        border = Color3.fromRGB(160, 90, 220),
        infoLogo = Color3.fromRGB(160, 90, 220)
    },

    Hijau = {
        bg = Color3.fromRGB(25, 100, 50),
        stroke = Color3.fromRGB(60, 180, 90),
        text = Color3.fromRGB(220, 255, 225),
        border = Color3.fromRGB(60, 180, 90),
        infoLogo = Color3.fromRGB(60, 180, 90)
    },

    Kuning = {
        bg = Color3.fromRGB(140, 120, 25),
        stroke = Color3.fromRGB(220, 200, 60),
        text = Color3.fromRGB(255, 250, 215),
        border = Color3.fromRGB(220, 200, 60),
        infoLogo = Color3.fromRGB(220, 200, 60)
    },

    Oren = {
        bg = Color3.fromRGB(150, 75, 20),
        stroke = Color3.fromRGB(230, 140, 50),
        text = Color3.fromRGB(255, 235, 215),
        border = Color3.fromRGB(230, 140, 50),
        infoLogo = Color3.fromRGB(230, 140, 50)
    },

    Merah = {
        bg = Color3.fromRGB(130, 25, 30),
        stroke = Color3.fromRGB(220, 60, 70),
        text = Color3.fromRGB(255, 220, 220),
        border = Color3.fromRGB(220, 60, 70),
        infoLogo = Color3.fromRGB(220, 60, 70)
    },

    Pink = {
        bg = Color3.fromRGB(140, 40, 90),
        stroke = Color3.fromRGB(230, 100, 160),
        text = Color3.fromRGB(255, 225, 240),
        border = Color3.fromRGB(230, 100, 160),
        infoLogo = Color3.fromRGB(230, 100, 160)
    },

    Cyan = {
        bg = Color3.fromRGB(20, 100, 110),
        stroke = Color3.fromRGB(60, 200, 210),
        text = Color3.fromRGB(215, 250, 255),
        border = Color3.fromRGB(60, 200, 210),
        infoLogo = Color3.fromRGB(60, 200, 210)
    },

    Putih = {
        bg = Color3.fromRGB(180, 180, 185),
        stroke = Color3.fromRGB(240, 240, 245),
        text = Color3.fromRGB(30, 30, 35),
        border = Color3.fromRGB(240, 240, 245),
        infoLogo = Color3.fromRGB(240, 240, 245)
    },

    Hitam = {
        bg = Color3.fromRGB(15, 15, 18),
        stroke = Color3.fromRGB(50, 50, 55),
        text = Color3.fromRGB(240, 240, 240),
        border = Color3.fromRGB(50, 50, 55),
        infoLogo = Color3.fromRGB(50, 50, 55)
    },

    Emas = {
        bg = Color3.fromRGB(140, 100, 20),
        stroke = Color3.fromRGB(230, 190, 60),
        text = Color3.fromRGB(255, 245, 210),
        border = Color3.fromRGB(230, 190, 60),
        infoLogo = Color3.fromRGB(230, 190, 60)
    },

    Abu = {
        bg = Color3.fromRGB(60, 60, 70),
        stroke = Color3.fromRGB(120, 120, 135),
        text = Color3.fromRGB(240, 240, 240),
        border = Color3.fromRGB(120, 120, 135),
        infoLogo = Color3.fromRGB(120, 120, 135)
    },

    Lime = {
        bg = Color3.fromRGB(80, 140, 25),
        stroke = Color3.fromRGB(160, 230, 60),
        text = Color3.fromRGB(240, 255, 215),
        border = Color3.fromRGB(160, 230, 60),
        infoLogo = Color3.fromRGB(160, 230, 60)
    },

    Marun = {
        bg = Color3.fromRGB(80, 20, 30),
        stroke = Color3.fromRGB(150, 50, 60),
        text = Color3.fromRGB(255, 220, 220),
        border = Color3.fromRGB(150, 50, 60),
        infoLogo = Color3.fromRGB(150, 50, 60)
    },

    Navy = {
        bg = Color3.fromRGB(15, 25, 70),
        stroke = Color3.fromRGB(45, 70, 150),
        text = Color3.fromRGB(215, 225, 255),
        border = Color3.fromRGB(45, 70, 150),
        infoLogo = Color3.fromRGB(45, 70, 150)
    },

    Rainbow = {
        bg = DefaultPillBg,
        stroke = DefaultPillStroke,
        text = DefaultPillText,
        border = DefaultBorder,
        infoLogo = InfoLogoBorder
    },
}

local ActiveTheme = "None"
local RainbowActive = false
local RainbowHue = 0

--============================================================
-- SCREEN GUI
--============================================================

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ZorXHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = 20
ScreenGui.Parent = playerGui

local PopupLayer = Instance.new("Frame")
PopupLayer.Name = "PopupLayer"
PopupLayer.Size = UDim2.fromScale(1, 1)
PopupLayer.BackgroundTransparency = 1
PopupLayer.ZIndex = 50
PopupLayer.Parent = ScreenGui

--============================================================
-- MAIN FRAME
-- Isi panel akan diperbaiki di PART berikutnya
--============================================================

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.Size = UDim2.new(0, 700, 0, 450)
Main.Position = UDim2.fromScale(0.5, 0.5)
Main.BackgroundColor3 = Colors.Background
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.ClipsDescendants = false
Main.Parent = ScreenGui
Main.ClipsDescendants = true
Main.BorderSizePixel = 0


local MainSizeLimit = Instance.new("UISizeConstraint")
MainSizeLimit.MinSize = Vector2.new(340, 280)
MainSizeLimit.MaxSize = Vector2.new(760, 520)
MainSizeLimit.Parent = Main

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = DefaultBorder
MainStroke.Thickness = 1
MainStroke.Parent = Main

--============================================================
-- TOP BAR
--============================================================

local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.Position = UDim2.new(0, 0, 0, 0)
TopBar.BackgroundColor3 = Colors.Background
TopBar.BorderSizePixel = 0
TopBar.ClipsDescendants = true
TopBar.Parent = Main

local TopBarCorner = Instance.new("UICorner")
TopBarCorner.CornerRadius = UDim.new(0, 8)
TopBarCorner.Parent = TopBar

local LogoImg = Instance.new("ImageLabel")
LogoImg.Name = "LogoImg"
LogoImg.Size = UDim2.new(0, 18, 0, 18)
LogoImg.Position = UDim2.new(0, 10, 0.5, -9)
LogoImg.BackgroundTransparency = 1
LogoImg.Image = "rbxassetid://82414580295798"
LogoImg.ScaleType = Enum.ScaleType.Fit
LogoImg.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(0, 100, 1, 0)
Title.Position = UDim2.new(0, 32, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "ZORX"
Title.TextColor3 = Colors.Text
Title.Font = Enum.Font.GothamBold
Title.TextSize = 11
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

--============================================================
-- PILL ATAS - DIPERTAHANKAN
--============================================================

local PillContainer = Instance.new("Frame")
PillContainer.Name = "PillContainer"
PillContainer.Size = UDim2.new(0, 0, 1, 0)
PillContainer.AutomaticSize = Enum.AutomaticSize.X
PillContainer.Position = UDim2.new(1, -72, 0, 0)
PillContainer.AnchorPoint = Vector2.new(1, 0)
PillContainer.BackgroundTransparency = 1
PillContainer.Parent = TopBar

local PillList = Instance.new("UIListLayout")
PillList.FillDirection = Enum.FillDirection.Horizontal
PillList.HorizontalAlignment = Enum.HorizontalAlignment.Right
PillList.VerticalAlignment = Enum.VerticalAlignment.Center
PillList.Padding = UDim.new(0, 4)
PillList.Parent = PillContainer

local allPills = {}
local allPillStrokes = {}
local allPillTexts = {}
local allBorders = {}
local infoLogoBorders = {}

local function registerBorder(stroke)
    table.insert(allBorders, stroke)
end

local function registerInfoLogoBorder(stroke)
    table.insert(infoLogoBorders, stroke)
end

local function createPill(textText, width)
    local pill = Instance.new("Frame")
    pill.Name = "Pill"
    pill.Size = UDim2.new(0, width, 0, 22)
    pill.BackgroundColor3 = DefaultPillBg
    pill.BorderSizePixel = 0
    pill.Parent = PillContainer

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 5)
    corner.Parent = pill

    local stroke = Instance.new("UIStroke")
    stroke.Color = DefaultPillStroke
    stroke.Thickness = 1
    stroke.Parent = pill

    local txt = Instance.new("TextLabel")
    txt.Name = "Text"
    txt.Size = UDim2.new(1, 0, 1, 0)
    txt.BackgroundTransparency = 1
    txt.Text = textText
    txt.TextColor3 = DefaultPillText
    txt.Font = Enum.Font.GothamBold
    txt.TextSize = 10
    txt.TextXAlignment = Enum.TextXAlignment.Center
    txt.TextTruncate = Enum.TextTruncate.AtEnd
    txt.Parent = pill

    table.insert(allPills, pill)
    table.insert(allPillStrokes, stroke)
    table.insert(allPillTexts, txt)

    return pill, txt
end

local gamePill, gameText = createPill(getGameName(), 170)
local fpsPill, fpsText = createPill("0", 45)
local execPill, execText = createPill("Delta", 55)

task.spawn(function()
    while ScreenGui.Parent do
        task.wait(5)

        if not ScreenGui.Parent then
            break
        end

        local newName = getGameName()
        if gameText.Text ~= newName then
            gameText.Text = newName
        end
    end
end)

--============================================================
-- PART 1 SELESAI
-- PART 2 dimulai dari tombol Maximize, Close,
-- Minimize, Divider, Sidebar, dan Search.
--============================================================

--============================================================
-- ZORX HUB - PART 2/5
-- BUTTONS, SIDEBAR, SEARCH, CONTENT FRAME
--============================================================

--============================================================
-- MAXIMIZE BUTTON
--============================================================

local MaximizeBtn = Instance.new("TextButton")
MaximizeBtn.Name = "MaximizeBtn"
MaximizeBtn.Size = UDim2.new(0, 26, 0, 26)
MaximizeBtn.Position = UDim2.new(1, -60, 0.5, -13)
MaximizeBtn.BackgroundTransparency = 1
MaximizeBtn.Text = ""
MaximizeBtn.AutoButtonColor = false
MaximizeBtn.ZIndex = 10
MaximizeBtn.Parent = TopBar

local MaximizeIcon = Instance.new("ImageLabel")
MaximizeIcon.Name = "Icon"
MaximizeIcon.Size = UDim2.new(0, 16, 0, 16)
MaximizeIcon.AnchorPoint = Vector2.new(0.5, 0.5)
MaximizeIcon.Position = UDim2.fromScale(0.5, 0.5)
MaximizeIcon.BackgroundTransparency = 1
MaximizeIcon.Image = "rbxassetid://85264421376424"
MaximizeIcon.ImageColor3 = Color3.fromRGB(200, 200, 200)
MaximizeIcon.ScaleType = Enum.ScaleType.Fit
MaximizeIcon.ZIndex = 11
MaximizeIcon.Parent = MaximizeBtn

--============================================================
-- CLOSE BUTTON
--============================================================

local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseBtn"
CloseBtn.Size = UDim2.new(0, 26, 0, 26)
CloseBtn.Position = UDim2.new(1, -30, 0.5, -13)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = ""
CloseBtn.AutoButtonColor = false
CloseBtn.ZIndex = 10
CloseBtn.Parent = TopBar

local CloseIcon = Instance.new("ImageLabel")
CloseIcon.Name = "Icon"
CloseIcon.Size = UDim2.new(0, 16, 0, 16)
CloseIcon.AnchorPoint = Vector2.new(0.5, 0.5)
CloseIcon.Position = UDim2.fromScale(0.5, 0.5)
CloseIcon.BackgroundTransparency = 1
CloseIcon.Image = "rbxassetid://85435035697164"
CloseIcon.ImageColor3 = Color3.fromRGB(200, 200, 200)
CloseIcon.ScaleType = Enum.ScaleType.Fit
CloseIcon.ZIndex = 11
CloseIcon.Parent = CloseBtn

--============================================================
-- MINIMIZE BUTTON
--============================================================

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Name = "MinimizeBtn"
MinimizeBtn.Size = UDim2.new(0, 45, 0, 45)
MinimizeBtn.AnchorPoint = Vector2.new(0.5, 0.5)
MinimizeBtn.Position = UDim2.fromScale(0.5, 0.5)
MinimizeBtn.BackgroundColor3 = Colors.Background
MinimizeBtn.BorderSizePixel = 0
MinimizeBtn.Text = "Z"
MinimizeBtn.TextColor3 = Colors.Text
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.TextSize = 26
MinimizeBtn.AutoButtonColor = false
MinimizeBtn.ZIndex = 60
MinimizeBtn.Visible = false
MinimizeBtn.Active = true
MinimizeBtn.Draggable = true
MinimizeBtn.Parent = ScreenGui

local MinimizeStroke = Instance.new("UIStroke")
MinimizeStroke.Color = DefaultBorder
MinimizeStroke.Thickness = 1
MinimizeStroke.Parent = MinimizeBtn

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 10)
MinCorner.Parent = MinimizeBtn

local function setUIOpen(open)
    Main.Visible = open
    PopupLayer.Visible = open
    MinimizeBtn.Visible = not open
end

CloseBtn.MouseButton1Click:Connect(function()
    setUIOpen(false)
end)

MinimizeBtn.MouseButton1Click:Connect(function()
    setUIOpen(true)
end)

--============================================================
-- MAXIMIZE / RESTORE
--============================================================

local isMaximized = false

local NORMAL_SIZE = UDim2.new(0, 700, 0, 450)
local NORMAL_POS = UDim2.fromScale(0.5, 0.5)

local MAX_SIZE = UDim2.new(0.94, 0, 0.90, 0)
local MAX_POS = UDim2.fromScale(0.5, 0.5)

MaximizeBtn.MouseButton1Click:Connect(function()
    isMaximized = not isMaximized

    local targetSize
    local targetPos

    if isMaximized then
        targetSize = MAX_SIZE
        targetPos = MAX_POS
    else
        targetSize = NORMAL_SIZE
        targetPos = NORMAL_POS
    end

    TweenService:Create(
        Main,
        TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {
            Size = targetSize,
            Position = targetPos
        }
    ):Play()
end)

--============================================================
-- FPS COUNTER
--============================================================

local frameCount = 0
local lastTime = os.clock()

RunService.RenderStepped:Connect(function()
    frameCount += 1

    local now = os.clock()
    if now - lastTime >= 1 then
        fpsText.Text = tostring(frameCount)
        frameCount = 0
        lastTime = now
    end
end)

--============================================================
-- TOP DIVIDER
--============================================================

local TopDivider = Instance.new("Frame")
TopDivider.Name = "TopDivider"
TopDivider.Size = UDim2.new(1, 0, 0, 1)
TopDivider.Position = UDim2.new(0, 0, 0, 40)
TopDivider.BackgroundColor3 = DefaultBorder
TopDivider.BorderSizePixel = 0
TopDivider.Parent = Main

--============================================================
-- SIDEBAR
--============================================================

local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 140, 1, -41)
Sidebar.Position = UDim2.new(0, 0, 0, 41)
Sidebar.BackgroundColor3 = Colors.Sidebar
Sidebar.BorderSizePixel = 0
Sidebar.ClipsDescendants = true
Sidebar.Parent = Main

local SidebarPad = Instance.new("UIPadding")
SidebarPad.PaddingTop = UDim.new(0, 10)
SidebarPad.PaddingLeft = UDim.new(0, 8)
SidebarPad.PaddingRight = UDim.new(0, 8)
SidebarPad.PaddingBottom = UDim.new(0, 8)
SidebarPad.Parent = Sidebar

--============================================================
-- SEARCH BAR
--============================================================

local SearchContainer = Instance.new("Frame")
SearchContainer.Name = "SearchContainer"
SearchContainer.Size = UDim2.new(1, 0, 0, 30)
SearchContainer.Position = UDim2.new(0, 0, 0, 0)
SearchContainer.BackgroundColor3 = Colors.Slot
SearchContainer.BorderSizePixel = 0
SearchContainer.Parent = Sidebar

local SearchCorner = Instance.new("UICorner")
SearchCorner.CornerRadius = UDim.new(0, 6)
SearchCorner.Parent = SearchContainer

local SearchStroke = Instance.new("UIStroke")
SearchStroke.Color = DefaultBorder
SearchStroke.Thickness = 1
SearchStroke.Parent = SearchContainer

registerBorder(MainStroke)
registerBorder(MinimizeStroke)
registerBorder(SearchStroke)

local SearchIcon = Instance.new("ImageLabel")
SearchIcon.Name = "SearchIcon"
SearchIcon.Size = UDim2.new(0, 13, 0, 13)
SearchIcon.Position = UDim2.new(0, 7, 0.5, -6)
SearchIcon.BackgroundTransparency = 1
SearchIcon.Image = "rbxassetid://91301384227473"
SearchIcon.ImageColor3 = Colors.SubText
SearchIcon.ScaleType = Enum.ScaleType.Fit
SearchIcon.Parent = SearchContainer

local SearchBox = Instance.new("TextBox")
SearchBox.Name = "SearchBox"
SearchBox.Size = UDim2.new(1, -30, 1, 0)
SearchBox.Position = UDim2.new(0, 27, 0, 0)
SearchBox.BackgroundTransparency = 1
SearchBox.Text = ""
SearchBox.PlaceholderText = "Search..."
SearchBox.PlaceholderColor3 = Colors.SubText
SearchBox.TextColor3 = Colors.Text
SearchBox.Font = Enum.Font.Gotham
SearchBox.TextSize = 10
SearchBox.TextXAlignment = Enum.TextXAlignment.Left
SearchBox.ClearTextOnFocus = false
SearchBox.Parent = SearchContainer

--============================================================
-- SIDEBAR BUTTON CONTAINER
--============================================================

local SidebarButtonContainer = Instance.new("ScrollingFrame")
SidebarButtonContainer.Name = "ButtonContainer"
SidebarButtonContainer.Size = UDim2.new(1, 0, 1, -86)
SidebarButtonContainer.Position = UDim2.new(0, 0, 0, 38)
SidebarButtonContainer.BackgroundTransparency = 1
SidebarButtonContainer.BorderSizePixel = 0
SidebarButtonContainer.ScrollBarThickness = 2
SidebarButtonContainer.ScrollBarImageColor3 = Colors.Stroke
SidebarButtonContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
SidebarButtonContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y
SidebarButtonContainer.ScrollingDirection = Enum.ScrollingDirection.Y
SidebarButtonContainer.ClipsDescendants = true
SidebarButtonContainer.Parent = Sidebar

local SidebarList = Instance.new("UIListLayout")
SidebarList.SortOrder = Enum.SortOrder.LayoutOrder
SidebarList.Padding = UDim.new(0, 4)
SidebarList.Parent = SidebarButtonContainer

local SidebarDivider = Instance.new("Frame")
SidebarDivider.Name = "SidebarDivider"
SidebarDivider.Size = UDim2.new(0, 1, 1, -41)
SidebarDivider.Position = UDim2.new(0, 140, 0, 41)
SidebarDivider.BackgroundColor3 = DefaultBorder
SidebarDivider.BorderSizePixel = 0
SidebarDivider.Parent = Main

--============================================================
-- CONTENT FRAME
-- Perbaikan utama: area konten dibatasi oleh Main
--============================================================

local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Size = UDim2.new(1, -141, 1, -41)
Content.Position = UDim2.new(0, 141, 0, 41)
Content.BackgroundColor3 = Colors.Panel
Content.BorderSizePixel = 0
Content.ClipsDescendants = true
Content.Parent = Main

local Scroll = Instance.new("ScrollingFrame")
Scroll.Name = "Scroll"
Scroll.Size = UDim2.new(1, -16, 1, -16)
Scroll.Position = UDim2.new(0, 8, 0, 8)
Scroll.BackgroundTransparency = 1
Scroll.BorderSizePixel = 0
Scroll.ScrollBarThickness = 4
Scroll.ScrollBarImageColor3 = Colors.Stroke
Scroll.CanvasPosition = Vector2.zero
Scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
Scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
Scroll.ScrollingDirection = Enum.ScrollingDirection.Y
Scroll.ClipsDescendants = true
Scroll.Parent = Content

local ScrollPad = Instance.new("UIPadding")
ScrollPad.PaddingLeft = UDim.new(0, 2)
ScrollPad.PaddingRight = UDim.new(0, 6)
ScrollPad.PaddingTop = UDim.new(0, 2)
ScrollPad.PaddingBottom = UDim.new(0, 4)
ScrollPad.Parent = Scroll

local ScrollList = Instance.new("UIListLayout")
ScrollList.SortOrder = Enum.SortOrder.LayoutOrder
ScrollList.Padding = UDim.new(0, 8)
ScrollList.Parent = Scroll

--============================================================
-- SIDEBAR BUTTON SYSTEM
--============================================================

local sidebarButtons = {}
local activeTab = nil

local function createSidebarButton(text, order, onClick)
    local btn = Instance.new("TextButton")
    btn.Name = text
    btn.Size = UDim2.new(1, -2, 0, 30)
    btn.BackgroundColor3 = Colors.Sidebar
    btn.BackgroundTransparency = 1
    btn.BorderSizePixel = 0
    btn.Text = ""
    btn.AutoButtonColor = false
    btn.LayoutOrder = order
    btn.Parent = SidebarButtonContainer

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn

    local label = Instance.new("TextLabel")
    label.Name = "Label"
    label.Size = UDim2.new(1, -16, 1, 0)
    label.Position = UDim2.new(0, 8, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Colors.SubText
    label.Font = Enum.Font.GothamMedium
    label.TextSize = 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = btn

    btn.MouseEnter:Connect(function()
        if activeTab ~= btn then
            TweenService:Create(btn, TweenInfo.new(0.15), {
                BackgroundTransparency = 0.5,
                BackgroundColor3 = Colors.SlotHover
            }):Play()

            TweenService:Create(label, TweenInfo.new(0.15), {
                TextColor3 = Colors.Text
            }):Play()
        end
    end)

    btn.MouseLeave:Connect(function()
        if activeTab ~= btn then
            TweenService:Create(btn, TweenInfo.new(0.15), {
                BackgroundTransparency = 1
            }):Play()

            TweenService:Create(label, TweenInfo.new(0.15), {
                TextColor3 = Colors.SubText
            }):Play()
        end
    end)

    btn.MouseButton1Click:Connect(function()
        for _, other in ipairs(sidebarButtons) do
            other.BackgroundTransparency = 1

            local otherLabel = other:FindFirstChild("Label")
            if otherLabel then
                otherLabel.TextColor3 = Colors.SubText
            end
        end

        activeTab = btn
        btn.BackgroundTransparency = 0.5
        btn.BackgroundColor3 = Colors.SlotHover
        label.TextColor3 = Colors.Text

        if onClick then
            onClick()
        end
    end)

    table.insert(sidebarButtons, btn)
    return btn
end

--============================================================
-- CONTENT CLEAR
--============================================================

local function clearContent()
    for _, child in ipairs(Scroll:GetChildren()) do
        if not child:IsA("UIListLayout")
            and not child:IsA("UIPadding") then
            child:Destroy()
        end
    end

    for _, child in ipairs(PopupLayer:GetChildren()) do
        if child.Name:find("Popup_") then
            child.Visible = false
        end
    end
end

--============================================================
-- SEARCH FILTER
--============================================================

SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
    local query = SearchBox.Text:lower()

    for _, btn in ipairs(SidebarButtonContainer:GetChildren()) do
        if btn:IsA("TextButton") then
            local label = btn:FindFirstChild("Label")

            if label then
                btn.Visible = query == ""
                    or label.Text:lower():find(query, 1, true) ~= nil
            end
        end
    end
end)

--============================================================
-- PART 2 SELESAI
-- PART 3 dimulai dari Discord Pill dan fungsi tema.
--============================================================

--============================================================
-- ZORX HUB - PART 3/5
-- DISCORD, THEME SYSTEM, RAINBOW
--============================================================

--============================================================
-- DISCORD CARD SIDEBAR
--============================================================

local DiscordPill = Instance.new("TextButton")
DiscordPill.Name = "DiscordPill"
DiscordPill.Size = UDim2.new(1, -16, 0, 42)
DiscordPill.AnchorPoint = Vector2.new(0.5, 1)
DiscordPill.Position = UDim2.new(0.5, 0, 1, -8)
DiscordPill.BackgroundColor3 = DefaultPillBg
DiscordPill.BorderSizePixel = 0
DiscordPill.Text = ""
DiscordPill.AutoButtonColor = false
DiscordPill.ZIndex = 5
DiscordPill.Parent = Sidebar

local dpCorner = Instance.new("UICorner")
dpCorner.CornerRadius = UDim.new(0, 6)
dpCorner.Parent = DiscordPill

local dpStroke = Instance.new("UIStroke")
dpStroke.Color = DefaultPillStroke
dpStroke.Thickness = 1
dpStroke.Parent = DiscordPill

local DiscordIcon = Instance.new("ImageLabel")
DiscordIcon.Name = "DiscordIcon"
DiscordIcon.Size = UDim2.new(0, 18, 0, 18)
DiscordIcon.Position = UDim2.new(0, 7, 0.5, -9)
DiscordIcon.BackgroundTransparency = 1
DiscordIcon.Image = "rbxassetid://98671378613860"
DiscordIcon.ScaleType = Enum.ScaleType.Fit
DiscordIcon.Parent = DiscordPill

local DiscordTitle = Instance.new("TextLabel")
DiscordTitle.Name = "DiscordTitle"
DiscordTitle.Size = UDim2.new(1, -34, 0, 14)
DiscordTitle.Position = UDim2.new(0, 31, 0, 6)
DiscordTitle.BackgroundTransparency = 1
DiscordTitle.Text = "Discord"
DiscordTitle.TextColor3 = DefaultPillText
DiscordTitle.Font = Enum.Font.GothamBold
DiscordTitle.TextSize = 10
DiscordTitle.TextXAlignment = Enum.TextXAlignment.Left
DiscordTitle.TextTruncate = Enum.TextTruncate.AtEnd
DiscordTitle.Parent = DiscordPill

local DiscordLink = Instance.new("TextLabel")
DiscordLink.Name = "DiscordLink"
DiscordLink.Size = UDim2.new(1, -34, 0, 12)
DiscordLink.Position = UDim2.new(0, 31, 0, 22)
DiscordLink.BackgroundTransparency = 1
DiscordLink.Text = "discord.gg/3MrpqYycs"
DiscordLink.TextColor3 = Colors.SubText
DiscordLink.Font = Enum.Font.Gotham
DiscordLink.TextSize = 8
DiscordLink.TextXAlignment = Enum.TextXAlignment.Left
DiscordLink.TextTruncate = Enum.TextTruncate.AtEnd
DiscordLink.Parent = DiscordPill

table.insert(allPills, DiscordPill)
table.insert(allPillStrokes, dpStroke)
table.insert(allPillTexts, DiscordTitle)

DiscordPill.MouseEnter:Connect(function()
    if not RainbowActive then
        TweenService:Create(DiscordPill, TweenInfo.new(0.15), {
            BackgroundColor3 = Colors.SlotHover
        }):Play()
    end
end)

DiscordPill.MouseLeave:Connect(function()
    if not RainbowActive then
        local theme = ThemeColors[ActiveTheme]
        if theme then
            TweenService:Create(DiscordPill, TweenInfo.new(0.15), {
                BackgroundColor3 = theme.bg
            }):Play()
        end
    end
end)

local DISCORD_URL = "https://discord.gg/3MrpqYycs"

local function copyDiscordInvite()
    local copied = false

    pcall(function()
        if setclipboard then
            setclipboard(DISCORD_URL)
            copied = true
        elseif toclipboard then
            toclipboard(DISCORD_URL)
            copied = true
        end
    end)

    DiscordTitle.Text = copied and "Invite Copied!" or "Discord Invite"
    task.delay(2, function()
        if DiscordTitle and DiscordTitle.Parent then
            DiscordTitle.Text = "Discord"
        end
    end)
end

DiscordPill.MouseButton1Click:Connect(copyDiscordInvite)

--============================================================
-- APPLY THEME
--============================================================

local function applyPillTheme(themeName)
    local theme = ThemeColors[themeName]
    if not theme then
        return
    end

    ActiveTheme = themeName
    RainbowActive = themeName == "Rainbow"

    if RainbowActive then
        return
    end

    local tweenInfo = TweenInfo.new(0.2)

    for _, pill in ipairs(allPills) do
        if pill and pill.Parent then
            TweenService:Create(pill, tweenInfo, {
                BackgroundColor3 = theme.bg
            }):Play()
        end
    end

    for _, stroke in ipairs(allPillStrokes) do
        if stroke and stroke.Parent then
            TweenService:Create(stroke, tweenInfo, {
                Color = theme.stroke
            }):Play()
        end
    end

    for _, txt in ipairs(allPillTexts) do
        if txt and txt.Parent then
            TweenService:Create(txt, tweenInfo, {
                TextColor3 = theme.text
            }):Play()
        end
    end

    if DiscordLink and DiscordLink.Parent then
        DiscordLink.TextColor3 = theme.text
    end

    for _, border in ipairs(allBorders) do
        if border and border.Parent then
            TweenService:Create(border, tweenInfo, {
                Color = theme.border
            }):Play()
        end
    end

    TopDivider.BackgroundColor3 = theme.border
    SidebarDivider.BackgroundColor3 = theme.border

    for _, border in ipairs(infoLogoBorders) do
        if border and border.Parent then
            border.Color = theme.infoLogo or theme.border
        end
    end
end

--============================================================
-- RAINBOW LOOP
--============================================================

RunService.Heartbeat:Connect(function()
    if not RainbowActive then
        return
    end

    RainbowHue = (RainbowHue + 0.005) % 1

    local rainbowColor = Color3.fromHSV(RainbowHue, 0.8, 1)
    local rainbowDark = Color3.fromHSV(RainbowHue, 0.8, 0.4)
    local rainbowText = Color3.fromHSV(RainbowHue, 0.3, 1)

    for _, pill in ipairs(allPills) do
        if pill and pill.Parent then
            pill.BackgroundColor3 = rainbowDark
        end
    end

    for _, stroke in ipairs(allPillStrokes) do
        if stroke and stroke.Parent then
            stroke.Color = rainbowColor
        end
    end

    for _, txt in ipairs(allPillTexts) do
        if txt and txt.Parent then
            txt.TextColor3 = rainbowText
        end
    end

    if DiscordLink and DiscordLink.Parent then
        DiscordLink.TextColor3 = rainbowText
    end

    for _, border in ipairs(allBorders) do
        if border and border.Parent then
            border.Color = rainbowColor
        end
    end

    for _, border in ipairs(infoLogoBorders) do
        if border and border.Parent then
            border.Color = rainbowColor
        end
    end

    TopDivider.BackgroundColor3 = rainbowColor
    SidebarDivider.BackgroundColor3 = rainbowColor
end)

--============================================================
-- HELPER CARD
--============================================================

local function createCard(name, height, order)
    local card = Instance.new("Frame")
    card.Name = name
    card.Size = UDim2.new(1, 0, 0, height)
    card.BackgroundColor3 = Color3.fromRGB(28, 28, 36)
    card.BorderSizePixel = 0
    card.LayoutOrder = order or 1
    card.ClipsDescendants = true
    card.Parent = Scroll

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = card

    local stroke = Instance.new("UIStroke")
    stroke.Color = ThemeColors[ActiveTheme].border
    stroke.Thickness = 1
    stroke.Parent = card
    registerBorder(stroke)

    return card
end

local function createLabel(parent, name, text, position, size, textSize, color)
    local label = Instance.new("TextLabel")
    label.Name = name
    label.Position = position
    label.Size = size
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = color or Colors.Text
    label.Font = Enum.Font.Gotham
    label.TextSize = textSize or 11
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextYAlignment = Enum.TextYAlignment.Center
    label.TextWrapped = true
    label.Parent = parent

    return label
end

--============================================================
-- PART 3 SELESAI
-- PART 4: HOME, INFO, SETTINGS DAN DROPDOWN
--============================================================

--============================================================
-- ZORX HUB - PART 4/5
-- HOME, INFO, SETTINGS, COLOR DROPDOWN
--============================================================

--============================================================
-- HOME PANEL
--============================================================

local function loadHomePanel()
    clearContent()

    local welcomeCard = createCard("WelcomeCard", 108, 1)

    createLabel(
        welcomeCard,
        "WelcomeTitle",
        "Welcome to Zorx",
        UDim2.new(0, 14, 0, 10),
        UDim2.new(1, -28, 0, 22),
        14,
        Colors.Text
    ).Font = Enum.Font.GothamBold

    local desc = createLabel(
        welcomeCard,
        "WelcomeDescription",
        "Welcome! This hub is designed to keep every feature organized, responsive, and easy to use. Select a tab from the sidebar to get started.",
        UDim2.new(0, 14, 0, 36),
        UDim2.new(1, -28, 0, 60),
        10,
        Color3.fromRGB(170, 170, 190)
    )

    desc.TextYAlignment = Enum.TextYAlignment.Top

    local imageCard = createCard("ImageCard", 180, 2)

    local image = Instance.new("ImageLabel")
    image.Name = "HomeImage"
    image.Size = UDim2.new(1, -12, 1, -12)
    image.Position = UDim2.new(0, 6, 0, 6)
    image.BackgroundTransparency = 1
    image.BorderSizePixel = 0
    image.Image = "rbxassetid://138859759137296"
    image.ScaleType = Enum.ScaleType.Crop
    image.Parent = imageCard

    local imageCorner = Instance.new("UICorner")
    imageCorner.CornerRadius = UDim.new(0, 6)
    imageCorner.Parent = image

    local infoCard = createCard("HomeInfoCard", 72, 3)

    createLabel(
        infoCard,
        "HomeInfoTitle",
        "ZORX HUB",
        UDim2.new(0, 14, 0, 10),
        UDim2.new(1, -28, 0, 18),
        12,
        Colors.Text
    ).Font = Enum.Font.GothamBold

    createLabel(
        infoCard,
        "HomeInfoDescription",
        "Pilih menu di sebelah kiri untuk melihat fitur yang tersedia.",
        UDim2.new(0, 14, 0, 32),
        UDim2.new(1, -28, 0, 30),
        10,
        Colors.SubText
    )
end

--============================================================
-- INFO PANEL
--============================================================

local function loadInfoPanel()
    clearContent()

    local communityCard = createCard("CommunityCard", 178, 1)

    local logoBox = Instance.new("Frame")
    logoBox.Name = "CommunityLogoBox"
    logoBox.Size = UDim2.new(0, 46, 0, 46)
    logoBox.Position = UDim2.new(0, 14, 0, 14)
    logoBox.BackgroundColor3 = Color3.fromRGB(42, 42, 55)
    logoBox.BorderSizePixel = 0
    logoBox.ClipsDescendants = true
    logoBox.Parent = communityCard

    local logoCorner = Instance.new("UICorner")
    logoCorner.CornerRadius = UDim.new(0, 8)
    logoCorner.Parent = logoBox

    local logoStroke = Instance.new("UIStroke")
    logoStroke.Color = ThemeColors[ActiveTheme].infoLogo
    logoStroke.Thickness = 1
    logoStroke.Parent = logoBox
    registerInfoLogoBorder(logoStroke)

    local logoImage = Instance.new("ImageLabel")
    logoImage.Name = "CommunityLogo"
    logoImage.Size = UDim2.new(1, -6, 1, -6)
    logoImage.Position = UDim2.new(0.5, 0, 0.5, 0)
    logoImage.AnchorPoint = Vector2.new(0.5, 0.5)
    logoImage.BackgroundTransparency = 1
    logoImage.Image = "rbxassetid://77776661633653"
    logoImage.ScaleType = Enum.ScaleType.Fit
    logoImage.Parent = logoBox

    createLabel(
        communityCard,
        "CommunityTitle",
        "Zorx Community",
        UDim2.new(0, 72, 0, 13),
        UDim2.new(1, -86, 0, 20),
        12,
        Colors.Text
    ).Font = Enum.Font.GothamBold

    local versionInfo = createLabel(
        communityCard,
        "VersionInfo",
        "- Version: v5.0\n- Last Update: " .. getTodayDate(),
        UDim2.new(0, 72, 0, 35),
        UDim2.new(1, -86, 0, 42),
        10,
        Color3.fromRGB(170, 170, 190)
    )

    versionInfo.TextYAlignment = Enum.TextYAlignment.Top

    local function createInfoButton(name, text, position, callback)
        local button = Instance.new("TextButton")
        button.Name = name
        button.Size = UDim2.new(0.5, -21, 0, 34)
        button.Position = position
        button.BackgroundColor3 = Color3.fromRGB(35, 38, 46)
        button.BorderSizePixel = 0
        button.Text = text
        button.TextColor3 = Colors.Text
        button.Font = Enum.Font.GothamBold
        button.TextSize = 10
        button.TextTruncate = Enum.TextTruncate.AtEnd
        button.AutoButtonColor = true
        button.Parent = communityCard

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 6)
        corner.Parent = button

        local stroke = Instance.new("UIStroke")
        stroke.Color = ThemeColors[ActiveTheme].border
        stroke.Thickness = 1
        stroke.Parent = button
        registerBorder(stroke)

        button.MouseButton1Click:Connect(callback)

        return button
    end

    createInfoButton(
        "CopyDiscordButton",
        "Copy Discord Invite",
        UDim2.new(0, 14, 0, 116),
        function()
            copyDiscordInvite()
        end
    )

    createInfoButton(
        "UpdateInfoButton",
        "Refresh Info",
        UDim2.new(0.5, 7, 0, 116),
        function()
            versionInfo.Text =
                "- Version: v5.0\n- Last Update: " .. getTodayDate()
        end
    )

    local detailsCard = createCard("DetailsCard", 74, 2)

    createLabel(
        detailsCard,
        "DetailsTitle",
        "About",
        UDim2.new(0, 14, 0, 9),
        UDim2.new(1, -28, 0, 18),
        11,
        Colors.Text
    ).Font = Enum.Font.GothamBold

    createLabel(
        detailsCard,
        "DetailsDescription",
        "Zorx Hub interface information and community links.",
        UDim2.new(0, 14, 0, 30),
        UDim2.new(1, -28, 0, 32),
        10,
        Colors.SubText
    )
end

--============================================================
-- SETTINGS PANEL
--============================================================

local function loadSettingsPanel()
    clearContent()

    createLabel(
        Scroll,
        "Header_Colours",
        "APPEARANCE",
        UDim2.new(0, 0, 0, 0),
        UDim2.new(1, 0, 0, 20),
        10,
        Colors.SubText
    ).Font = Enum.Font.GothamBold

    local dropdownRow = createCard("Dropdown_Colours", 58, 2)

    createLabel(
        dropdownRow,
        "ThemeTitle",
        "Warna UI",
        UDim2.new(0, 12, 0, 8),
        UDim2.new(1, -140, 0, 17),
        11,
        Colors.Text
    ).Font = Enum.Font.GothamMedium

    createLabel(
        dropdownRow,
        "ThemeDescription",
        "Ganti warna pill dan border",
        UDim2.new(0, 12, 0, 29),
        UDim2.new(1, -140, 0, 16),
        9,
        Colors.SubText
    )

    local dropBox = Instance.new("TextButton")
    dropBox.Name = "DropBox"
    dropBox.Size = UDim2.new(0, 112, 0, 30)
    dropBox.AnchorPoint = Vector2.new(1, 0.5)
    dropBox.Position = UDim2.new(1, -10, 0.5, 0)
    dropBox.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
    dropBox.BorderSizePixel = 0
    dropBox.Text = ActiveTheme
    dropBox.TextColor3 = Colors.Text
    dropBox.Font = Enum.Font.Gotham
    dropBox.TextSize = 10
    dropBox.TextTruncate = Enum.TextTruncate.AtEnd
    dropBox.AutoButtonColor = true
    dropBox.Parent = dropdownRow

    local dropCorner = Instance.new("UICorner")
    dropCorner.CornerRadius = UDim.new(0, 6)
    dropCorner.Parent = dropBox

    local dropStroke = Instance.new("UIStroke")
    dropStroke.Color = ThemeColors[ActiveTheme].border
    dropStroke.Thickness = 1
    dropStroke.Parent = dropBox
    registerBorder(dropStroke)

    -- Popup berada pada ScreenGui agar tidak terpotong Scroll.
    local popup = Instance.new("Frame")
    popup.Name = "Popup_Colours"
    popup.Size = UDim2.new(0, 150, 0, 0)
    popup.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
    popup.BorderSizePixel = 0
    popup.Visible = false
    popup.ZIndex = 100
    popup.ClipsDescendants = true
    popup.Parent = PopupLayer

    local popupCorner = Instance.new("UICorner")
    popupCorner.CornerRadius = UDim.new(0, 6)
    popupCorner.Parent = popup

    local popupStroke = Instance.new("UIStroke")
    popupStroke.Color = Colors.Stroke
    popupStroke.Thickness = 1
    popupStroke.Parent = popup

    local popupScroll = Instance.new("ScrollingFrame")
    popupScroll.Name = "ThemeScroll"
    popupScroll.Size = UDim2.new(1, 0, 1, 0)
    popupScroll.BackgroundTransparency = 1
    popupScroll.BorderSizePixel = 0
    popupScroll.ScrollBarThickness = 3
    popupScroll.ScrollBarImageColor3 = Colors.Stroke
    popupScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    popupScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    popupScroll.ScrollingDirection = Enum.ScrollingDirection.Y
    popupScroll.ZIndex = 101
    popupScroll.Parent = popup

    local popupPad = Instance.new("UIPadding")
    popupPad.PaddingTop = UDim.new(0, 5)
    popupPad.PaddingBottom = UDim.new(0, 5)
    popupPad.PaddingLeft = UDim.new(0, 5)
    popupPad.PaddingRight = UDim.new(0, 5)
    popupPad.Parent = popupScroll

    local popupList = Instance.new("UIListLayout")
    popupList.SortOrder = Enum.SortOrder.LayoutOrder
    popupList.Padding = UDim.new(0, 3)
    popupList.Parent = popupScroll

    local themeList = {
        "None", "Rainbow", "Biru", "Ungu", "Hijau",
        "Kuning", "Oren", "Merah", "Pink", "Cyan",
        "Putih", "Hitam", "Emas", "Abu", "Lime",
        "Marun", "Navy"
    }

    local isOpen = false
    local popupHeight = 220

    local function positionPopup()
        local camera = workspace.CurrentCamera
        if not camera then
            return
        end

        local viewport = camera.ViewportSize
        local absPos = dropBox.AbsolutePosition
        local absSize = dropBox.AbsoluteSize

        local popupWidth = math.min(150, viewport.X - 16)
        local availableBelow = viewport.Y - (absPos.Y + absSize.Y) - 10
        local availableAbove = absPos.Y - 10

        local showBelow = availableBelow >= 120
        local height = math.min(
            popupHeight,
            math.max(100, showBelow and availableBelow or availableAbove)
        )

        local x = math.clamp(
            absPos.X + absSize.X - popupWidth,
            8,
            math.max(8, viewport.X - popupWidth - 8)
        )

        local y
        if showBelow then
            y = absPos.Y + absSize.Y + 4
        else
            y = math.max(8, absPos.Y - height - 4)
        end

        popup.Position = UDim2.fromOffset(x, y)
        popup.Size = UDim2.fromOffset(popupWidth, height)
    end

    local function closePopup()
        isOpen = false
        popup.Visible = false
    end

    for index, themeName in ipairs(themeList) do
        local themeData = ThemeColors[themeName]

        local item = Instance.new("TextButton")
        item.Name = "Item_" .. themeName
        item.Size = UDim2.new(1, -2, 0, 27)
        item.BackgroundColor3 = Colors.SlotHover
        item.BackgroundTransparency =
            ActiveTheme == themeName and 0.35 or 1
        item.BorderSizePixel = 0
        item.Text = ""
        item.AutoButtonColor = false
        item.LayoutOrder = index
        item.ZIndex = 102
        item.Parent = popupScroll

        local itemCorner = Instance.new("UICorner")
        itemCorner.CornerRadius = UDim.new(0, 4)
        itemCorner.Parent = item

        local dot = Instance.new("Frame")
        dot.Name = "Dot"
        dot.Size = UDim2.new(0, 12, 0, 12)
        dot.Position = UDim2.new(0, 7, 0.5, -6)
        dot.BackgroundColor3 =
            themeName == "Rainbow"
            and Color3.fromRGB(180, 90, 255)
            or themeData.stroke
        dot.BorderSizePixel = 0
        dot.ZIndex = 103
        dot.Parent = item

        local dotCorner = Instance.new("UICorner")
        dotCorner.CornerRadius = UDim.new(1, 0)
        dotCorner.Parent = dot

        local itemText = Instance.new("TextLabel")
        itemText.Name = "ThemeName"
        itemText.Size = UDim2.new(1, -32, 1, 0)
        itemText.Position = UDim2.new(0, 27, 0, 0)
        itemText.BackgroundTransparency = 1
        itemText.Text = themeName
        itemText.TextColor3 = Colors.Text
        itemText.Font = Enum.Font.Gotham
        itemText.TextSize = 10
        itemText.TextXAlignment = Enum.TextXAlignment.Left
        itemText.ZIndex = 103
        itemText.Parent = item

        item.MouseEnter:Connect(function()
            item.BackgroundTransparency = 0.35
        end)

        item.MouseLeave:Connect(function()
            item.BackgroundTransparency =
                ActiveTheme == themeName and 0.35 or 1
        end)

        item.MouseButton1Click:Connect(function()
            applyPillTheme(themeName)
            dropBox.Text = themeName
            dropStroke.Color = ThemeColors[themeName].border

            closePopup()
        end)
    end

    dropBox.MouseButton1Click:Connect(function()
        isOpen = not isOpen

        if isOpen then
            positionPopup()
            popup.Visible = true
        else
            closePopup()
        end
    end)

    -- Tutup dropdown ketika pengguna mengetuk area lain.
    UserInputService.InputBegan:Connect(function(input)
        if not isOpen then
            return
        end

        if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then

            task.defer(function()
                if not isOpen then
                    return
                end

                local mousePos = UserInputService:GetMouseLocation()
                local pPos = popup.AbsolutePosition
                local pSize = popup.AbsoluteSize
                local dPos = dropBox.AbsolutePosition
                local dSize = dropBox.AbsoluteSize

                local inPopup =
                    mousePos.X >= pPos.X
                    and mousePos.X <= pPos.X + pSize.X
                    and mousePos.Y >= pPos.Y
                    and mousePos.Y <= pPos.Y + pSize.Y

                local inButton =
                    mousePos.X >= dPos.X
                    and mousePos.X <= dPos.X + dSize.X
                    and mousePos.Y >= dPos.Y
                    and mousePos.Y <= dPos.Y + dSize.Y

                if not inPopup and not inButton then
                    closePopup()
                end
            end)
        end
    end)

    -- Perbarui posisi popup jika ukuran layar berubah.
    if workspace.CurrentCamera then
        workspace.CurrentCamera:GetPropertyChangedSignal(
            "ViewportSize"
        ):Connect(function()
            if isOpen then
                positionPopup()
            end
        end)
    end
end

--============================================================
-- PART 4 SELESAI
-- PART 5: TAB, SEARCH, INITIAL HOME, FINAL
--============================================================

--============================================================
-- ZORX HUB - PART 5/5
-- NAVIGATION, SEARCH, INITIALIZATION
--============================================================

--============================================================
-- PLACEHOLDER PANEL UNTUK FARM DAN MISC
-- Bisa diisi fitur asli kamu nanti.
--============================================================

local function loadPlaceholderPanel(titleText, descriptionText)
    clearContent()

    local card = createCard("FeatureCard", 100, 1)

    createLabel(
        card,
        "FeatureTitle",
        titleText,
        UDim2.new(0, 14, 0, 14),
        UDim2.new(1, -28, 0, 22),
        13,
        Colors.Text
    ).Font = Enum.Font.GothamBold

    createLabel(
        card,
        "FeatureDescription",
        descriptionText,
        UDim2.new(0, 14, 0, 42),
        UDim2.new(1, -28, 0, 45),
        10,
        Colors.SubText
    )
end

--============================================================
-- CREATE ALL SIDEBAR TABS
--============================================================

createSidebarButton("Home", 1, function()
    loadHomePanel()
end)

createSidebarButton("Farm", 2, function()
    loadPlaceholderPanel(
        "Farm",
        "Area fitur Farm. Tambahkan fitur Farm kamu di bagian ini."
    )
end)

createSidebarButton("Misc", 3, function()
    loadPlaceholderPanel(
        "Miscellaneous",
        "Area fitur Misc. Tambahkan fitur tambahan kamu di bagian ini."
    )
end)

createSidebarButton("Settings", 4, function()
    loadSettingsPanel()
end)

createSidebarButton("Info", 5, function()
    loadInfoPanel()
end)

--============================================================
-- SEARCH SIDEBAR DAN ISI PANEL
--============================================================

local function filterContent(query)
    query = string.lower(query)

    for _, child in ipairs(Scroll:GetChildren()) do
        if child:IsA("Frame") or child:IsA("TextLabel") then
            local found = false

            if query == "" then
                found = true
            else
                if child:IsA("TextLabel")
                    and string.find(
                        string.lower(child.Text),
                        query,
                        1,
                        true
                    ) then
                    found = true
                end

                for _, descendant in ipairs(child:GetDescendants()) do
                    if descendant:IsA("TextLabel")
                        and string.find(
                            string.lower(descendant.Text),
                            query,
                            1,
                            true
                        ) then
                        found = true
                        break
                    end
                end
            end

            child.Visible = found
        end
    end
end

SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
    local query = string.lower(SearchBox.Text)

    for _, btn in ipairs(SidebarButtonContainer:GetChildren()) do
        if btn:IsA("TextButton") then
            local label = btn:FindFirstChild("Label")

            if label then
                btn.Visible =
                    query == ""
                    or string.find(
                        string.lower(label.Text),
                        query,
                        1,
                        true
                    ) ~= nil
            end
        end
    end

    filterContent(query)
end)

--============================================================
-- INITIAL HOME TAB
--============================================================

task.defer(function()
    if not ScreenGui.Parent then
        return
    end

    activeTab = sidebarButtons[1]

    for _, btn in ipairs(sidebarButtons) do
        local label = btn:FindFirstChild("Label")

        btn.BackgroundTransparency = 1

        if label then
            label.TextColor3 = Colors.SubText
        end
    end

    if activeTab then
        activeTab.BackgroundTransparency = 0.5
        activeTab.BackgroundColor3 = Colors.SlotHover

        local label = activeTab:FindFirstChild("Label")
        if label then
            label.TextColor3 = Colors.Text
        end
    end

    loadHomePanel()
end)


--============================================================
-- RESPONSIVE FRAME - UKURAN NORMAL 700 x 450
--============================================================

local function updateMainSize()
    local camera = workspace.CurrentCamera
    if not camera then return end

    if isMaximized then
        return
    end

    local viewport = camera.ViewportSize

    local width = math.min(700, viewport.X * 0.90)
    local height = math.min(450, viewport.Y * 0.85)

    width = math.max(340, width)
    height = math.max(280, height)

    Main.Size = UDim2.fromOffset(width, height)
    Main.Position = UDim2.fromScale(0.5, 0.5)
end

updateMainSize()

if workspace.CurrentCamera then
    workspace.CurrentCamera:GetPropertyChangedSignal(
        "ViewportSize"
    ):Connect(updateMainSize)
end

--============================================================
-- FINAL
--============================================================

print("ZORX HUB - FIX TOTAL UI LOADED!")
print("Home, Farm, Misc, Settings, Info ready.")
