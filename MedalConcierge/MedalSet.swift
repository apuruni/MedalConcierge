import Foundation

class MedalSet {
    var title:String!
    var medals = [Medal]()
    
    init() {
        
    }
    
    func createSet() {
        if let data = Dictionary<String, AnyObject>.loadJSONFromBundle("Data/Collection/Shinuchi"){
            println("collection data:\n \(data)")
            title = data["title"] as String
            println("title = \(title)")
            if let items: AnyObject = data["items"] {
                for(row, hash) in enumerate(items as [Dictionary<String, String>]){
                    let name = hash["name"]
                    let family =  MedalFamily(rawValue: hash["family"]!)!
                    let type = MedalType(rawValue: hash["type"]!)!
                    let design = MedalDesign(rawValue: hash["design"]!)!
                    let medal = Medal(name: name!,
                                      family: family,
                                      type: type,
                                      design: design
                    )
                    medals.append(medal)
                }
            }
        }
    }
    
    func forName(name: String) -> Medal? {
        for medal in medals {
            if medal.name == name {
                return medal
            }
        }
        return nil
    }
}
