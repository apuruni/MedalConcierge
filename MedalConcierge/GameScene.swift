import SpriteKit

class GameScene: SKScene {
    
    let game = Game()
    
    let medalNode1 = MedalNode(circleOfRadius: 80)
    let medalNode2 = MedalNode(circleOfRadius: 80)
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        if let medalFrame = self.childNodeWithName("medalFrame") as? SKSpriteNode {
            println("medalFrame:\(medalFrame)")
            medalFrame.color = UIColor.paperColorCyan600()
            //medalFrame.runAction(SKAction.colorizeWithColor(UIColor.redColor(), colorBlendFactor: 1, duration: 0.5))

            addMedalNode1(medalFrame)
            addMedalNode2(medalFrame)
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
