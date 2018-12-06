
import UIKit
import SDWebImage
import RealmSwift
class DetailComicViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    var myTitle: String?
    var num:Int?
    var imgURL: String?
    var isFav: Bool? // to hide the fav button if we are already watching fav comic
    var comics: [ComicRealm] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar(title: myTitle ?? "Title")
        if(isFav!)
        {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title:"Fav",style: .done, target: self, action: #selector(addToFav))
        }
        // Do any additional setup after loading the view.
        
        imgView.sd_setImage(with: URL(string: (imgURL)!), placeholderImage: UIImage(named: ""))
    }
    @objc func addToFav(){
        let obj = Comic()
        obj.title = self.myTitle!
        obj.num = self.num!
        obj.imgLink = self.imgURL!
        
        // convert into Realm model
        let comicRealm = RealmController.setRealmModel(item: obj)
        self.comics.append(comicRealm)
        // save obj to Realm database
        RealmController.saveInfoRealm(listObj: comicRealm)
        let alert = UIAlertController(title: "Downloaded", message: "Commic Added to your Favourite :)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}
