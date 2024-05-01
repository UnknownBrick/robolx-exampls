	["Chainsaw"] = {

		["AbilityAdd"] = function(Player)
			
			game.Debris:AddItem(Player.Character:WaitForChild("Animate"),0)
			
			local ability = game:GetService("ServerStorage"):WaitForChild("Abilities"):WaitForChild("Chainsaw"):Clone()
			ability.Parent = Player.Character
			ability.Animate.Parent = Player.Character
			
			local blader = ability.BladeR
			local bladerw = blader.Weld
			bladerw.Parent = Player.Character
			bladerw.Part0 = Player.Character["Right Arm"]
			
			local bladel = ability.BladeL
			local bladelw = bladel.Weld
			bladelw.Parent = Player.Character
			bladelw.Part0 = Player.Character["Left Arm"]
			
			local blader2 = ability.BladeR2
			local bladerw2 = blader2.Weld
			bladerw2.Parent = Player.Character
			bladerw2.Part0 = Player.Character["Right Leg"]
			
			local bladerH = ability.BladeH
			local bladerhw = bladerH.Weld
			bladerhw.Parent = Player.Character
			bladerhw.Part0 = Player.Character["Head"]
			
			local hedat = ability.Head.Attachment
			hedat.Parent = Player.Character.Head
			
		end,
		
		["One"] = function(Player)
			local chr = Player.Character
			
			
			if chr:HasTag("Used1") then return end
			chr:AddTag("Used1")
			
			local ability = chr:WaitForChild("Chainsaw")
			local anim = chr.Humanoid.Animator:LoadAnimation(ability.Anims["1"]) 
			anim:Play()
			task.spawn(function()
				ability.BladeR2.Transparency = 1
				task.wait(0.8)
				ability.BladeR2.Transparency = 0
				task.wait(0.8)
				ability.BladeR2.Transparency = 1
			end)
			
			ch.Slow(chr,1.5)

			task.wait(0.8)
			

			local startTime = os.time()
			
			local HitRaycast = hb.Create(chr, Vector3.new(6,6,10), chr.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2))
			for i, v in pairs(HitRaycast) do	
				v.Humanoid:TakeDamage(10)
				ch.DamageIndicate(v,10)
				ch.Stun(v,1.5,6)
			end
			
			task.delay(7, function()
				chr:RemoveTag("Used1")
			end)


		end,


		["Two"] = function(Player)
			local chr = Player.Character
			
			if chr:HasTag("Used2") then return end
			chr:AddTag("Used2")


			local ability = chr:WaitForChild("Chainsaw")
			local anim = chr.Humanoid.Animator:LoadAnimation(ability.Anims["2"]) 
			anim:Play()
			local startTime = os.time()
			local ws = chr.Humanoid.WalkSpeed

			ch.Knockback(chr,chr,50,0,0,0,1)
			chr.Humanoid.WalkSpeed = 0
			local HitRaycast = hb.Create(chr, Vector3.new(6,6,50), chr.HumanoidRootPart.CFrame * CFrame.new(0, 0, -25))
			for i, v in pairs(HitRaycast) do	
				v.Humanoid:TakeDamage(10)
				ch.DamageIndicate(v,10)
				ch.Stun(v,1.5,6)
			end
			task.wait(0.7)
			
			chr.Humanoid.WalkSpeed = ws
			
			task.delay(5, function()
				chr:RemoveTag("Used2")
			end)



		end,


		["Three"] = function(Player)
			local chr = Player.Character
			
			if chr:HasTag("Used3") then return end
			chr:AddTag("Used3")


			local ability = chr:WaitForChild("Chainsaw")
			local anim = chr.Humanoid.Animator:LoadAnimation(ability.Anims["3"]) 
			anim:Play()
			local startTime = os.time()
			
			task.wait(0.5)

			local HitRaycast = hb.Create(chr, Vector3.new(6,6,6), chr.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2))
			for i, v in pairs(HitRaycast) do	

				v.Humanoid:TakeDamage(40)
				
				ch.Knockback(chr,v,25,0,0,0,0.5)
				
				ch.DamageIndicate(v,40)
				ch.Stun(v,2,6)

			end
			
			task.delay(2, function()
				chr:RemoveTag("Used3")
			end)



		end,
				
		["Four"] = function(Player)
			local chr = Player.Character
			
			if chr:HasTag("Used4") then return end
			chr:AddTag("Used4")


			local ability = chr:WaitForChild("Chainsaw")
			chr.Head.Attachment.h:Emit(1)
			
			chr.Humanoid.WalkSpeed = 0
			
			task.wait(1)
			
			chr.Humanoid.Health += 30
			chr.Humanoid.WalkSpeed = 32
			chr.Animate.run.RunAnim.AnimationId = "rbxassetid://16010122666"
			chr.Animate.walk.WalkAnim.AnimationId = "rbxassetid://16010122666"

			
			task.delay(10,function()
				chr.Humanoid.WalkSpeed = 0
				task.wait(1)
				chr.Humanoid.Health += 30
				chr.Humanoid.WalkSpeed = 16
				chr.Animate.run.RunAnim.AnimationId = "rbxassetid://16021135915"
				chr.Animate.walk.WalkAnim.AnimationId = "rbxassetid://16021135915"

			end)
			
			task.delay(30, function()
				chr:RemoveTag("Used4")
			end)
		end,

	}
