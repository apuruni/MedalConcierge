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
    
    func drawSingleMedal() -> Medal {
        let medal =  lottery.drawSingleMedal()!
        medalCollection.addMedal(medal)
        medalCollection.printColletionStats()
        return medal
    }
    
    func drawPackage() -> [Medal] {
        let medals =  lottery.drawPackage()
        medalCollection.addMedal(medals[0])
        medalCollection.addMedal(medals[1])
        medalCollection.printColletionStats()
        return medals
    }
}