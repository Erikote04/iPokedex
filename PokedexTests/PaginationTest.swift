import XCTest
@testable import Pokedex

final class PaginationTest: XCTestCase {
    
    // MARK: Initialization
    
    func test_GivenJustCreatedPage_ThenIsNotNil() {
        // Given
        let page = APIPage()
        
        // Then
        XCTAssertNotNil(page)
    }
    
    func test_GivenJustCreatedPage_ThenItHasDefaultValues() {
        // Given
        let page = APIPage()
        
        // Then
        XCTAssertEqual(page.start, 1)
        XCTAssertEqual(page.pageSize, 10)
        XCTAssertEqual(page.stop, 11)
    }
    
    func test_GivenCustomPage_ThenMatchesCustomValues() {
        // Given
        let page = APIPage(start: 5, pageSize: 20)
        
        // Then
        XCTAssertEqual(page.start, 5)
        XCTAssertEqual(page.pageSize, 20)
        XCTAssertEqual(page.stop, 25)
    }
    
    func test_GivenJustCreatedPage_Then_ItStartsInOne() {
        // Given
        let page = APIPage()
        
        // Then
        XCTAssertEqual(1, page.start)
    }
    
    // MARK: Moving Forward
    
    func test_GivenPage_WhenMovingForward_ThenPageValuesChanges() {
        // Given
        let page = APIPage()
        
        // When
        let nextPage = page.next()
        
        // Then
        XCTAssertEqual(11, nextPage.start)
        XCTAssertEqual(10, nextPage.pageSize)
        XCTAssertEqual(21, nextPage.stop)
    }
    
    // MARK: Moving Backwards
    
    func test_GivenPage_WhenMovingBackwards_ThenStartIsAlwaysGreaterThanZero() {
        // Given
        let page = APIPage()
        
        // When
        let previousPage = page.previous()
        
        // Then
        XCTAssertEqual(1, previousPage.start)
        XCTAssertTrue(previousPage.start > 0)
    }
    
    // MARK: Equatable Protocol Conformance
    
    func test_GivenTwoEqualPages_ThenTheyAreEqual() {
        // Given
        let page1 = APIPage(start: 1, pageSize: 10)
        let page2 = APIPage(start: 1, pageSize: 10)
        
        // Then
        XCTAssertEqual(page1, page2)
    }
    
    func test_GivenTwoDifferentPages_ThenTheyAreNotEqual() {
        // Given
        let page1 = APIPage(start: 1, pageSize: 10)
        let page2 = APIPage(start: 2, pageSize: 10)
        
        // Then
        XCTAssertNotEqual(page1, page2)
    }
}
