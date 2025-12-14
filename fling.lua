-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Player = Players.LocalPlayer
-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MetrixHubGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 100 -- High display order to overlay other GUIs
ScreenGui.IgnoreGuiInset = true -- Full screen if needed
ScreenGui.Parent = game:GetService("CoreGui")
--============================---
-- HIDE / SHOW BUTTON
--============================---
local ToggleUI = Instance.new("TextButton")
ToggleUI.Parent = ScreenGui
ToggleUI.Size = UDim2.new(0, 18, 0, 18) -- 40% smaller
ToggleUI.Position = UDim2.new(0, 15, 0, 15)
ToggleUI.BackgroundColor3 = Color3.fromRGB(30,30,30)
ToggleUI.BackgroundTransparency = 0.95 -- More transparent
ToggleUI.Text = ""
ToggleUI.BorderSizePixel = 0
ToggleUI.Active = true
ToggleUI.Draggable = true
-- Add rounded corners to ToggleUI
local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 7) -- Scaled
ToggleCorner.Parent = ToggleUI
-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 192, 0, 270) -- 40% smaller
MainFrame.Position = UDim2.new(0.5, -96, 0.5, -135)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BackgroundTransparency = 0.9 -- More transparent
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui
-- Add rounded corners to MainFrame
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10) -- Scaled
MainCorner.Parent = MainFrame
-- Toggle Logic
local Hidden = false
local function ToggleVisibility()
    Hidden = not Hidden
    MainFrame.Visible = not Hidden
end
ToggleUI.MouseButton1Click:Connect(ToggleVisibility)
-- End key for PC
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.End then
        ToggleVisibility()
    end
end)
-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Size = UDim2.new(1, 0, 0, 24) -- 40% smaller
TitleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
TitleBar.BackgroundTransparency = 0.8 -- More transparent
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame
-- Add rounded corners to TitleBar
local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10) -- Scaled
TitleCorner.Parent = TitleBar
-- Title
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -48, 1, 0) -- Adjusted for smaller
Title.BackgroundTransparency = 1
Title.Text = "MetrixHub"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 12 -- 40% smaller
Title.Parent = TitleBar
-- Close Button
local CloseButton = Instance.new("TextButton")
CloseButton.Position = UDim2.new(1, -48, 0, 3) -- Scaled
CloseButton.Size = UDim2.new(0, 42, 0, 18) -- 40% smaller
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
CloseButton.BackgroundTransparency = 0.8 -- More transparent
CloseButton.BorderSizePixel = 0
CloseButton.Text = "Destroy"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamSemibold
CloseButton.TextSize = 10 -- 40% smaller
CloseButton.Parent = TitleBar
-- Add rounded corners to CloseButton
local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 5) -- Scaled
CloseCorner.Parent = CloseButton
-- Status Label
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Position = UDim2.new(0, 9, 0, 30) -- Scaled
StatusLabel.Size = UDim2.new(1, -18, 0, 18) -- 40% smaller
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Select targets to fling"
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 11 -- 40% smaller
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.Parent = MainFrame
-- Search Box
local SearchBox = Instance.new("TextBox")
SearchBox.Position = UDim2.new(0, 9, 0, 54) -- Scaled
SearchBox.Size = UDim2.new(1, -18, 0, 18) -- 40% smaller
SearchBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SearchBox.BackgroundTransparency = 0.9 -- More transparent
SearchBox.BorderSizePixel = 0
SearchBox.PlaceholderText = "Search users..."
SearchBox.Text = ""
SearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SearchBox.Font = Enum.Font.Gotham
SearchBox.TextSize = 10 -- 40% smaller
SearchBox.Parent = MainFrame
-- Add rounded corners to SearchBox
local SearchCorner = Instance.new("UICorner")
SearchCorner.CornerRadius = UDim.new(0, 5) -- Scaled
SearchCorner.Parent = SearchBox
-- Player Selection Frame
local SelectionFrame = Instance.new("Frame")
SelectionFrame.Position = UDim2.new(0, 9, 0, 78) -- Scaled
SelectionFrame.Size = UDim2.new(1, -18, 0, 108) -- 40% smaller
SelectionFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SelectionFrame.BackgroundTransparency = 0.9 -- More transparent
SelectionFrame.BorderSizePixel = 0
SelectionFrame.Parent = MainFrame
-- Add rounded corners to SelectionFrame
local SelectionCorner = Instance.new("UICorner")
SelectionCorner.CornerRadius = UDim.new(0, 7) -- Scaled
SelectionCorner.Parent = SelectionFrame
-- Player List ScrollFrame
local PlayerScrollFrame = Instance.new("ScrollingFrame")
PlayerScrollFrame.Position = UDim2.new(0, 6, 0, 6) -- Scaled
PlayerScrollFrame.Size = UDim2.new(1, -12, 1, -12) -- Scaled
PlayerScrollFrame.BackgroundTransparency = 1
PlayerScrollFrame.BorderSizePixel = 0
PlayerScrollFrame.ScrollBarThickness = 2 -- Scaled
PlayerScrollFrame.ScrollBarImageTransparency = 0.5
PlayerScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
PlayerScrollFrame.Parent = SelectionFrame
-- UIListLayout for organized player list
local ListLayout = Instance.new("UIListLayout")
ListLayout.Parent = PlayerScrollFrame
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
ListLayout.Padding = UDim.new(0, 5) -- Scaled
-- Touch Fling Toggle Button
local TouchToggle = Instance.new("TextButton")
TouchToggle.Position = UDim2.new(0, 9, 0, 192) -- Scaled
TouchToggle.Size = UDim2.new(1, -18, 0, 24) -- 40% smaller
TouchToggle.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
TouchToggle.BackgroundTransparency = 0.8 -- More transparent
TouchToggle.BorderSizePixel = 0
TouchToggle.Text = "Touch Fling: OFF"
TouchToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
TouchToggle.Font = Enum.Font.GothamBold
TouchToggle.TextSize = 11 -- 40% smaller
TouchToggle.Parent = MainFrame
-- Add rounded corners to TouchToggle
local TouchCorner = Instance.new("UICorner")
TouchCorner.CornerRadius = UDim.new(0, 6) -- Scaled
TouchCorner.Parent = TouchToggle
-- Start Button
local StartButton = Instance.new("TextButton")
StartButton.Position = UDim2.new(0, 9, 0, 219) -- Scaled
StartButton.Size = UDim2.new(0.48, 0, 0, 24) -- 40% smaller
StartButton.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
StartButton.BackgroundTransparency = 0.8 -- More transparent
StartButton.BorderSizePixel = 0
StartButton.Text = "START FLING"
StartButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StartButton.Font = Enum.Font.GothamBold
StartButton.TextSize = 11 -- 40% smaller
StartButton.Parent = MainFrame
-- Add rounded corners to StartButton
local StartCorner = Instance.new("UICorner")
StartCorner.CornerRadius = UDim.new(0, 6) -- Scaled
StartCorner.Parent = StartButton
-- Stop Button
local StopButton = Instance.new("TextButton")
StopButton.Position = UDim2.new(0.52, 0, 0, 219) -- Scaled
StopButton.Size = UDim2.new(0.48, 0, 0, 24) -- 40% smaller
StopButton.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
StopButton.BackgroundTransparency = 0.8 -- More transparent
StopButton.BorderSizePixel = 0
StopButton.Text = "STOP FLING"
StopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StopButton.Font = Enum.Font.GothamBold
StopButton.TextSize = 11 -- 40% smaller
StopButton.Parent = MainFrame
-- Add rounded corners to StopButton
local StopCorner = Instance.new("UICorner")
StopCorner.CornerRadius = UDim.new(0, 6) -- Scaled
StopCorner.Parent = StopButton
-- Select All / Deselect All Buttons
local SelectAllButton = Instance.new("TextButton")
SelectAllButton.Position = UDim2.new(0, 9, 0, 246) -- Scaled
SelectAllButton.Size = UDim2.new(0.48, 0, 0, 18) -- 40% smaller
SelectAllButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
SelectAllButton.BackgroundTransparency = 0.8 -- More transparent
SelectAllButton.BorderSizePixel = 0
SelectAllButton.Text = "SELECT ALL"
SelectAllButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SelectAllButton.Font = Enum.Font.GothamSemibold
SelectAllButton.TextSize = 8 -- 40% smaller
SelectAllButton.Parent = MainFrame
-- Add rounded corners to SelectAllButton
local SelectAllCorner = Instance.new("UICorner")
SelectAllCorner.CornerRadius = UDim.new(0, 5) -- Scaled
SelectAllCorner.Parent = SelectAllButton
local DeselectAllButton = Instance.new("TextButton")
DeselectAllButton.Position = UDim2.new(0.52, 0, 0, 246) -- Scaled
DeselectAllButton.Size = UDim2.new(0.48, 0, 0, 18) -- 40% smaller
DeselectAllButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
DeselectAllButton.BackgroundTransparency = 0.8 -- More transparent
DeselectAllButton.BorderSizePixel = 0
DeselectAllButton.Text = "DESELECT ALL"
DeselectAllButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DeselectAllButton.Font = Enum.Font.GothamSemibold
DeselectAllButton.TextSize = 8 -- 40% smaller
DeselectAllButton.Parent = MainFrame
-- Add rounded corners to DeselectAllButton
local DeselectAllCorner = Instance.new("UICorner")
DeselectAllCorner.CornerRadius = UDim.new(0, 5) -- Scaled
DeselectAllCorner.Parent = DeselectAllButton
-- Variables
local SelectedTargets = {}
local PlayerCheckboxes = {}
local FlingActive = false
local TouchMode = false
local hiddenfling = false
local FlingConnection = nil
getgenv().OldPos = nil
getgenv().FPDH = workspace.FallenPartsDestroyHeight
-- Function to update player list
local function RefreshPlayerList(filter)
    filter = filter or ""
    -- Clear existing entries
    for _, child in pairs(PlayerScrollFrame:GetChildren()) do
        if child:IsA("Frame") then
            child:Destroy()
        end
    end
    PlayerCheckboxes = {}
    -- Get players and sort
    local PlayerList = Players:GetPlayers()
    table.sort(PlayerList, function(a,b)
        return a.Name:lower() < b.Name:lower()
    end)
    -- Create entries
    for _, player in ipairs(PlayerList) do
        if player ~= Player then
            local searchName = player.Name:lower()
            local searchDisplay = player.DisplayName:lower()
            if searchName:find(filter) or searchDisplay:find(filter) then
                local PlayerEntry = Instance.new("Frame")
                PlayerEntry.Size = UDim2.new(1, 0, 0, 21) -- 40% smaller
                PlayerEntry.BackgroundColor3 = Color3.fromRGB(50,50,50)
                PlayerEntry.BackgroundTransparency = 0.9 -- More transparent
                PlayerEntry.BorderSizePixel = 0
                PlayerEntry.Parent = PlayerScrollFrame
                -- Add rounded corners to PlayerEntry
                local EntryCorner = Instance.new("UICorner")
                EntryCorner.CornerRadius = UDim.new(0, 5) -- Scaled
                EntryCorner.Parent = PlayerEntry
                local Checkbox = Instance.new("TextButton")
                Checkbox.Size = UDim2.new(0,17,0,17) -- 40% smaller
                Checkbox.Position = UDim2.new(0,5,0.5,-8.5)
                Checkbox.BackgroundColor3 = Color3.fromRGB(70,70,70)
                Checkbox.BackgroundTransparency = 0.8 -- More transparent
                Checkbox.BorderSizePixel = 0
                Checkbox.Text = ""
                Checkbox.Parent = PlayerEntry
                -- Add rounded corners to Checkbox (circle-like)
                local CheckCorner = Instance.new("UICorner")
                CheckCorner.CornerRadius = UDim.new(0.5, 0) -- Circular
                CheckCorner.Parent = Checkbox
                local Checkmark = Instance.new("TextLabel")
                Checkmark.Size = UDim2.new(1,0,1,0)
                Checkmark.BackgroundTransparency = 1
                Checkmark.Text = "✓"
                Checkmark.TextColor3 = Color3.fromRGB(0,255,0)
                Checkmark.TextSize = 12 -- 40% smaller
                Checkmark.Font = Enum.Font.GothamBold
                Checkmark.Visible = SelectedTargets[player.Name] ~= nil
                Checkmark.Parent = Checkbox
                -- Avatar Image
                local AvatarImage = Instance.new("ImageLabel")
                AvatarImage.Size = UDim2.new(0, 17, 0, 17) -- 40% smaller
                AvatarImage.Position = UDim2.new(0, 24, 0.5, -8.5)
                AvatarImage.BackgroundTransparency = 1
                AvatarImage.Image = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
                AvatarImage.Parent = PlayerEntry
                -- Make avatar circular
                local AvatarCorner = Instance.new("UICorner")
                AvatarCorner.CornerRadius = UDim.new(0.5, 0)
                AvatarCorner.Parent = AvatarImage
                local NameLabel = Instance.new("TextLabel")
                NameLabel.Size = UDim2.new(1, -48, 1, 0) -- Scaled
                NameLabel.Position = UDim2.new(0, 45, 0, 0) -- Scaled
                NameLabel.BackgroundTransparency = 1
                NameLabel.Text = player.DisplayName .. " (@" .. player.Name .. ")"
                NameLabel.TextColor3 = Color3.fromRGB(255,255,255)
                NameLabel.TextSize = 11 -- 40% smaller
                NameLabel.Font = Enum.Font.Gotham
                NameLabel.TextXAlignment = Enum.TextXAlignment.Left
                NameLabel.TextTruncate = Enum.TextTruncate.AtEnd -- Truncate long names
                NameLabel.Parent = PlayerEntry
                local ClickArea = Instance.new("TextButton")
                ClickArea.Size = UDim2.new(1,0,1,0)
                ClickArea.BackgroundTransparency = 1
                ClickArea.Text = ""
                ClickArea.ZIndex = 2
                ClickArea.Parent = PlayerEntry
                ClickArea.MouseButton1Click:Connect(function()
                    if SelectedTargets[player.Name] then
                        SelectedTargets[player.Name] = nil
                        Checkmark.Visible = false
                    else
                        SelectedTargets[player.Name] = player
                        Checkmark.Visible = true
                    end
                    UpdateStatus()
                end)
                PlayerCheckboxes[player.Name] = { Entry = PlayerEntry, Checkmark = Checkmark }
            end
        end
    end
    -- Update CanvasSize after adding all
    PlayerScrollFrame.CanvasSize = UDim2.new(0, 0, 0, ListLayout.AbsoluteContentSize.Y + 6) -- Scaled
end
-- Search functionality
SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
    RefreshPlayerList(SearchBox.Text:lower())
end)
-- Count selected
local function CountSelectedTargets()
    local count = 0
    for _ in pairs(SelectedTargets) do
        count = count + 1
    end
    return count
end
-- Update status
function UpdateStatus()
    local count = CountSelectedTargets()
    if FlingActive then
        StatusLabel.Text = "Flinging " .. count .. " target(s)"
        StatusLabel.TextColor3 = Color3.fromRGB(255,80,80)
    else
        StatusLabel.Text = count .. " target(s) selected"
        StatusLabel.TextColor3 = Color3.fromRGB(255,255,255)
    end
end
-- Select / Deselect all
local function ToggleAllPlayers(select)
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= Player then
            local checkboxData = PlayerCheckboxes[player.Name]
            if checkboxData then
                if select then
                    SelectedTargets[player.Name] = player
                    checkboxData.Checkmark.Visible = true
                else
                    SelectedTargets[player.Name] = nil
                    checkboxData.Checkmark.Visible = false
                end
            end
        end
    end
    UpdateStatus()
end
-- Notifications
local function Message(Title, Text, Time)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = Title,
        Text = Text,
        Duration = Time or 5
    })
end
-- SKIDFLING FUNCTION (kept as is, but you can adjust velocities for better bypass if needed)
function SkidFling(TargetPlayer)
    local Character = Player.Character
    local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Humanoid and Humanoid.RootPart
    local TCharacter = TargetPlayer.Character
    if not TCharacter then return end
    local THumanoid
    local TRootPart
    local THead
    local Accessory
    local Handle
    if TCharacter:FindFirstChildOfClass("Humanoid") then
        THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
    end
    if THumanoid and THumanoid.RootPart then
        TRootPart = THumanoid.RootPart
    end
    if TCharacter:FindFirstChild("Head") then
        THead = TCharacter.Head
    end
    if TCharacter:FindFirstChildOfClass("Accessory") then
        Accessory = TCharacter:FindFirstChildOfClass("Accessory")
    end
    if Accessory and Accessory:FindFirstChild("Handle") then
        Handle = Accessory.Handle
    end
    if Character and Humanoid and RootPart then
        if RootPart.Velocity.Magnitude < 50 then
            getgenv().OldPos = RootPart.CFrame
        end
        if THumanoid and THumanoid.Sit then
            return Message("Error", TargetPlayer.Name .. " is sitting", 2)
        end
        if THead then
            workspace.CurrentCamera.CameraSubject = THead
        elseif Handle then
            workspace.CurrentCamera.CameraSubject = Handle
        elseif THumanoid and TRootPart then
            workspace.CurrentCamera.CameraSubject = THumanoid
        end
        if not TCharacter:FindFirstChildWhichIsA("BasePart") then return end
        local function FPos(BasePart, Pos, Ang)
            RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
            Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
            RootPart.Velocity = Vector3.new(9e7, 9e7*10, 9e7)
            RootPart.RotVelocity = Vector3.new(9e8,9e8,9e8)
        end
        local function SFBasePart(BasePart)
            local TimeToWait = 1
            local Time = tick()
            local Angle = 0
            repeat
                if RootPart and THumanoid then
                    if BasePart.Velocity.Magnitude < 50 then
                        Angle = Angle + 100
                        FPos(BasePart, CFrame.new(0,1.5,0)+THumanoid.MoveDirection*BasePart.Velocity.Magnitude/1.25, CFrame.Angles(math.rad(Angle),0,0))
                        task.wait()
                        FPos(BasePart, CFrame.new(0,-1.5,0)+THumanoid.MoveDirection*BasePart.Velocity.Magnitude/1.25, CFrame.Angles(math.rad(Angle),0,0))
                        task.wait()
                    else
                        FPos(BasePart, CFrame.new(0,1.5,THumanoid.WalkSpeed), CFrame.Angles(math.rad(90),0,0))
                        task.wait()
                        FPos(BasePart, CFrame.new(0,-1.5,-THumanoid.WalkSpeed), CFrame.Angles(0,0,0))
                        task.wait()
                    end
                end
            until Time + TimeToWait < tick() or not (FlingActive or TouchMode)
        end
        workspace.FallenPartsDestroyHeight = 0/0
        local BV = Instance.new("BodyVelocity")
        BV.Parent = RootPart
        BV.Velocity = Vector3.new(0,0,0)
        BV.MaxForce = Vector3.new(9e9,9e9,9e9)
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
        if TRootPart then
            SFBasePart(TRootPart)
        elseif THead then
            SFBasePart(THead)
        elseif Handle then
            SFBasePart(Handle)
        else
            return Message("Error", TargetPlayer.Name.." has no valid parts",2)
        end
        BV:Destroy()
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
        workspace.CurrentCamera.CameraSubject = Humanoid
        -- Reset position
        if getgenv().OldPos then
            repeat
                RootPart.CFrame = getgenv().OldPos * CFrame.new(0,.5,0)
                Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0,.5,0))
                Humanoid:ChangeState("GettingUp")
                for _, part in pairs(Character:GetChildren()) do
                    if part:IsA("BasePart") then
                        part.Velocity, part.RotVelocity = Vector3.new(), Vector3.new()
                    end
                end
                task.wait()
            until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
            workspace.FallenPartsDestroyHeight = getgenv().FPDH
        end
    else
        return Message("Error", "Your character is not ready", 2)
    end
end
-- Advanced Touch Fling using velocity pulse to bypass some anti-fling
local function SetupTouchFling(enable)
    hiddenfling = enable
    if enable then
        spawn(function()
            local lp = Players.LocalPlayer
            local c, hrp, vel, movel = nil, nil, nil, 0.1
            while hiddenfling do
                RunService.Heartbeat:Wait()
                c = lp.Character
                if c then
                    for _, part in pairs(c:GetChildren()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
                hrp = c and c:FindFirstChild("HumanoidRootPart")
                if hrp then
                    vel = hrp.Velocity
                    hrp.Velocity = vel * 10000 + Vector3.new(0, 10000, 0)
                    RunService.RenderStepped:Wait()
                    hrp.Velocity = vel
                    RunService.Stepped:Wait()
                    hrp.Velocity = vel + Vector3.new(0, movel, 0)
                    movel = -movel
                end
            end
        end)
    end
end
-- Touch Toggle Connection
TouchToggle.MouseButton1Click:Connect(function()
    TouchMode = not TouchMode
    TouchToggle.Text = "Touch Fling: " .. (TouchMode and "ON" or "OFF")
    TouchToggle.BackgroundColor3 = TouchMode and Color3.fromRGB(0, 180, 0) or Color3.fromRGB(100, 100, 100)
    SetupTouchFling(TouchMode)
    if TouchMode then
        Message("Touch Mode", "Enabled", 2)
    else
        Message("Touch Mode", "Disabled", 2)
    end
end)
-- Start / Stop fling functions
local function StartFling()
    if FlingActive or TouchMode then return end
    local count = CountSelectedTargets()
    if count == 0 then
        StatusLabel.Text = "No targets selected!"
        wait(1)
        StatusLabel.Text = "Select targets to fling"
        return
    end
    FlingActive = true
    UpdateStatus()
    Message("Started","Flinging "..count.." targets",2)
    spawn(function()
        while FlingActive do
            local validTargets = {}
            for name,player in pairs(SelectedTargets) do
                if player and player.Parent then
                    validTargets[name] = player
                else
                    SelectedTargets[name] = nil
                    local checkbox = PlayerCheckboxes[name]
                    if checkbox then
                        checkbox.Checkmark.Visible = false
                    end
                end
            end
            for _, player in pairs(validTargets) do
                if FlingActive then
                    SkidFling(player)
                    wait(0.1)
                end
            end
            UpdateStatus()
            wait(0.5)
        end
    end)
end
local function StopFling()
    if not FlingActive then return end
    FlingActive = false
    UpdateStatus()
    Message("Stopped","Fling has been stopped",2)
end
-- Button connections
StartButton.MouseButton1Click:Connect(StartFling)
StopButton.MouseButton1Click:Connect(StopFling)
SelectAllButton.MouseButton1Click:Connect(function() ToggleAllPlayers(true) end)
DeselectAllButton.MouseButton1Click:Connect(function() ToggleAllPlayers(false) end)
CloseButton.MouseButton1Click:Connect(function()
    StopFling()
    if TouchMode then
        TouchMode = false
        hiddenfling = false
        SetupTouchFling(false)
    end
    ScreenGui:Destroy()
end)
-- Player join/leave
Players.PlayerAdded:Connect(function() RefreshPlayerList(SearchBox.Text:lower()) end)
Players.PlayerRemoving:Connect(function(player)
    if SelectedTargets[player.Name] then
        SelectedTargets[player.Name] = nil
    end
    RefreshPlayerList(SearchBox.Text:lower())
    UpdateStatus()
end)
-- Initialize
RefreshPlayerList()
UpdateStatus()
Message("Loaded","MetrixHub - Fling loaded!",3)
