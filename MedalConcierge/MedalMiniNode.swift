import SpriteKit

let MEDAL_IN_COLLECTION_RADIUS:CGFloat = 12.0

class MedalMiniNode: MedalNode {
    var countLabel = SKLabelNode()
    var coverNode:SKShapeNode!
    
    var collected:Bool = false {
        didSet {
            if collected {
                coverNode.hidden = true
                countLabel.hidden = false
            } else {
                coverNode.hidden = false
                countLabel.hidden = true
            }
        }
    }
    
    override init() {
        super.init()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        nameLabel.hidden = true
        nameLableBackgroud.hidden = true

        coverNode = SKShapeNode(circleOfRadius: radius)
        coverNode.fillColor = UIColor.paperColorGray500()
        coverNode.alpha = 0.78
        coverNode.lineWidth = 0
        coverNode.zPosition  = 900
        self.addChild(coverNode)

        countLabel.fontSize = 14
        countLabel.fontName = "Herculanum"
        countLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.Center
        countLabel.zPosition = 200
        self.addChild(countLabel)
    }
    
    override var radius:CGFloat {
        return MEDAL_IN_COLLECTION_RADIUS
    }
    
    override var medalDesignImageName:String? {
        return medal?.design.miniImageName
    }

}