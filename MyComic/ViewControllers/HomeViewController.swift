
import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar(title: "Home")

    }
    @IBAction func showComics(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ComicViewController") as! ComicViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func searchComic(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func favComic(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FavouriteViewController") as! FavouriteViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
