import XCTest
import Pokedex

final class PageTest: XCTestCase {
    
    func test_Given_JustCreatedPage_Then_ItNotNil() {
        // Given
        let page = Page()
        
        // Then
        XCTAssertNotNil(page)
    }
    
    func test_Given_JustCreatedPage_Then_ItStartsIn1() {
        // Given
        let page = Page()
        
        // Then
        XCTAssertEqual(1, page.start)
    }
    
    func test_Given_Page_When_MovingForward_Then_PageSizeValueChanges() {
        // Given
        let page = Page()
        
        // When
        let nextPage = page.next()
        
        // Then
        XCTAssertEqual(11, nextPage.start)
    }
    
    func test_Given_Page_When_MovingForwardOnce_Then_StartIsStartPlusPageSize() {
        // Given
        let page = Page()
        
        // When
        let nextPage = page.next()
        
        // Then
        let secondPage = Page().next()
        XCTAssertEqual(nextPage, secondPage)
    }
    
    func test_Given_Page_When_MovingBackwards_Then_StartIsAlwaysGreaterThanZero() {
        // Given
        let page = Page()
        
        // When
        let previousPage = page.previous()
        
        // Then
        XCTAssertEqual(1, previousPage.start)
        XCTAssertTrue(previousPage.start > 1)
    }
}
