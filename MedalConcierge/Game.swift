import Foundation

class Game {
    var medalSet: MedalSet
    var medalCollection: MedalCollection
    var lottery: Lottery
    init() {
        medalSet = MedalSet()
        medalSet.createSet()
        
        medalCollection = MedalCollection(medalSet: medalSet)
        
        lottery = Lottery(medalSet: medalSet)
    }
    
    func drawMedal() -> Medal {
        let medal =  lottery.draw()!
        medalCollection.addMedal(medal)
        medalCollection.printColletionStats()
        return medal
    }
}