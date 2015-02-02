//
//  MedalCollectionTests.swift
//  YokaiMedal
//
//  Created by Apurune on 2015/02/02.
//  Copyright (c) 2015年 Apurune. All rights reserved.
//

import Foundation
import YokaiMedal
import XCTest

class MedalCollectionTests: XCTestCase {
    func testCreateCollection() {
        let collection = MedalCollection()
        collection.createCollection()
        XCTAssert(true, "Pass")
    }
}