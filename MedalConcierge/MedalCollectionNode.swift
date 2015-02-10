import SpriteKit

let MEDAL_COLLECTION_COLUMS_MAX:Int = 10

class MedalCollectionNode : SKShapeNode {
    var collection:MedalCollection!
    var medalNodes = [MedalMiniNode]()
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup(collection:MedalCollection) {
        self.collection = collection
        self.fillColor = UIColor.paperColorRed200()
        createMedalGrid()
    }
    
    func createMedalGrid() {
        for (index, medal) in enumerate(collection.medalSet.medals) {
            let medalNode = MedalMiniNode(circleOfRadius: MEDAL_IN_COLLECTION_RADIUS)
            medalNode.medal = medal
            medalNode.fillColor = medal.type.medalColor
            medalNode.nameLabel.text = medal.name
            
            let row = index / MEDAL_COLLECTION_COLUMS_MAX
            let column = index % MEDAL_COLLECTION_COLUMS_MAX
            
            let x = (CGFloat(column) + 0.5) * MEDAL_IN_COLLECTION_RADIUS *  3 - self.frame.size.width / 2
            let y = (CGFloat(row) + 0.5) * MEDAL_IN_COLLECTION_RADIUS * 3 - self.frame.size.height / 2
            medalNode.position = CGPoint(x: x, y: y)
            
            medalNodes.append(medalNode)
            addChild(medalNode)
            
            println("added child \(index)")
        }
    }
    
    func updateCollection() {
        for medalNode in medalNodes {
            if let medalCount = self.collection.collection[medalNode.medal!.name] {
                if medalCount > 0 {
                    medalNode.collected = true
                    medalNode.countLabel.text = "\(medalCount)"
                }
            }
        }
    }
    
}