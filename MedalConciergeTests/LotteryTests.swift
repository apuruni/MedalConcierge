import MedalConcierge
import XCTest

class LotteryTests : XCTestCase {
    func testDraw() {
        let collection = MedalCollection()
        collection.createCollection()
        XCTAssertEqual(collection.medals.count, 20)
        
        let lot = Lottery(collection: collection)
        
        var stats = [String: Int]()
        // for i in 1...10000 {
        for i in 1...100 {
            var medal = lot.draw()
            // println("\(medal!.description)")
            if let stat = stats[medal!.name] {
                stats[medal!.name] = stat + 1
            } else {
                stats[medal!.name] = 1
            }
        }
        
        for medal in collection.medals {
            println("\(medal.description) -> \(stats[medal.name]!)")
        }
    }
}