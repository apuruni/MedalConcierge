import SpriteKit

let MEDAL_COLLECTION_COLUMS_MAX:Int = 10
let MEDAL_COLLECTION_ROW_SPAN:CGFloat = 20.0
let MEDAL_COLLECTION_COL_SPAN:CGFloat = 5.0
let COUNT_LABEL_HEIGHT:CGFloat = 10.0

class MedalCollectionNode : SKNode {
    var collection:MedalCollection!
    var medalNodes = [MedalMiniNode]()
    var medalCountLabels = [SKLabelNode]()
    
    func setup(collection:MedalCollection, frameSize: CGSize) {
        self.collection = collection
        //self.fillColor = UIColor.paperColorRed200()
        createMedalGrid(frameSize)
    }
    
    func createMedalGrid(frameSize: CGSize) {
        let gridTotalWidth: CGFloat = CGFloat(MEDAL_COLLECTION_COLUMS_MAX - 1) * (MEDAL_IN_COLLECTION_RADIUS * 2 + MEDAL_COLLECTION_COL_SPAN)
        println("gridTotalWidth:\(gridTotalWidth)")
        
        let gridTotalRowCount: Int = collection.medalSet.medals.count / MEDAL_COLLECTION_COLUMS_MAX
        
        for (index, medal) in enumerate(collection.medalSet.medals) {
            let medalNode = MedalMiniNode(circleOfRadius: MEDAL_IN_COLLECTION_RADIUS)
            medalNode.medal = medal
            medalNode.fillColor = medal.type.medalColor
            medalNode.nameLabel.text = medal.name
            
            let row = gridTotalRowCount - index / MEDAL_COLLECTION_COLUMS_MAX - 1
            let column = index % MEDAL_COLLECTION_COLUMS_MAX
            
            let x: CGFloat = (MEDAL_IN_COLLECTION_RADIUS * 2 + MEDAL_COLLECTION_COL_SPAN) * CGFloat(column) - gridTotalWidth / 2
            
            //let x = (CGFloat(column) + 0.5) * MEDAL_IN_COLLECTION_RADIUS * 2 + MEDAL_COLLECTION_COL_SPAN * CGFloat(column + 1) - frameSize.width / 2
            let y = (CGFloat(row) + 0.5) * MEDAL_IN_COLLECTION_RADIUS * 2 + MEDAL_COLLECTION_ROW_SPAN * CGFloat(row + 1) - frameSize.height / 2
            medalNode.position = CGPoint(x: x, y: y)
            
            println("row:\(row), coloum:\(column) - medalNode.position:\(medalNode.position)")

            medalNodes.append(medalNode)
            addChild(medalNode)
            
            let medalCountLabel = medalNode.countLabel
            medalCountLabel.fontSize = 8
            medalCountLabel.fontName = "Herculanum"
            medalCountLabel.verticalAlignmentMode = SKLabelVerticalAlignmentMode.Center
            medalCountLabel.position = CGPoint(x: medalNode.position.x, y: medalNode.position.y - MEDAL_COLLECTION_ROW_SPAN)
            medalCountLabel.text = ""
            medalCountLabels.append(medalCountLabel)
            addChild(medalCountLabel)
            
            println("added medal: \(index)")
        }
    }
    
    func updateCollection() {
        for medalNode in medalNodes {
            if let medalCount = self.collection.collection[medalNode.medal!.name] {
                if medalCount > 0 {
                    medalNode.collected = true
                    medalNode.countLabel.text = "x \(medalCount)"
                }
            }
        }
    }
    
}