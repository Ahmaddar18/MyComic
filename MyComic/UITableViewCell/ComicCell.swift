import UIKit
import SDWebImage

class ComicCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var comic: ComicRealm? {
        didSet {
            titleLabel.text = comic?.title
            imgView.sd_setImage(with: URL(string: (comic?.imgLink)!), placeholderImage: UIImage(named: ""))
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}


