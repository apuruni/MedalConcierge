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

        coverNode = SKShapeNode(circleOfRadius: MEDAL_IN_COLLECTION_RADIUS)
        coverNode.fillColor = UIColor.paperColorGray500()
        coverNode.alpha = 0.78
        self.addChild(coverNode)

        countLabel.fontSize = 14
        countLabel.fontName = "Avenir Next Bold"
        countLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.Center
        self.addChild(countLabel)
    }
}