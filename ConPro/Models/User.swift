import UIKit

class User: NSObject {
    var id: Int?
    var name: String?
    var image: UIImage?
    var eventsVisited = [Event]()
    var eventsOrganized = [Event]()
    init(id: Int, name: String, image: UIImage) {
        self.id = id
        self.name = name
        self.image = image
    }
}


