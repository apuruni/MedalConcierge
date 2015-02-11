import Foundation

class MedalAssortment {
    var packages = [MedalPackage]()
    var title:String!
    
    init() {
    }
    
    func loadAssortment() {
        if let data = Dictionary<String, AnyObject>.loadJSONFromBundle("Data/Collection/Shinuchi_assortment"){
            println("assort data:\n \(data)")
            title = data["title"] as String
            println("title = \(title)")
            if let items: AnyObject = data["items"] {
                for(row, hash) in enumerate(items as [Dictionary<String, AnyObject>]){
                    let assortNo = hash["assortNo"] as String
                    let packageNo = hash["packageNo"] as String
                    let medalNames = hash["medalNames"] as [String]

                    let package = MedalPackage(assortNo: assortNo, packageNo: packageNo, medalNames: medalNames)
                    packages.append(package)
                }
            }
        }
    }

}