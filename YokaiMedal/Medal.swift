import Foundation

class Medal {
    let name:String
    let family:MedalFamily
    let type:MedalType
    
    init(name:String, family:MedalFamily, type:MedalType){
        self.name = name
        self.family = family
        self.type = type
    }
}