import UIKit

class EventViewController: UIViewController {

    var selectedEvent: String?
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = selectedEvent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
