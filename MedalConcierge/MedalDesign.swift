import Foundation
import UIKit

enum MedalDesign: String, Printable, Hashable {
    case Normal = "Normal" // ノーマルメダル
    case Hologram = "Hologram" // ホログラム
    
    var description: String {
        get {
            return rawValue
        }
    }
    
    var normalImageName: String? {
        get {
            switch self {
            case .Normal:
                return nil
            case .Hologram:
                return "MedalDesign_Hologram"
            }
        }
    }
    
    var miniImageName: String? {
        get {
            switch self {
            case .Normal:
                return nil
            case .Hologram:
                return "MedalDesign_Hologram"
            }
        }
    }
    
    var hashValue: Int {
        return rawValue.hashValue
    }
}

func == (lhs: MedalDesign, rhs: MedalDesign) -> Bool {
    return lhs.rawValue == rhs.rawValue
}
