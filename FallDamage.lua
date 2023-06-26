local function FallDmg(Plr: Player, Char: Instance)
	local Velocity = math.abs(Char.HumanoidRootPart.Velocity.Y) -- calculating velocity
	local Damage = (Velocity / 70) ^ 4.5 -- how much damage will be taken, you may have to play with this

	if Velocity >= 80 then -- threshold for fall damge to be taken
		Char.Humanoid:TakeDamage(Damage) -- deal damage to player
	end
end

game.Players.PlayerAdded:Connect(function(Plr) -- player joins
	Plr.CharacterAdded:Connect(function(Char) -- players character is created
		Char.Humanoid.StateChanged:Connect(function(oldState, newState) -- check for fall dmg
			if newState == Enum.HumanoidStateType.Landed then -- if the state is landed
				FallDmg(Plr, Char) -- do fall dmg
			end
		end)
end)
