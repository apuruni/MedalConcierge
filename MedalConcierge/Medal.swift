import Foundation

class Medal: Printable {
    let name:String
    let family:MedalFamily
    let type:MedalType
    let probability:Double
    
    var description: String {
        get {
            return "name: \(name), family: \(family.rawValue), type: \(type.rawValue), probability: \(probability)"
        }
    }
    
    init(name:String, family:MedalFamily, type:MedalType, probability:Double){
        self.name = name
        self.family = family
        self.type = type
        self.probability = probability
    }
}
