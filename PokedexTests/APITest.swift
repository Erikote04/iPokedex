import XCTest

@testable
import Pokedex

class TestURLSession: URLSession {
    enum TestURLSessionsMode {
        case fail
        case succeed
    }
    
    var testMode: TestURLSessionsMode
    
    init(testMode: TestURLSessionsMode) {
        self.testMode = testMode
    }
    
    override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        switch testMode {
        case .fail:
            completionHandler(nil, nil, nil)
        case .succeed:
            completionHandler(Data(pokemon1JSON.utf8),
                              HTTPURLResponse(url: URL(string: "https://pokeapi.co/")!,
                                              statusCode: 200,
                                              httpVersion: "1.1",
                                              headerFields: nil),
                              nil)
        }
        
        return TestURLSessionDataTask()
    }
}

class TestURLSessionDataTask: URLSessionDataTask {
    override func resume() {
        print("called resume")
    }
}

final class APITest: XCTestCase {

    func test_Given_ValidPokemonURL_When_CallingGetPokemonButFails_Then_WeGetNilPokemon() {
        // Given
        let url = "https://pokeapi.co/api/v2/pokemon/1"
        
        // When
        getPokemon(url, session: TestURLSession(testMode: .fail)) { pokemon in
            // Then
            XCTAssertNil(pokemon)
        }
    }
    
    func test_Given_ValidPokemonURL_When_CallingGetPokemonAndSucceeds_Then_WeGetValidPokemon() {
        // Given
        let url = "https://pokeapi.co/api/v2/pokemon/1"
        
        // When
        getPokemon(url, session: TestURLSession(testMode: .succeed)) { pokemon in
            // Then
            XCTAssertNotNil(pokemon)
            XCTAssertEqual(pokemon?.id, 1)
            XCTAssertEqual(pokemon?.name, "bulbasaur")
        }
    }
}
