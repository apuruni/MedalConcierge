import Foundation

class Medal: Printable {
    let name:String
    let family:MedalFamily
    let type:MedalType
    
    var description: String {
        return "name: \(name), family: \(family.description), type: \(type.description)"
    }
    
    init(name:String, family:MedalFamily, type:MedalType){
        self.name = name
        self.family = family
        self.type = type
    }
}