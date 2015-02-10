import SpriteKit

let MEDAL_IN_COLLECTION_RADIUS:CGFloat = 10.0

class MedalMiniNode: MedalNode {
    var coverNode:SKShapeNode!
    var collected:Bool = false {
        didSet {
            if collected {
                coverNode.hidden = true
            } else {
                coverNode.hidden = false
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
        coverNode = SKShapeNode(circleOfRadius: MEDAL_IN_COLLECTION_RADIUS)
        coverNode.fillColor = UIColor.paperColorGray500()
        coverNode.alpha = 0.78
        self.addChild(coverNode)
        
        nameLabel.hidden = true
    }
}