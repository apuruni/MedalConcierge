import Foundation

class MedalCollection {
    let medalSet: MedalSet
    var collection = [String:Int]()
    
    init(medalSet: MedalSet){
        self.medalSet = medalSet
        initCollection()
    }
    
    private func initCollection() {
        collection.removeAll(keepCapacity: true)
        for medal in medalSet.medals {
            collection[medal.name] = 0
        }
    }
    
    func addMedal(medal: Medal) {
        collection[medal.name] = collection[medal.name]! + 1
    }
    
    var isCompleted: Bool {
        var completed = true
        for (name, count) in collection {
            if count == 0 {
                completed = false
                break
            }
        }
        return completed
    }
    
    var medalCount: Int {
        var total = 0
        for (name, count) in collection {
            total += count
        }
        return total
    }
    
    func printColletionStats() {
        for (name, count) in collection {
            println("\(name) : \(count)")
        }
        println("completed: \(isCompleted). (total : \(medalCount))")
    }
}
