Coverage = {
        general = 2, --0 if a type combo is immune to moveset, 1 if partial coverage, 2 if full coverage
        shedinja = 0, --0 if no damaging moves for Shedinja, 1 if only effective move(s) are status/weather, 2 if there is an effective move
}

function Coverage.update(pokemon)
        Coverage.general = 2
        Coverage.shedinja = 0
	
	local shedType = {PokemonData.Types.BUG, PokemonData.Types.GHOST}
        
	for k, typeCombo in ipairs(PokemonData.TypeCombos) do
		local effective = 0
		for moveIndex = 1, 4, 1 do
			if pokemon.moves[moveIndex] ~= nil and pokemon.moves[moveIndex].id ~= 0 then
				if pokemon.moves[moveIndex].category ~= MoveData.Categories.STATUS then
				--ignoring status moves because if you're relying on Will-O-Wisp or something then your coverage is broken anyway
					tempEff = Utils.netEffectiveness(pokemon.moves[moveIndex], pokemon.moves[moveIndex].type, typeCombo)
					if tempEff >= 1 then
						--one fully effective move is sufficient to move to the next type combo
						--NOTE: netEffectiveness treats fixed-damage moves as fully effective, possibly handle that case differently
						effective = 2
						break
					elseif tempEff > 0 then
						effective = 1
					end
				end
			end
		end
		
		if effective = 0 then
			--found type combo immune to full moveset, ends early
			Coverage.general = 0
			break
		elseif effective = 1 then
			--found type combo resistant to full moveset, continue search in case there is a fully immune combo
			Coverage.general = 1
		end
	end
	
	for moveIndex = 1, 4, 1 do
	--[[NOTE: Mimic, Metronome, Mirror Move, Transform, Sketch, Magic Coat, all entry hazards, and a variety of abilities can also
	deal with a Shedinja in theory, but they are all wildly inconsistent or require foreknowledge that a Shedinja is on a Trainer's
	team, so they are not included.]]
		if pokemon.moves[moveIndex] ~= nil and pokemon.moves[moveIndex].id ~= 0 then
			if pokemon.moves[moveIndex].category ~= MoveData.Categories.STATUS then
				if Utils.netEffectiveness(pokemon.moves[moveIndex], pokemon.moves[moveIndex].type, shedType) > 1 then
				--a single super-effective move is sufficient for Shedinja coverage, end early
					Coverage.shedinja = 2
					break
				elseif pokemon.moves[moveIndex].id == "101" then
				--Night Shade uniquely among fixed-damage moves does affect Shedinja
					Coverage.shedinja = 2
					break
				elseif pokemon.moves[moveIndex].id == "248" then
				--due to a programming quirk, typeless damage affects Shedinja in gen 3
				--Future Sight
					Coverage.shedinja = 2
					break
				elseif pokemon.moves[moveIndex].id == "353" then
				--Doom Desire
					Coverage.shedinja = 2
					break
				end
			elseif shedinja == 0 then
			--wasteful to do all these extra checks if a move has already been found with partial effectiveness
				if pokemon.moves[moveIndex].id == "48" then
				--Supersonic, debatable whether confusion should be used to determine Shedinja coverage, but technically it works
					Coverage.shedinja = 1
				elseif pokemon.moves[moveIndex].id == "73" then
				--Leech Seed
					Coverage.shedinja = 1
				elseif pokemon.moves[moveIndex].id == "77" then
				--Poisonpowder
					Coverage.shedinja = 1
				elseif pokemon.moves[moveIndex].id == "92" then
				--Toxic
					Coverage.shedinja = 1
				elseif pokemon.moves[moveIndex].id == "109" then
				--Confuse Ray
					Coverage.shedinja = 1
				elseif pokemon.moves[moveIndex].id == "139" then
				--Poison Gas
					Coverage.shedinja = 1
				elseif pokemon.moves[moveIndex].id == "171" then
				--Nightmare, if you're going to put in the work to make this happen in ironmon I guess you deserve a yellow light
					Coverage.shedinja = 1
				elseif (pokemon.moves[moveIndex].id == "174" and (pokemon.types[1] == PokemonData.Types.GHOST or pokemon.types[2] == PokemonData.Types.GHOST)) then
				--Curse
					Coverage.shedinja = 1
				elseif pokemon.moves[moveIndex].id == "186" then
				--Sweet Kiss
					Coverage.shedinja = 1
				elseif pokemon.moves[moveIndex].id == "201" then
				--Sandstorm
					Coverage.shedinja = 1
				elseif pokemon.moves[moveIndex].id == "207" then
				--Swagger
					Coverage.shedinja = 1
				elseif pokemon.moves[moveIndex].id == "258" then
				--Hail
					Coverage.shedinja = 1
				elseif pokemon.moves[moveIndex].id == "260" then
				--Flatter
					Coverage.shedinja = 1
				elseif pokemon.moves[moveIndex].id == "261" then
				--Will-O-Wisp
					Coverage.shedinja = 1
				elseif pokemon.moves[moveIndex].id == "298" then
				--Teeter Dance
					Coverage.shedinja = 1
				end
			end
		end
	end
end
