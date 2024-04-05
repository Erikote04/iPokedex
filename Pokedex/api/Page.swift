import Foundation

struct Page {
    let start: Int
    let pageSize: Int
    
    init(start: Int = 1, pageSize: Int = 10) {
        self.start = start
        self.pageSize = pageSize
    }
    
    func next() -> Page {
        Page(start: start + pageSize, pageSize: pageSize)
    }
    
    func previous() -> Page {
        Page(start: start + pageSize, pageSize: pageSize)
    }
}
