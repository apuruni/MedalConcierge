import YokaiMedal
import Foundation
import XCTest

class MedalTests : XCTestCase {
    func testPrintable() {
        let medal = Medal(name: "name1", family: MedalFamily.Purichi, type: MedalType.Legend, probability: 3.56)
        XCTAssertEqual("\(medal.description)", "name: name1, family: Purichi, type: Legend, probability: 3.56")
    }
}
