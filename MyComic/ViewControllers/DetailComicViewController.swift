
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
      //  self.navigationItem.rightBarButtonItem = UIBarButtonItem(title:"Fav",style: .done, target: self, action: #selector(addToFav))
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(openActionSheet))
        }
        // Do any additional setup after loading the view.
        
        imgView.sd_setImage(with: URL(string: (imgURL)!), placeholderImage: UIImage(named: ""))
    }
    @objc func share(){
        let image: UIImage =  self.imgView.image!
        
        // set up activity view controller
        let imageToShare = [ image ]
        let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
        

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
    @objc func openActionSheet(){
        let alert = UIAlertController(title: "Comic", message: "Please Select an Option", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Add to Favourite", style: .default , handler:{ (UIAlertAction)in
            self.addToFav()
        }))
        
        alert.addAction(UIAlertAction(title: "Share Comic", style: .default , handler:{ (UIAlertAction)in
            self.share()
        }))
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler:{ (UIAlertAction)in
            print("User click Dismiss button")
        }))
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
}
