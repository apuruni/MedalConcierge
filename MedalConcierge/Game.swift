import Foundation

class Game {
    var medalSet: MedalSet
    var lottery: Lottery
    init() {
        medalSet = MedalSet()
        medalSet.createSet()
        
        lottery = Lottery(medalSet: medalSet)
    }
    
    func drawMedal() -> Medal {
        return lottery.draw()!
    }
}