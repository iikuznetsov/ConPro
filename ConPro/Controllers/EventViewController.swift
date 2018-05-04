import UIKit

class EventViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var selectedEvent: String?
    var menu = [[#imageLiteral(resourceName: "info"),"Info"],[#imageLiteral(resourceName: "news"),"News Feed"],[#imageLiteral(resourceName: "people"),"Participants"],[#imageLiteral(resourceName: "calendar"),"Schedule"],[#imageLiteral(resourceName: "map"),"Map"],[#imageLiteral(resourceName: "mic"),"Speakers"],[#imageLiteral(resourceName: "chat"),"Chat"],[#imageLiteral(resourceName: "list"),"Subevents"]]
    @IBOutlet weak var menuCollectionView: UICollectionView!
    @IBOutlet weak var eventNameLabel: UILabel!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as! MenuCollectionViewCell
        cell.menuItemIcon.image = menu[indexPath.row][0] as? UIImage
        cell.menuItemLabel.text = menu[indexPath.row][1] as? String
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventNameLabel.text = selectedEvent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
