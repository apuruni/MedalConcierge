//
//  MedalNode.swift
//  MedalConcierge
//
//  Created by Apurune on 2/7/15.
//  Copyright (c) 2015 Apurune. All rights reserved.
//

import Foundation
import SpriteKit

class MedalNode: SKShapeNode {
    let nameLabel = SKLabelNode(text: "EMPTY")
    
    override init() {
        super.init()
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup() {
        fillColor = UIColor.paperColorGreen700()
        
        nameLabel.fontSize = 16
        nameLabel.alpha = 0.87
        nameLabel.fontColor = UIColor.whiteColor()
        nameLabel.position = CGPoint(x: 0, y: 0)
        nameLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.Center
        addChild(nameLabel)
    }
}
