

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonClicked() {
        let board = UIStoryboard(name: "Main", bundle: Bundle.main)
        let searchController = board.instantiateViewController(withIdentifier: "SearchNav")
        self.present(searchController, animated: true) {}
//        self.navigationController?.present(searchController, animated: true) {}
    }


}

