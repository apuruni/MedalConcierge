import Foundation

class Medal: Printable {
    let name:String
    let family:MedalFamily
    let type:MedalType
    let design:MedalDesign
    let numberInSet:Int
        
    var description: String {
        get {
            return "name: \(name), family: \(family.rawValue), type: \(type.rawValue), design: \(design), numberInSet:\(numberInSet)"
        }
    }
    
    init(name:String, family:MedalFamily, type:MedalType, design:MedalDesign, numberInSet:Int){
        self.name = name
        self.family = family
        self.type = type
        self.design = design
        self.numberInSet = numberInSet
    }
}
