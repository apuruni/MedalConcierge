import Foundation

class Lottery {
    
    var medalSet:MedalSet
    
    init(medalSet: MedalSet){
        self.medalSet = medalSet
    }
    
    func drawSingleMedal() -> Medal? {
        let index = random(100000)
        var total:Double = Double(index) / 1000.0
        for medal in medalSet.medals {
            total = total - medal.probability
            if total <= 0 {
                return medal
            }
        }
        
        return nil
    }
    
    func drawPackage() -> [Medal] {
        var medals = [Medal]()
        medals.append(drawSingleMedal()!)
        medals.append(drawSingleMedal()!)
        
        return medals
    }
    
    func random(max: Int) -> Int {
        return Int(arc4random_uniform(UInt32(max)))
    }
}
