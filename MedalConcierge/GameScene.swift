import SpriteKit

class GameScene: SKScene {
    
    struct Constants {
        static let backgroundQueue = dispatch_queue_create("com.mizyki-medalconcierge.backgroundQueue", DISPATCH_QUEUE_SERIAL)
    }
    
    let game = Game()
    
    // MARK: layer properties
    let backgroundLayer = SKNode()
    let mainLayer = SKNode()
    let foregroundLayer = SKNode()
    
    let medalNode1 = MedalNode(circleOfRadius: 80)
    let medalNode2 = MedalNode(circleOfRadius: 80)
    
    var medalCollectionNode:MedalCollectionNode!
    var drawCountLabel:SKLabelNode!
    
    // MARK: Initializers
    
    override init(size: CGSize) {
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("GameScene does not support NSCoding. Use loadSceneAssetsWithCompletionHandler(_:) instead.")
    }
    
    private func setup() {
        loadBackgroundLayer()
        loadMainLayer()
        loadForegroundLayer()
    }
    
    private func loadBackgroundLayer() {
        addChild(backgroundLayer)
        let backgroundSprite = SKSpriteNode(color: UIColor.blackColor(), size: size)
        backgroundLayer.addChild(backgroundSprite)
    }
    
    private func loadMainLayer() {
        addChild(mainLayer)
        
        let collectionContainer = SKSpriteNode(color: UIColor.paperColorPurple700(), size: CGSize(width: size.width, height: 100.0))
        collectionContainer.position = CGPoint(x: 0, y: (size.height - collectionContainer.size.height) / 2)
        
        addMedalCollectionNode(collectionContainer)
        
        let footerContainer = SKSpriteNode(color: UIColor.paperColorPurple700(), size: CGSize(width: size.width, height: 40.0))
        footerContainer.position = CGPoint(x: 0, y: -(size.height - footerContainer.size.height) / 2)
        
        let mainContainer = SKSpriteNode(color: UIColor.paperColorPurple800(), size: CGSize(width: size.width, height: size.height - collectionContainer.size.height - footerContainer.size.height))
        mainContainer.position = CGPoint(x: 0, y: -(collectionContainer.size.height - footerContainer.size.height) / 2)
        
        addMedalNode1(mainContainer)
        addMedalNode2(mainContainer)

        mainLayer.addChild(mainContainer)
        mainLayer.addChild(collectionContainer)
        mainLayer.addChild(footerContainer)
    }
    
    private func loadForegroundLayer() {
        addChild(foregroundLayer)
    }
    
    override func didChangeSize(oldSize: CGSize) {
        println("GameScene#didChangeSize")
        println("oldSize: \(oldSize), size: \(size)")
        super.didChangeSize(oldSize)
    }
    
    override func didMoveToView(view: SKView) {
        println("GameScene#didMoveToView")
        println("size: \(size)")

        super.didMoveToView(view)
        
        setup()
        
//        drawCountLabel = gameLayer.childNodeWithName("drawCountLabel") as! SKLabelNode
        
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
        medalCollectionNode = MedalCollectionNode()
        medalCollectionNode.setup(game.medalCollection, frameSize: collectionContainer.frame.size)
        println("medalCollectionNode:\(medalCollectionNode)")
        collectionContainer.addChild(medalCollectionNode)
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        let medals = game.drawPackage()
        //drawCountLabel.text = "\(game.drawCount)"
        println("draw medals: \(medals)")
        medalNode1.medal = medals[0]
        medalNode2.medal =  medals[1]
        
        medalCollectionNode.updateCollection()
    }
    
    override func touchesCancelled(touches: Set<NSObject>, withEvent event: UIEvent!) {
        touchesEnded(touches, withEvent: event)
    }
    
    // MARK: Asset Pre-loading
    
    class func loadSceneAssetsWithCompletionHandler(size: CGSize, completionHandler: GameScene -> Void) {
        dispatch_async(Constants.backgroundQueue) {
            let loadedScene = GameScene(size: size)
            loadedScene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            // loading stuff here
            dispatch_async(dispatch_get_main_queue()) { completionHandler(loadedScene) }
        }
    }
}
