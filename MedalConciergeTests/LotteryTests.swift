import MedalConcierge
import XCTest

class LotteryTests : XCTestCase {
    func testDraw() {
        let medalSet = MedalSet()
        medalSet.createSet()
        XCTAssertEqual(medalSet.medals.count, 20)
        
        let lot = Lottery(medalSet: medalSet)
        
        var stats = [String: Int]()
        // for i in 1...10000 {
        for i in 1...100 {
            var medal = lot.drawSingleMedal()
            // println("\(medal!.description)")
            if let stat = stats[medal!.name] {
                stats[medal!.name] = stat + 1
            } else {
                stats[medal!.name] = 1
            }
        }
        
        for medal in medalSet.medals {
            println("\(medal.description) -> \(stats[medal.name]!)")
        }
    }
}