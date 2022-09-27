Coverage = {
        general = 2, --0 if a type combo is immune to moveset, 1 if partial coverage, 2 if full coverage
        shedinja = 0, --0 if no damaging moves for Shedinja, 1 if only effective move(s) are status/weather, 2 if there is an effective move
}

function Coverage.update(pokemon)
        general = 2
        shedinja = 0
	
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
			general = 0
			break
		elseif effective = 1 then
			--found type combo resistant to full moveset, continue search in case there is a fully immune combo
			general = 1
		end
	end
	
	for moveIndex = 1, 4, 1 do
		if pokemon.moves[moveIndex] ~= nil and pokemon.moves[moveIndex].id ~= 0 then
			if pokemon.moves[moveIndex].category ~= MoveData.Categories.STATUS then
				if Utils.netEffectiveness(pokemon.moves[moveIndex], pokemon.moves[moveIndex].type, shedType) > 1 then
				--a single super-effective move is sufficient for Shedinja coverage, end early
					shedinja = 2
					break
				elseif pokemon.moves[moveIndex].id == "101"
				--Night Shade uniquely among fixed-damage moves does affect Shedinja
					shedinja = 2
					break
				elseif pokemon.moves[moveIndex].id == "248" --due to a programming quirk, typeless damage affects Shedinja in gen 3
				--Future Sight
					shedinja = 2
					break
				elseif pokemon.moves[moveIndex].id == "353"
				--Doom Desire
					shedinja = 2
					break
				end
			elseif
end







        for moveIndex = 1, 4, 1 do
                if pokemon.moves[moveIndex] ~= nil and pokemon.moves[moveIndex].id ~= 0 then
                        for k, typeCombo in ipairs(PokemonData.TypeCombos) do
                                if Utils.netEffectiveness(pokemon.moves[moveIndex], pokemon.moves[moveIndex].type, typeCombo)


local movesToCheck = {
		            MoveData.BlankMove,
		            MoveData.BlankMove,
    		        MoveData.BlankMove,
        		    MoveData.BlankMove,
	      }
        
        local trackedMoves = Tracker.GetMoves(pokemon.pokemonID)
        
        
