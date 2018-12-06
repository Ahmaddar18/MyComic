import UIKit

class ComicViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var comics: [ComicRealm] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavBar(title: "Comics")
        
        renderLocalList()
    }
    
    // MARK: - Helper
    
    func renderLocalList() {
        // Hard coded data as there isn't any API provided to get bunch of comics data in a single request
        let titleList = ["Barrel - Part 1", "Petit Trees (sketch)", "Island (sketch)", "Landscape (sketch)", "Petit Trees (sketch)"]
        
        let imgList = ["https://imgs.xkcd.com/comics/barrel_cropped_(1).jpg",
                       "https://imgs.xkcd.com/comics/tree_cropped_(1).jpg",
                       "https://imgs.xkcd.com/comics/island_color.jpg",
                       "https://imgs.xkcd.com/comics/landscape_cropped_(1).jpg",
                       "https://imgs.xkcd.com/comics/tree_cropped_(1).jpg"]
        // stre data into comicObject
        for (index, item) in titleList.enumerated() {
            let comicObj = Comic()
            comicObj.num = index + 1 // because in url Comics are starting from 1, not 0
            comicObj.title = item
            let imgObj = imgList[index]
            comicObj.imgLink = imgObj
            
            // convert into Realm model
            let comicRealm = RealmController.setRealmModel(item: comicObj)
            self.comics.append(comicRealm)
            
            // Testing of DB
//            if index == 1 {
//                RealmController.saveInfoRealm(listObj: comicRealm)
//            }
            
        }
        
        self.tableView.reloadData()
    }

    // MARK: - UITableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comics.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ComicCell") as! ComicCell
        
        let comic = comics[indexPath.row]
        cell.comic = comic
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){   
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailComicViewController") as! DetailComicViewController
        vc.myTitle = comics[indexPath.row].title // Passing the title to detail View
        vc.num = comics[indexPath.row].num
        vc.imgURL = comics[indexPath.row].imgLink
        vc.isFav = true
        self.navigationController?.pushViewController(vc, animated: true)
        print(indexPath.row)
    }
    
}
