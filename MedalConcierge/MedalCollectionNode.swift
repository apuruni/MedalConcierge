import SpriteKit

class MedalCollectionNode : SKShapeNode {
    var collection:MedalCollection!
    var medalNodes = [SKShapeNode]()
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup(collection:MedalCollection) {
        self.collection = collection
        self.fillColor = UIColor.paperColorBrown300()
        createMedalGrid()
    }
    
    func createMedalGrid() {
        
    }
}