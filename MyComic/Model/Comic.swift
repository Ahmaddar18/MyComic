
import Foundation
import RealmSwift

class Comic: Object {
    @objc dynamic var num = 0
    @objc dynamic var title = ""
    @objc dynamic var imgLink = ""
    
//    init(json:[String:Any]) {
//        num = json["num"] as? Int ?? -1
//        title = json["title"] as? String ?? ""
//        img = json["img"] as? String ?? ""
//    }
    override static func primaryKey() -> String? {
        return "num"
    }
}
