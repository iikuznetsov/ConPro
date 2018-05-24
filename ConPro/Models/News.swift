
import UIKit

class News: NSObject {
    var id: Int?
    var name: String?
    var message: String?
    init(id: Int, name: String, message: String) {
        self.id = id
        self.name = name
        self.message = message
    }
}
