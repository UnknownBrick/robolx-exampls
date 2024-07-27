local ws = {"Guest85851592","Player1","Player2"} -- adding plrs thats whitelisted (ik i shouldve used isstudio instead of using player1 and player2)
local ts = game:GetService("TweenService") --adding tweenservice because ill use it later on
local pref = "." -- our prefix
game.Players.PlayerAdded:Connect(function(mainplr)
	local main = Instance.new("ScreenGui") --adding a screengui named main because in the warn command ill add the warn frame to this gui
	main.Name = "Main" -- setting the name
	main.Parent = mainplr.PlayerGui 
	mainplr.Chatted:Connect(function(msg) --connecting a function to player's chat message, and naming the message "msg"
		--if table.find(ws,mainplr.Name) then --if plr whitelisted
			if string.sub(msg,1,1) == pref then-- if have prefix on first letter
				local command = string.split(msg," ") -- splitting the words on the msg
				if command[1] == ".kick" then --if command is kick
					local plrtoban = command[2] -- getting the plr from second word
					local reason = command[3] -- reason from third
					if game.Players:FindFirstChild(plrtoban) then --if we have player on players
						game.Players:FindFirstChild(plrtoban):Kick(reason) -- then we kick it with the reason var
					end
				elseif command[1] == ".goto" then --if commands goto
					local gotoplr = command[2] 
				if game.Players:FindFirstChild(gotoplr) then
					ts:Create(mainplr.Character.HumanoidRootPart,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{CFrame = game.Players:FindFirstChild(gotoplr).Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-4)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(0))}):Play() --setting the plr's pos to gotoplr(target)'s pos and using tween to make it look smoother
					end
				elseif command[1] == ".bring" then
					local bringplr = command[2]
				if game.Players:FindFirstChild(bringplr) then
					ts:Create(game.Players:FindFirstChild(bringplr).Character.HumanoidRootPart,TweenInfo.new(0.5,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{CFrame = mainplr.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-4)*CFrame.Angles(math.rad(0),math.rad(180),math.rad(0))}):Play() --same as the thing as goto but vice versa 
					end
				elseif command[1] == ".damage" then
					local plr = command[2]
					local dmg = command[3]
					if game.Players:FindFirstChild(plr) then
						game.Players:FindFirstChild(plr).Character.Humanoid:TakeDamage(dmg)-- using TakeDamage to deal damage to hum which literally does health -= dmg
					end
				elseif command[1] == ".erase" then --fun command you erease them 
					local plr = command[2]
					if game.Players:FindFirstChild(plr) then
						game.Players:FindFirstChild(plr).Character:Destroy()
					end
				elseif command[1] == ".tag" then
					local plr = command[2]
					local tag = command[3]
					if game.Players:FindFirstChild(plr) then
						game.Players:FindFirstChild(plr)
						local at = Instance.new("Attachment")--making the main attachment
						local bgui = Instance.new("BillboardGui") -- making the billboard gui taht shows up on the att
						local label = Instance.new("TextLabel") --the label that will show the text
						local textgrad = Instance.new("UIGradient") -- why not some polishing :)
						at.Parent = game.Players:FindFirstChild(plr).Character.Head --att parent is head 
						at.CFrame = CFrame.new(0,2,0) --att is above a bit from head
						bgui.Parent = at --setting the parent of bgui
						bgui.Size = UDim2.new(0, 200,0, 50) -- setting the size of it 
						label.Parent = bgui 
						label.Size = UDim2.new(0, 200,0, 50)
						label.Text = tag --setting the text of the label
						label.BackgroundTransparency = 1-- makign bg inv because i hate bg 
						label.TextScaled = true--making text scaled because i cant read small text
						label.TextColor3 = Color3.new(1, 1, 1)
						textgrad.Parent = label
						textgrad.Color = ColorSequence.new(Color3.new(0.247059, 1, 0.0784314),Color3.new(1, 0.611765, 0.384314)) --setting the color of gradient
					end
				elseif command[1] == ".warn" then
					local plr = command[2]
					local reason = command[3]
					if game.Players:FindFirstChild(plr) then
						local warngui = Instance.new("Frame") --the main frame
						local corn = Instance.new("UICorner") --polish again
						local strok = Instance.new("UIStroke") --again
						local label = Instance.new("TextLabel") --text that will show us the text lol
						warngui.Position = UDim2.new(0.332, 0,0.307, 0) --setting it to near the middle of the screen
						warngui.Size = UDim2.new(0, 399,0, 255) --size of the mainframe
						warngui.BackgroundTransparency = 0.5 --yk my thoughts about bg 
						warngui.BackgroundColor3 = Color3.new(0.27451, 0.27451, 0.27451)
						corn.CornerRadius = UDim.new(0,20)
						corn.Parent = warngui
						strok.ApplyStrokeMode = Enum.ApplyStrokeMode.Border -- no i didnt tried "Border"
						strok.LineJoinMode = Enum.LineJoinMode.Bevel
						strok.Thickness = 1
						label.Parent = warngui
						label.Position = UDim2.new(0, 0,0.161, 0) --setting the label's pos on frame
						label.Size = UDim2.new(1, 0,0.839, 0) --and making the size close to frame
						label.TextScaled = true
						label.Text = "You got warned by "..mainplr.Name.." with the reason of "..tostring(reason) --you got warned by user of the command with the reason of third word on chat
						warngui.Parent = game.Players:FindFirstChild(plr).PlayerGui.Main
						game.Debris:AddItem(warngui,10)
					end
				elseif command[1] == ".walkspeed" then
					local plr = command[2]
					local speed = command[3]
					if game.Players:FindFirstChild(plr) then
						game.Players:FindFirstChild(plr).Character.Humanoid.WalkSpeed = speed --it jut changes the walkspeed var on humanoid
					end
				elseif command[1] == ".kill" then
					local plr = command[2]
					if game.Players:FindFirstChild(plr) then
						game.Players:FindFirstChild(plr).Character.Humanoid.Health = 0 -- it kills :sob:
					end
				elseif command[1] == ".block" then 
					local plr = command[2]
					local randomizer = command[3]
					local size = command[4]
					if game.Players:FindFirstChild(plr) then
						local block = Instance.new("Part")--creates a block
						block.CFrame = game.Players:FindFirstChild(plr).Character.HumanoidRootPart.CFrame * CFrame.new(0,12,0) 
						if randomizer == 1 or true then-- if its randomized..
							block.Color = Color3.new(math.random(0,255),math.random(0,255),math.random(0,255))-- then randomize :D
							block.Size = Vector3.new(math.random(5,20),math.random(5,20),math.random(5,20)) 
							block.Transparency = math.random(0,1)
							block.Anchored = true
							block.Parent = game.Workspace
							game.Debris:AddItem(block,8)
							task.delay(5,function()
								ts:Create(block,TweenInfo.new(2),{Transparency = 1}):Play()
							end)
						else
							block.Size = Vector3.new(math.random(5,8),math.random(5,8),math.random(5,8))
							block.Anchored = true
							block.Size = tonumber(size) --tonumber because its roblox 
							block.Parent = game.Workspace
							game.Debris:AddItem(block,8)
							task.delay(5,function()
								ts:Create(block,TweenInfo.new(2),{Transparency = 1}):Play()
							end)
						end
					end
				elseif command[1] == ".info" then
					local plr = command[2]
					if game.Players:FindFirstChild(plr) then
					print(game.Players:FindFirstChild(plr).Name.."'s account is "..game.Players:FindFirstChild(plr).AccountAge.." days old") -- i was going to add account age too but i forgot and i have to sleep asap so im rushing these comments
					end
				elseif command[1] == ".kickall" then
					for i,v in pairs(game.Players:GetChildren()) do --do for every player
						task.spawn(function()
							if v:IsA("Player") then --if its a player
								v:Kick() --kick em
							end
						end)
					end
				elseif command[1] == ".clearinv" then
					local plr = command[2]
					if game.Players:FindFirstChild(plr) then
						game.Players:FindFirstChild(plr).Backpack:ClearAllChildren()--clear every item in players backpack
					end
				elseif command[1] == ".time" then
					local tiem = command[2]
					game.Lighting.ClockTime = tonumber(tiem)--change the time 
				elseif command[1] == ".move" then
					local distance = command[2]
					local tiem = command[3]
					local part = Instance.new("Part")
					part.Parent = game.Workspace
					part.Anchored = true
					part.CanCollide = false
					part.Transparency = 0
					part.CFrame = mainplr.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,-3)
					ts:Create(part,TweenInfo.new(tonumber(tiem)),{CFrame = part.CFrame * CFrame.new(0,0,-distance) }):Play() --like here
				elseif command[1] == ".jumppower" then
					local plr = command[2]
					local val = command[3]
					if game.Players:FindFirstChild(plr) then
						game.Players:FindFirstChild(plr).Character.Humanoid.UseJumpPower = true
						game.Players:FindFirstChild(plr).Character.Humanoid.JumpPower = val -- same as walkspeed
					end			
				elseif command[1] == ".jump" then
					local plr = command[2]
					if game.Players:FindFirstChild(plr) then
						game.Players:FindFirstChild(plr).Character.Humanoid.Jump = true-- make it jumping them 
					end
				elseif command[1] == ".god"  then
					local plr = command[2]
					if game.Players:FindFirstChild(plr) then
						game.Players:FindFirstChild(plr).Character.Humanoid.MaxHealth = math.huge --inf health yippieee
						game.Players:FindFirstChild(plr).Character.Humanoid.Health = math.huge
					end	
				elseif command[1] == ".gravity"  then
					local val = command[2]
					game.Workspace.Gravity = tonumber(val) --changing gravity dont mess with it much
				elseif command[1] == ".respawn" then
					local plr = command[2]
					if game.Players:FindFirstChild(plr) then
						game.Players:FindFirstChild(plr):LoadCharacter() --reloading their char
					end
				elseif command[1] == ".respawnall" then
					for i,v in pairs(game.Players:GetChildren()) do
						task.spawn(function()
							if v:IsA("Player") then
								v:LoadCharacter()-- reloading each char
							end
						end)
					end
				elseif command[1] == ".freeze" then
					local plr = command[2]
					if game.Players:FindFirstChild(plr) then
						game.Players:FindFirstChild(plr).Character.HumanoidRootPart.Anchored = true --freezing their rootpart
					end
				elseif command[1] == ".unfreeze" then
					local plr = command[2]
					if game.Players:FindFirstChild(plr) then
						game.Players:FindFirstChild(plr).Character.HumanoidRootPart.Anchored = false --and unfreezing obv
					end
					
				end
			end
		--end
	end)
end)
