import Foundation

class MedalCollection {
    var title:String!
    let medals = [Medal]()
    
    init() {
        
    }
    
    func createCollection() {
        if let data = Dictionary<String, AnyObject>.loadJSONFromBundle("Data/Collection/Shinuchi"){
            println("collection data:\n \(data)")
            title = data["title"] as String
            println("title = \(title)")
            
        }
    }
}

