import Foundation

class Game {
    var medalSet:MedalSet
    var medalCollection:MedalCollection
    var lottery:Lottery
    var drawCount = 0
    
    var medalAssortment:MedalAssortment
    
    init() {
        medalSet = MedalSet()
        medalSet.createSet()
        
        medalCollection = MedalCollection(medalSet: medalSet)
        
        lottery = Lottery(medalSet: medalSet)
        
        medalAssortment = MedalAssortment()
        medalAssortment.loadAssortment()
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
        drawCount++
        return medals
    }
}