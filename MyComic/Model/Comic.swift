
import Foundation
import SwiftyJSON
struct Comic: Decodable{
    var num:Int //= 5
    var title:String //= "title"
    var img:String //= "link"
    
//    init(json:[String:Any]) {
//        num = json["num"] as? Int ?? -1
//        title = json["title"] as? String ?? ""
//        img = json["img"] as? String ?? ""
//    }
}
