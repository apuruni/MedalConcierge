import SpriteKit

class GameScene: SKScene {
    
    let game = Game()
    
    let medalNode1 = MedalNode(circleOfRadius: 80)
    let medalNode2 = MedalNode(circleOfRadius: 80)
    
    var medalCollectionNode:MedalCollectionNode!
    var drawCountLabel:SKLabelNode!
    
    override func didMoveToView(view: SKView) {
        
        let backgroundLayer = self.childNodeWithName("backgroundLayer") as! SKSpriteNode
        
        let gameLayer = self.childNodeWithName("gameLayer") as! SKSpriteNode
        
        
        let medalContainer = gameLayer.childNodeWithName("medalContainer") as! SKSpriteNode
        println("medalContainer:\(medalContainer)")
        medalContainer.color = UIColor.paperColorCyan600()

        addMedalNode1(medalContainer)
        addMedalNode2(medalContainer)
        
        let collectionContainer = gameLayer.childNodeWithName("collectionContainer") as! SKSpriteNode
        println("collectionContainer:\(collectionContainer)")
        addMedalCollectionNode(collectionContainer)

        drawCountLabel = gameLayer.childNodeWithName("drawCountLabel") as! SKLabelNode
        
        self.backgroundColor = backgroundLayer.color
        
    }
    
    func addMedalNode1(parent:SKNode) {
        medalNode1.position = CGPoint(x: 0, y: parent.frame.height * 0.25)
        parent.addChild(medalNode1)
    }
    
    func addMedalNode2(parent:SKNode) {
        medalNode2.position = CGPoint(x: 0, y: parent.frame.height * -0.25)
        parent.addChild(medalNode2)
    }
    
    func addMedalCollectionNode(collectionContainer:SKNode) {
        medalCollectionNode = MedalCollectionNode(rectOfSize: collectionContainer.frame.size)
        medalCollectionNode.setup(game.medalCollection)
        println("medalCollectionNode:\(medalCollectionNode)")
        collectionContainer.addChild(medalCollectionNode)
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        let medals = game.drawPackage()
        drawCountLabel.text = "\(game.drawCount)"
        println("draw medals: \(medals)")
        medalNode1.medal = medals[0]
        medalNode2.medal =  medals[1]
        
        medalCollectionNode.updateCollection()
    }
    
    override func touchesCancelled(touches: Set<NSObject>, withEvent event: UIEvent!) {
        touchesEnded(touches, withEvent: event)
    }
}
