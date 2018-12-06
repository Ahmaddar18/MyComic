
import Foundation
import RealmSwift

class ComicRealm: Object {
    
    @objc dynamic var num = 0
    @objc dynamic var title = ""
    @objc dynamic var imgLink = ""
    
    
    override static func primaryKey() -> String? {
        return "num"
    }
    
}
