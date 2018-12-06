import UIKit

class FavouriteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
 //   var comics: [Comic] = []
//    var arrComicList = NSMutableArray()
    var arrComicList = [ComicRealm]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavBar(title: "Comics")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        arrComicList = RealmController.getListFromRealm() as! [ComicRealm]
        
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
        return arrComicList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ComicCell") as! ComicCell
        
        let comic : ComicRealm
        comic = arrComicList[indexPath.row]
        cell.comic = comic
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailComicViewController") as! DetailComicViewController
        vc.myTitle = arrComicList[indexPath.row].title
        vc.num = arrComicList[indexPath.row].num
        vc.imgURL = arrComicList[indexPath.row].imgLink
        vc.isFav = false // hide the fav button as these comics are already fav
        self.navigationController?.pushViewController(vc, animated: true)
        print(indexPath.row)
    }
    
}
