
import UIKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var selectedEvent: Event?
    
    @IBOutlet weak var newsTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (selectedEvent?.news.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsTableViewCell
        var n: News?
        
        n = selectedEvent?.news[indexPath.row]
        
        cell.newsHeader.text = n!.header
        cell.newsExposition.text = n!.exposition
        
        return cell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedEvent?.news.append(n1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
