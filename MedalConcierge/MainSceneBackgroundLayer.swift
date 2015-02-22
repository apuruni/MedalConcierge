//
//  MainSceneBackgroundLayer.swift
//  MedalConcierge
//
//  Created by Apurune on 2/19/15.
//  Copyright (c) 2015 Apurune. All rights reserved.
//

import Foundation
import SpriteKit
class MainSceneBackgroundLayer : SKSpriteNode {
    override init() {
        super.init()
        setup()
    }

    override init(texture: SKTexture!, color: UIColor!, size: CGSize) {
            super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Does not support NSCoding.")
    }
    
    private func setup() {
//        let backgroudColorNode = SKShapeNode(rectOfSize: frame.size)
//        backgroudColorNode.fillColor = UIColor.paperColorPurple800()
//        addChild(backgroudColorNode)
    }
}
