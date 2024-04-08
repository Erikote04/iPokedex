import XCTest

@testable
import Pokedex

final class PokedexSlowTest: XCTestCase {

    func test_Given_ValidPokemonURL_When_CallingGetPokemonAndSucceeds_Then_WeGetValidPokemon() {
        var end = false
        
        // Given
        let url = "https://pokeapi.co/api/v2/pokemon/1"
        
        // When
        getPokemon(url) { pokemon in
            // Then
            XCTAssertNotNil(pokemon)
            XCTAssertEqual(pokemon?.id, 1)
            XCTAssertEqual(pokemon?.name, "bulbasaur")
            end = true
        }
        
        while (!end) {}
    }
}
