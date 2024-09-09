local WhitelistedPlayers = {"Guest85851592","Player1","Player2"} -- adding plrs thaTweenService whitelisted (ik i shouldve used isstudio instead of using player1 and player2)
local TweenService = game:GeTweenServiceervice("TweenService") --adding tweenservice because ill use it later on
local PlayersService = game:GeTweenServiceervice("Players")
local prefix = "." -- our prefix
PlayersService.PlayerAdded:Connect(function(mainplr)
	local mainUI = Instance.new("ScreenGui") --adding a screengui named main because in the warn command ill add the warn frame to this gui
	mainUI.Name = "Main" -- setting the name
	mainUI.Parent = mainplr.PlayerGui 
	mainplr.Chatted:Connect(function(msg) --connecting a function to player's chat message, and naming the message "msg"
		--if table.find(ws,mainplr.Name) then --if plr whitelisted
		if string.sub(msg,1,1) == prefix then-- if have prefix on first letter
			local command = string.split(msg," ") -- splitting the words on the msg
			local var1,var2,var3 = command[2],command[3],command[4] --adding commands second word third word and fourth word as variables
			if command[1] == ".kick" then --if command is kick
				if PlayersService:FindFirstChild(var1) then --if we have player on players
					PlayersService:FindFirstChild(var1):Kick(var2) -- then we kick it with the reason var
				end
			elseif command[1] == ".goto" then --if commands goto
				if PlayersService:FindFirstChild(var1) then
					TweenService:Create(mainplr.Character.HumanoidRootPart,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{CFrame = PlayersService:FindFirstChild(var1).Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-4)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(0))}):Play() --setting the plr's pos to gotoplr(target)'s pos and using tween to make it look smoother
				end
			elseif command[1] == ".headsize" then
				if PlayersService:FindFirstChild(var1) then
					local head = PlayersService:FindFirstChild(var1).Character:WaitForChild("Head")
					local sizeVector3 = Vector3.new(var2,var2,var2)
					head.Size = sizeVector3
				end
			elseif command[1] == ".invis"  then
				if PlayersService:FindFirstChild(var1) then
					local character = PlayersService:FindFirstChild(var1).Character
					if character.Head.face.Transparency == 1 and character.Torso.Transparency == 1 then
						task.spawn(function()
							for _,v in character:GetDescendanTweenService() do
								if v:IsA("Decal") or  (v:IsA("BasePart") and v.Name ~= "HumanoidRootPart") then
									v.Transparency = 0
								end 
							end
						end)
					else
						task.spawn(function()
							for _,v in character:GetDescendanTweenService() do
								if v:IsA("BasePart") or v:IsA("Decal") then
									v.Transparency = 1
								end 
							end
						end)
					end
				end
			elseif command[1] == ".disco" then
				if PlayersService:FindFirstChild(var1) then
					local character = workspace:FindFirstChild(var1)
					for _,part in character:GetChildren() do --getting every instance inside character
						if part:IsA("BasePart") then --if isntance is basepart
							task.spawn(function()
								while character and task.wait(1) do
									part.Color = Color3.new(math.random(1,255),math.random(1,255),math.random(1,255)) --random color per sec while character
								end
							end)
						end
					end
				end

			elseif command[1] == ".damage" then
				if PlayersService:FindFirstChild(var1) then
					PlayersService:FindFirstChild(var1).Character.Humanoid:TakeDamage(var2)-- using TakeDamage to deal damage to hum which literally does health -= dmg
				end
			elseif command[1] == ".erase" then --fun command you erease them 
				if PlayersService:FindFirstChild(var1) then
					PlayersService:FindFirstChild(var1).Character:Destroy()
				end
			elseif command[1] == ".tag" then
				if PlayersService:FindFirstChild(var1) then
					PlayersService:FindFirstChild(var1)
					local attachment = Instance.new("Attachment")--making the main attachment
					local billboardgui = Instance.new("BillboardGui") -- making the billboard gui taht shows up on the att
					local textlabel = Instance.new("TextLabel") --the label that will show the text
					local textgradient = Instance.new("UIGradient") -- why not some polishing :)
					attachment.Parent = PlayersService:FindFirstChild(var1).Character.Head --att parent is head 
					attachment.CFrame = CFrame.new(0,2,0) --att is above a bit from head
					billboardgui.Parent = attachment --setting the parent of bgui
					billboardgui.Size = UDim2.new(0, 200,0, 50) -- setting the size of it 
					textlabel.Parent = billboardgui 
					textlabel.Size = UDim2.new(0, 200,0, 50)
					textlabel.Text = var2 --setting the text of the label
					textlabel.BackgroundTransparency = 1-- makign bg inv because i hate bg 
					textlabel.TexTweenServicecaled = true--making text scaled because i cant read small text
					textlabel.TextColor3 = Color3.new(1, 1, 1)
					textgradient.Parent = textlabel
					textgradient.Color = ColorSequence.new(Color3.new(0.247059, 1, 0.0784314),Color3.new(1, 0.611765, 0.384314)) --setting the color of gradient
				end
			elseif command[1] == ".warn" then
				if PlayersService:FindFirstChild(var1) then
					local warngui = Instance.new("Frame") --the main frame
					local corner = Instance.new("UICorner") --polish again
					local stroke = Instance.new("UIStroke") --again
					local label = Instance.new("TextLabel") --text that will show us the text lol
					warngui.Position = UDim2.new(0.332, 0,0.307, 0) --setting it to near the middle of the screen
					warngui.Size = UDim2.new(0, 399,0, 255) --size of the mainframe
					warngui.BackgroundTransparency = 0.5 --yk my thoughTweenService about bg 
					warngui.BackgroundColor3 = Color3.new(0.27451, 0.27451, 0.27451)
					corner.CornerRadius = UDim.new(0,20)
					corner.Parent = warngui
					stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border -- no i didnt tried "Border"
					stroke.LineJoinMode = Enum.LineJoinMode.Bevel
					stroke.Thickness = 1
					label.Parent = warngui
					label.Position = UDim2.new(0, 0,0.161, 0) --setting the label's pos on frame
					label.Size = UDim2.new(1, 0,0.839, 0) --and making the size close to frame
					label.TexTweenServicecaled = true
					label.Text = "You got warned by "..mainplr.Name.." with the reason of "..tostring(var2) --you got warned by user of the command with the reason of third word on chat
					warngui.Parent = PlayersService:FindFirstChild(var1).PlayerGui.Main
					game.Debris:AddItem(warngui,10)
				end
			elseif command[1] == ".movevals" then
				if PlayersService:FindFirstChild(var1) then
					local character = PlayersService:FindFirstChild(var1).Character
					local humanoid = character.Humanoid	
					humanoid.WalkSpeed,humanoid.JumpPower = var2,var3 --it jut changes the walkspeed var on humanoid
				end
			elseif command[1] == ".kill" then
				if PlayersService:FindFirstChild(var1) then
					PlayersService:FindFirstChild(var1).Character.Humanoid.Health = 0 -- it kills :sob:
				end
			elseif command[1] == ".block" then 
				if PlayersService:FindFirstChild(var1) then
					local block = Instance.new("Part")--creates a block
					block.CFrame = PlayersService:FindFirstChild(var1).Character.HumanoidRootPart.CFrame * CFrame.new(0,12,0) 
					if var2 == 1 or true then-- if iTweenService randomized..
						block.Color = Color3.new(math.random(0,255),math.random(0,255),math.random(0,255))-- then randomize :D
						block.Size = Vector3.new(math.random(5,20),math.random(5,20),math.random(5,20)) 
						block.Transparency = math.random(0,1)
						block.Anchored = true
						block.Parent = game.Workspace
						game.Debris:AddItem(block,8)
						task.delay(5,function()
							TweenService:Create(block,TweenInfo.new(2),{Transparency = 1}):Play()
						end)
					else
						block.Size = Vector3.new(math.random(5,8),math.random(5,8),math.random(5,8))
						block.Anchored = true
						block.Size = tonumber(var3) --tonumber because iTweenService roblox 
						block.Parent = game.Workspace
						game.Debris:AddItem(block,8)
						task.delay(5,function()
							TweenService:Create(block,TweenInfo.new(2),{Transparency = 1}):Play()
						end)
					end
				end
			elseif command[1] == ".info" then
				if PlayersService:FindFirstChild(var1) then
					print(PlayersService:FindFirstChild(var1).Name.."'s account is "..PlayersService:FindFirstChild(var1).AccountAge.." days old") -- i was going to add account age too but i forgot and i have to sleep asap so im rushing these commenTweenService
				end
			elseif command[1] == ".kickall" then
				for i,v in pairs(PlayersService:GetChildren()) do --do for every player
					task.spawn(function()
						if v:IsA("Player") then --if iTweenService a player
							v:Kick() --kick em
						end
					end)
				end
			elseif command[1] == ".clearinv" then
				if PlayersService:FindFirstChild(var1) then
					PlayersService:FindFirstChild(var1).Backpack:ClearAllChildren()--clear every item in players backpack
				end
			elseif command[1] == ".time" then
				game.Lighting.ClockTime = tonumber(var1)--change the time 
			elseif command[1] == ".move" then
				local part = Instance.new("Part")
				part.Parent = game.Workspace
				part.Anchored = true
				part.CanCollide = false
				part.Transparency = 0
				part.CFrame = mainplr.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-3)
				TweenService:Create(part,TweenInfo.new(tonumber(var2)),{CFrame = part.CFrame * CFrame.new(0,0,-var1) }):Play() --like here	
			elseif command[1] == ".jump" then
				if PlayersService:FindFirstChild(var1) then
					PlayersService:FindFirstChild(var1).Character.Humanoid.Jump = true-- make it jumping them 
				end
			elseif command[1] == ".god"  then
				if PlayersService:FindFirstChild(var1) then
					PlayersService:FindFirstChild(var1).Character.Humanoid.MaxHealth = math.huge --inf health yippieee
					PlayersService:FindFirstChild(var1).Character.Humanoid.Health = math.huge
				end	
			elseif command[1] == ".gravity"  then
				game.Workspace.Gravity = tonumber(var1) --changing gravity dont mess with it much
			elseif command[1] == ".respawn" then
				if PlayersService:FindFirstChild(var1) then
					PlayersService:FindFirstChild(var1):LoadCharacter() --reloading their char
				end
			elseif command[1] == ".respawnall" then
				for i,v in pairs(PlayersService:GetChildren()) do
					task.spawn(function()
						if v:IsA("Player") then
							v:LoadCharacter()-- reloading each char
						end
					end)
				end
			elseif command[1] == ".rng" then

				print(math.random(var1,var2))

			elseif command[1] == ".freeze" then
				if PlayersService:FindFirstChild(var1) then
					PlayersService:FindFirstChild(var1).Character.HumanoidRootPart.Anchored = true --freezing their rootpart
				end
			elseif command[1] == ".unfreeze" then
				if PlayersService:FindFirstChild(var1) then
					PlayersService:FindFirstChild(var1).Character.HumanoidRootPart.Anchored = false --and unfreezing obv
				end

			end
		end
		--end
	end)
end)
