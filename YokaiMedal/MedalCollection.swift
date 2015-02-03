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
                    let name = hash["name"]
                    let family =  MedalFamily(rawValue: hash["family"]!)!
                    let type = MedalType(rawValue: hash["type"]!)!
                    let probability:Double = (hash["probability"]! as NSString).doubleValue
                    let medal = Medal(name: name!,
                                      family: family,
                                      type: type,
                                      probability: probability
                                    )
                    medals.append(medal)
                }
            }
        }
    }
}
