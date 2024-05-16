import Foundation
import UIKit

struct UserPhotos {
    let photoViewOne: UIImage
    let photoViewTwo: UIImage
    let photoViewThree: UIImage
    let photoViewForth: UIImage
    let imageBack: UIImage
}

extension UserPhotos {
    static func userPhotos() -> [UserPhotos] {[
    
        UserPhotos(photoViewOne: UIImage(named: "dotaUpdate")!, photoViewTwo: UIImage(named: "Congratulations")!, photoViewThree: UIImage(named: "Morning")!, photoViewForth: UIImage(named: "Win")!,
                   imageBack: UIImage(systemName: "arrowshape.right.fill")!),
    ]}
}
