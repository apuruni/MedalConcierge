import Foundation

class Game {
    var medalCollection: MedalCollection
    var lottery: Lottery
    init() {
        medalCollection = MedalCollection()
        medalCollection.createCollection()
        
        lottery = Lottery(collection: medalCollection)
    }
    
    func drawMedal() -> Medal {
        return lottery.draw()!
    }
}