import Foundation
import YokaiMedal
import XCTest

class MedalCollectionTests: XCTestCase {
    func testCreateCollection() {
        let collection = MedalCollection()
        collection.createCollection()
        XCTAssertEqual(collection.medals.count, 20)
        
        for medal:Medal in collection.medals {
            println(medal.description)
        }
    }
}