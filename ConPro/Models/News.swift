
import UIKit

class News: NSObject {
    var id: Int?
    var header: String?
    var exposition: String?
    init(id: Int, header: String, exposition: String) {
        self.id = id
        self.header = header
        self.exposition = exposition
    }
}
