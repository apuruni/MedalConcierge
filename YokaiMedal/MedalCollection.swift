import Foundation

class MedalCollection {
    var title:String!
    var medals = [Medal]()
    
    init() {
        
    }
    
    func createCollection() {
        if let data = Dictionary<String, AnyObject>.loadJSONFromBundle("Data/Collection/Shinuchi"){
            println("collection data:\n \(data)")
            title = data["title"] as String
            println("title = \(title)")
            if let items: AnyObject = data["items"] {
                for(row, hash) in enumerate(items as [Dictionary<String, String>]){
                    let medal = Medal(name: hash["name"]!,
                        family: MedalFamily(rawValue: hash["family"]!)!,
                        type: MedalType(rawValue: hash["type"]!)!)
                    medals.append(medal)
                }
            }
        }
    }
}

