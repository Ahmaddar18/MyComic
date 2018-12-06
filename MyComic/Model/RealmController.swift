
import UIKit
import Foundation
import RealmSwift


class RealmController
{

    class func getListFromRealm() -> NSMutableArray {
        
        let realm = try! Realm()
        
        // Get last list
        let listRealm = realm.objects(ComicRealm.self)
        
        let arrList = NSMutableArray()
        
        for obj in listRealm {
            arrList.add(obj)
        }
        
        return arrList
    }
    
    class func saveInfoRealm(listObj: ComicRealm) {
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(listObj, update: true)
        }
        
//        listObj.num = autoIncrementID()
//        listObj.title = "stringFromDate"
//        listObj.imgLink = "url"
        
//        try! realm.write {
//            realm.add(listObj)
//        }
        
    }
    
    class func autoIncrementID () -> Int {
        let realm = try! Realm()
        return (realm.objects(ComicRealm.self).max(ofProperty: "num") as Int? ?? 0) + 1
    }
    
    class func updateTodoInfoRealm(listObj: ComicRealm) {
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(listObj, update: true)
        }
        
        
    }
    
    class func deleteTodoFromRealm(object: ComicRealm){
        
        let realm = try! Realm()
        try! realm.write {
            realm.delete(object)
        }
        
    }
   
    //MARK: - Models for Realm
    
    class func setRealmModel(item : Comic) -> ComicRealm {
        
        let comicObj = ComicRealm()
        comicObj.num = item.num
        comicObj.title = item.title
        comicObj.imgLink = item.imgLink
        
        return comicObj
    }

}
