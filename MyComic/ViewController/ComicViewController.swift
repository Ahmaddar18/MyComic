
import UIKit

class ComicViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var comics: [Comic] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let path = Bundle.main.path(forResource: "comicAPI", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            do {
                self.comics = try JSONDecoder().decode(Array<Comic>.self, from: data)
                for item in self.comics{
                    print(item.title)
                }
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
        }.resume()
    }
}

extension ComicViewController : UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comic = comics[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ComicCell") as! ComicCell
        print(comic.title)
        cell.titleLabel?.text = comic.title
        cell.imgView?.image = getImg(imgLink: comic.img)
        return cell
    }
    func getImg(imgLink: String) -> UIImage{
        let url = URL(string: imgLink)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        return UIImage(data: data!)!
    }
    
}
