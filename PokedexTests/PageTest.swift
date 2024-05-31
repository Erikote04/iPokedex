import XCTest
import Pokedex

final class PageTest: XCTestCase {
    
    func test_Given_JustCreatedPage_Then_ItNotNil() {
        // Given
        let page = APIPage()
        
        // Then
        XCTAssertNotNil(page)
    }
    
    func test_Given_JustCreatedPage_Then_ItStartsIn1() {
        // Given
        let page = APIPage()
        
        // Then
        XCTAssertEqual(1, page.start)
    }
    
    func test_Given_Page_When_MovingForward_Then_PageSizeValueChanges() {
        // Given
        let page = APIPage()
        
        // When
        let nextPage = page.next()
        
        // Then
        XCTAssertEqual(11, nextPage.start)
    }
    
    func test_Given_Page_When_MovingForwardOnce_Then_StartIsStartPlusPageSize() {
        // Given
        let page = APIPage()
        
        // When
        let nextPage = page.next()
        
        // Then
        let secondPage = APIPage().next()
        XCTAssertEqual(nextPage, secondPage)
    }
    
    func test_Given_Page_When_MovingBackwards_Then_StartIsAlwaysGreaterThanZero() {
        // Given
        let page = APIPage()
        
        // When
        let previousPage = page.previous()
        
        // Then
        XCTAssertEqual(1, previousPage.start)
        XCTAssertTrue(previousPage.start > 1)
    }
}
