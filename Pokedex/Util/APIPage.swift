import Foundation

public struct APIPage {
    public let start: Int
    public let pageSize: Int
    public var stop: Int {
        start + pageSize
    }
    
    public init(start: Int = 1, pageSize: Int = 10) {
        self.start = start
        self.pageSize = pageSize
    }
    
    public func next() -> APIPage {
        APIPage(start: start + pageSize, pageSize: pageSize)
    }
    
    public func previous() -> APIPage {
        start - pageSize < 0 ? self : APIPage(start: start + pageSize, pageSize: pageSize)
    }
}

extension APIPage: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.start == rhs.start && lhs.pageSize == rhs.pageSize
    }
}
