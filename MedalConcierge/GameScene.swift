import SpriteKit

class GameScene: SKScene {
    
    let game = Game()
    
    let medalNode1 = MedalNode(circleOfRadius: 80)
    let medalNode2 = MedalNode(circleOfRadius: 80)
    
    //var medalCollectionNode:MedalCollectionNode
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        if let medalContainer = self.childNodeWithName("medalContainer") as? SKSpriteNode {
            println("medalContainer:\(medalContainer)")
            medalContainer.color = UIColor.paperColorCyan600()
            //medalFrame.runAction(SKAction.colorizeWithColor(UIColor.redColor(), colorBlendFactor: 1, duration: 0.5))

            addMedalNode1(medalContainer)
            addMedalNode2(medalContainer)
        }
        
        if let collectionContainer = self.childNodeWithName("collectionContainer") as? SKSpriteNode {
            println("collectionContainer:\(collectionContainer)")
            addMedalCollectionNode(collectionContainer)
        }
    }
    
    func addMedalNode1(parent:SKNode) {
        medalNode1.fillColor = UIColor.paperColorGreen700()
        medalNode1.position = CGPoint(x: 0, y: parent.frame.height * 0.25)
        parent.addChild(medalNode1)
    }
    
    func addMedalNode2(parent:SKNode) {
        medalNode2.fillColor = UIColor.paperColorGreen700()
        medalNode2.position = CGPoint(x: 0, y: parent.frame.height * -0.25)
        parent.addChild(medalNode2)
    }
    
    func addMedalCollectionNode(collectionContainer:SKNode) {
        let medalCollectionNode = MedalCollectionNode(rectOfSize: collectionContainer.frame.size)
        medalCollectionNode.setup(game.medalCollection)
        println("medalCollectionNode:\(medalCollectionNode)")
        collectionContainer.addChild(medalCollectionNode)
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
    }
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        
    }
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        let medals = game.drawPackage()
        println("draw medals: \(medals)")
        medalNode1.fillColor = medals[0].type.medalColor
        medalNode1.nameLabel.text = medals[0].name
        
        medalNode2.fillColor = medals[1].type.medalColor
        medalNode2.nameLabel.text = medals[1].name
    }
    
    override func touchesCancelled(touches: NSSet!, withEvent event: UIEvent!) {
        touchesEnded(touches, withEvent: event)
    }
}
