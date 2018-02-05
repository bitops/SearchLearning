import UIKit

class SearchTableViewController: UITableViewController, UISearchResultsUpdating {

    var searchResults : Array<String> = []
    var resultSearchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationController!.definesPresentationContext = true
        
        self.resultSearchController = UISearchController(searchResultsController: nil)
        self.resultSearchController.searchResultsUpdater = self
        self.resultSearchController.dimsBackgroundDuringPresentation = false
        self.resultSearchController.searchBar.placeholder = "Type to search"
        self.resultSearchController.searchBar.sizeToFit()
        
        self.tableView.tableHeaderView = self.resultSearchController.searchBar
        self.tableView.reloadData()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.resultSearchController.isActive ? self.searchResults.count : 0)
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        self.searchResults.removeAll(keepingCapacity: false)
        self.searchResults = ["Foo", "Bar", "Baz", "Qux", "Wibble", "Nibble", "Qualia"]
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let text = searchResults[indexPath.row]
        NSLog("cell with text \(text) was tapped")
        
        let board = UIStoryboard(name: "Main", bundle: Bundle.main)
        let resultController : ResultViewController = board.instantiateViewController(withIdentifier: "Result") as! ResultViewController
        self.navigationController!.pushViewController(resultController, animated: true)
        
        self.resultSearchController.dismiss(animated: false)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as UITableViewCell?
        cell!.textLabel?.text = searchResults[indexPath.row]
        return cell!
    }

}
