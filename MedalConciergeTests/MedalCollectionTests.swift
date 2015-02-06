import Foundation
import MedalConcierge
import XCTest

class MedalCollectionTests: XCTestCase {
    func testCreateCollection() {
        let medalSet = MedalSet()
        medalSet.createSet()
        XCTAssertEqual(medalSet.medals.count, 20)
        
        for medal:Medal in medalSet.medals {
            println(medal.description)
        }
    }
}