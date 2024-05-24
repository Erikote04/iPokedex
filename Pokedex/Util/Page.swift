import Foundation

public struct Page {
    public let start: Int
    public let pageSize: Int
    
    public init(start: Int = 1, pageSize: Int = 10) {
        self.start = start
        self.pageSize = pageSize
    }
    
    public func next() -> Page {
        Page(start: start + pageSize, pageSize: pageSize)
    }
    
    public func previous() -> Page {
        start - pageSize < 0 ? self : Page(start: start + pageSize, pageSize: pageSize)
    }
}

extension Page: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.start == rhs.start && lhs.pageSize == rhs.pageSize
    }
}
