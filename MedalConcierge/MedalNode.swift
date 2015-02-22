//
//  MedalNode.swift
//  MedalConcierge
//
//  Created by Apurune on 2/7/15.
//  Copyright (c) 2015 Apurune. All rights reserved.
//

import Foundation
import SpriteKit

let MEDAL_DRAW_RADIUS:CGFloat = 80.0

class MedalNode: SKShapeNode {
    var medal:Medal? = nil { didSet { medalChanged() } }
    let nameLabel = SKLabelNode(text: "EMPTY")
    var nameLableBackgroud:SKShapeNode!
    var designNode:SKShapeNode!
    
    static var designTextures = Dictionary<MedalDesign, SKTexture>()
    
    override init() {
        super.init()
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.fillColor = defaultFillColor
        self.lineWidth = 0
        
        designNode = SKShapeNode(circleOfRadius: radius * 0.9)
        designNode.position = CGPoint(x: 0, y: 0)
        designNode.fillColor = UIColor.whiteColor()
        designNode.lineWidth = 0
        designNode.zPosition = 10
        addChild(designNode)
        
        nameLableBackgroud = SKShapeNode(rectOfSize: CGSize(width: radius * 1.8, height: 30))
        nameLableBackgroud.lineWidth = 0
        nameLableBackgroud.zPosition = 20
        designNode.addChild(nameLableBackgroud)

        nameLabel.fontSize = 16
        nameLabel.alpha = 0.87
        nameLabel.fontColor = UIColor.whiteColor()
        nameLabel.position = CGPoint(x: 0, y: 0)
        nameLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.Center
        nameLabel.zPosition = 30
        addChild(nameLabel)
        
        medalChanged()
    }
    
    private func medalChanged() {
        if let medal = self.medal {
            fillColor = medal.type.medalFrameColor
            nameLableBackgroud.fillColor = medal.type.medalFrameColor
            nameLabel.text = medal.name
            
            if let texture =  MedalNode.designTextures[medal.design] {
                designNode.fillTexture = texture
                designNode.fillColor = UIColor.whiteColor()
            } else {
                designNode.fillTexture = nil
                designNode.fillColor = medal.type.medalColor
            }
        } else {
            designNode.fillTexture = nil
            designNode.fillColor = defaultFillColor
        }
    }
    
    var defaultFillColor:UIColor {
        return UIColor.paperColorGray300()
    }
    
    var radius:CGFloat {
        return MEDAL_DRAW_RADIUS
    }
    
    var medalDesignImageName:String? {
        return medal?.design.normalImageName
    }
    
    static func LoadMedalDesignAssets() {
        let atlas = SKTextureAtlas(named: "Medal")
        designTextures[MedalDesign.Hologram] = atlas.textureNamed(MedalDesign.Hologram.normalImageName!)
    }
}
