import MedalConcierge
import Foundation
import XCTest

class MedalTests : XCTestCase {
    func testPrintable() {
        let medal = Medal(name: "name1", family: MedalFamily.Purichi, type: MedalType.Legend, design: MedalDesign.Hologram, numberInSet: 1)
        XCTAssertEqual("\(medal.description)", "name: name1, family: Purichi, type: Legend, design: Hologram, numberInSet: 1")
    }
}
