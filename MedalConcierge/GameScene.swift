import SpriteKit

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        
        if let medalFrame = self.childNodeWithName("medalFrame") as? SKSpriteNode {
            println("medalFrame:\(medalFrame)")
            medalFrame.color = UIColor.paperColorCyan600()
            //medalFrame.runAction(SKAction.colorizeWithColor(UIColor.redColor(), colorBlendFactor: 1, duration: 0.5))
        }
    
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
