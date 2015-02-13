import MedalConcierge
import XCTest

class LotteryTests : XCTestCase {
    func testDraw() {
        let medalSet = MedalSet()
        medalSet.createSet()
        XCTAssertEqual(medalSet.medals.count, 20)
        
        let medalAssortment = MedalAssortment()
        medalAssortment.loadAssortment()
        XCTAssertEqual(medalAssortment.packages.count, 72)
        
        let lot = Lottery(medalSet: medalSet, medalAssortment: medalAssortment)
        
        var stats = [String: Int]()
        // for i in 1...10000 {
        for i in 1...100 {
            var medals:[Medal] = lot.drawPackage()
            XCTAssertEqual(medals.count, 2)
            // println("\(medal!.description)")
            for medal in medals {
                if let stat = stats[medal.name] {
                    stats[medal.name] = stat + 1
                } else {
                    stats[medal.name] = 1
                }
            }
        }
        
        for medal in medalSet.medals {
            println("\(medal.description) -> \(stats[medal.name]!)")
        }
    }
}