import Foundation

class Lottery {
    
    var collection:MedalCollection
    
    init(collection: MedalCollection){
        self.collection = collection
    }
    
    func draw() -> Medal? {
        let index = random(100000)
        var total:Double = Double(index) / 1000.0
        for medal in collection.medals {
            total = total - medal.probability
            if total <= 0 {
                return medal
            }
        }
        
        return nil
    }
    
    func random(max: Int) -> Int {
        return Int(arc4random_uniform(UInt32(max)))
    }
}
