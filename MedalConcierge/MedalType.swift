import Foundation
import UIKit

enum MedalType: String, Printable {
    case Normal = "Normal" // ノーマルメダル
    case Zero = "Zero" // 零メダル
    case Classic = "Classic" // 古典メダル
    case Skill = "Skill" // 技メダル
    case Legend = "Legend" // レジェンドメダル
    
    var description: String {
        get {
            return rawValue
        }
    }
    
    var medalColor: UIColor {
        get {
            switch self {
            case .Normal:
                return UIColor.paperColorGray700()
            case .Zero:
                return UIColor.paperColorGreen700()
            case .Classic:
                return UIColor.paperColorRed700()
            case .Skill:
                return UIColor.paperColorBlue700()
            case .Legend:
                return UIColor.paperColorYellow700()
            }
        }
    }
}
