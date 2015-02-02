import Foundation

enum MedalType: String, Printable {
    case Normal = "Normal" // ノーマルメダル
    case Zero = "Zero" // 零メダル
    case Classic = "Classic" // 古典メダル
    case Skill = "Skill" // 技メダル
    case Legend = "Legend" // レジェンドメダル
    
    var description: String {
        return rawValue
    }
    
}