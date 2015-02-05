import SpriteKit

class GameScene: SKScene {
    
    let game = Game()
    
    let medalNameLabel = SKLabelNode(text: "NOTHING")
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        if let medalFrame = self.childNodeWithName("medalFrame") as? SKSpriteNode {
            println("medalFrame:\(medalFrame)")
            medalFrame.color = UIColor.paperColorCyan600()
            //medalFrame.runAction(SKAction.colorizeWithColor(UIColor.redColor(), colorBlendFactor: 1, duration: 0.5))
        }
    
        addMedalNode()
    }
    
    func addMedalNode() {
        let medalNode = SKShapeNode(circleOfRadius: 120)
        medalNode.fillColor = UIColor.paperColorGreen700()
        medalNode.position = CGPoint(x: self.frame.midX, y: self.frame.height * 0.67)
        self.addChild(medalNode)
        
        medalNameLabel.fontSize = 32
        medalNameLabel.fontColor = UIColor.whiteColor()
        medalNameLabel.position = CGPoint(x: 0, y: 0)
        medalNode.addChild(medalNameLabel)
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        
    }
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
        
    }
    override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
        let medal = game.drawMedal()
        println("draw a medal: \(medal)")
        medalNameLabel.text = medal.name
    }
    
    override func touchesCancelled(touches: NSSet!, withEvent event: UIEvent!) {
        touchesEnded(touches, withEvent: event)
    }
}
