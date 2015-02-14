import Foundation

class Game {
    var medalSet:MedalSet
    var medalAssortment:MedalAssortment
    var medalCollection:MedalCollection
    var lottery:Lottery
    var drawCount = 0
        
    init() {
        medalSet = MedalSet()
        medalSet.createSet()
        
        medalAssortment = MedalAssortment()
        medalAssortment.loadAssortment()
        
        medalCollection = MedalCollection(medalSet: medalSet)
        
        lottery = Lottery(medalSet: medalSet, medalAssortment: medalAssortment)

    }
    
    func start() {
        
    }
    
    func drawPackage() -> [Medal] {
        let medals =  lottery.drawPackage()
        medalCollection.addMedal(medals[0])
        medalCollection.addMedal(medals[1])
        medalCollection.printColletionStats()
        drawCount++
        return medals
    }
    
    var isCollectionCompleted:Bool {
        return medalCollection.isCompleted
    }
}