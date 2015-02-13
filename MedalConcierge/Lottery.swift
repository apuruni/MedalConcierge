import Foundation

class Lottery {
    
    var medalSet:MedalSet
    var medalAssortment:MedalAssortment
    
    init(medalSet: MedalSet, medalAssortment: MedalAssortment){
        self.medalSet = medalSet
        self.medalAssortment = medalAssortment
    }
    
    func drawPackage() -> [Medal] {
        var medals = [Medal]()
        
        let randIndex = random(medalAssortment.packages.count)
        let medalNames = medalAssortment.packages[randIndex].medalNames
        for name in medalNames {
            medals.append(medalSet.forName(name)!)
        }
        
        return medals
    }
    
    func random(max: Int) -> Int {
        return Int(arc4random_uniform(UInt32(max)))
    }
}
