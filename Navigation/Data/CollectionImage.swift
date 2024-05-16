import UIKit
import Foundation

let imageExample = UIImage(named: "Win")
let imageEx = UIImage(named: "Morning")
let imageExam = UIImage(named: "Congratulations")
var photoCollection: [UIImage] = [imageExample!, imageEx!, imageExam!]


struct CollectionImage {
    
    let id: String
    let collectionImage: UIImage
    
}

extension CollectionImage {
    
    static func collectionImage() -> [CollectionImage] {
        [CollectionImage](repeating: CollectionImage(id: "Win", collectionImage: UIImage(named: "Win")!), count: 8)
    }
}
