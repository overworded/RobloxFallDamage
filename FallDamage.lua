local function FallDmg(Char: Instance)
	local Velocity = math.abs(Char.HumanoidRootPart.Velocity.Y) -- calculating velocity.
	local Damage = (Velocity / 70) ^ 4.5 -- how much damage will be taken, you may have to play with these numbers as they are low right now.
	if Velocity >= 80 then -- threshold for fall damage to be taken.
		Char.Humanoid:TakeDamage(Damage) -- deal damage to the player.
	end
end

game.Players.PlayerAdded:Connect(function(Plr) -- player joins the game.
	Plr.CharacterAdded:Connect(function(Char) -- players character is created.
		Char.Humanoid.StateChanged:Connect(function(oldState, newState) -- check for potential falls.
			if newState == Enum.HumanoidStateType.Landed then -- if the state is landed (they fell).
				FallDmg(Char) -- do fall damage.
			end
		end)
end)
