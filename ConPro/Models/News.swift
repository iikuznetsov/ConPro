import UIKit

class News: NSObject {
    var id: Int?
    var header: String?
    var exposition: String?
    var image: UIImage?
    init(id: Int, header: String, exposition: String, image: UIImage) {
        self.id = id
        self.header = header
        self.exposition = exposition
        self.image = image
    }
}
