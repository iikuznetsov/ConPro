import UIKit

class EventsViewController: UIViewController {

    
    @IBOutlet weak var lbl: UILabel!
    //to do later
    override func viewDidLoad() {
        super.viewDidLoad()
        if let t = UserDefaults.standard.data(forKey: "token") {
            let token = Token().fromJSON(json: t)
            lbl.text = token.id
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
