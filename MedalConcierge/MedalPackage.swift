import Foundation

class MedalPackage {
    var assortNo:String
    var packageNo:String
    var medalNames:[String]
    
    init(assortNo:String, packageNo:String, medalNames:[String]) {
        self.assortNo = assortNo
        self.packageNo = packageNo
        self.medalNames = medalNames
    }
}