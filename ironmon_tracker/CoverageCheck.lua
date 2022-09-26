Coverage = {
        general = 2, --0 if a type combo is immune to moveset, 1 if all not very effective, 2 if full coverage
        shedinja = 0, --0 if no damaging moves for Shedinja, 1 if only effective move(s) are status/weather, 2 if there is an effective move
}

function Coverage.update(pokemon)
{
        local general = 2
        local shedinja = 0
        

}







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
        
        
