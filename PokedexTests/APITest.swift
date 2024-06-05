import XCTest
@testable import Pokedex

final class APITest: XCTestCase {
    
    func test_GivenInalidPokemonURL_WhenCallingGetPokemonAndFails_ThenReturnsNil() async {
        // Given
        let url = "https://invalidpokemonurl.com"
        
        // When
        let pokemon = await getPokemon(url)
        
        // Then
        XCTAssertNil(pokemon)
    }
    
    func test_GivenValidPokemonURL_WhenCallingGetPokemonAndSucceeds_ThenReturnsPokemon() async {
        // Given
        let url = "https://pokeapi.co/api/v2/pokemon/1"
        
        // When
        let pokemon = await getPokemon(url)
        
        // Then
        XCTAssertNotNil(pokemon)
        XCTAssertEqual(pokemon?.id, 1)
        XCTAssertEqual(pokemon?.name, "bulbasaur")
    }
}
