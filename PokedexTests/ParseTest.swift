import XCTest
@testable import Pokedex

final class ParseTest: XCTestCase {
    
    func test_GivenEmptyData_WhenParsing_ThenReturnsNil() async {
        // Given
        let data = Data()
        
        // When
        let pokemon = await parsePokemonJSON(data)
        
        // Then
        XCTAssertNil(pokemon)
    }
    
    func test_GivenValidData_WhenParsing_ThenReturnsPokemon() async {
        // Given
        let data = Data(pokemonStub.utf8)
        
        // When
        let pokemon = await parsePokemonJSON(data)
        
        // Then
        XCTAssertNotNil(pokemon)
    }
}
