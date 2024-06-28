import UIKit
import Foundation
import AVFAudio
enum Errors: Error {
    
    case notFound
    case uknowned
    case badRequest
    
}
class DoTryCatch: UIViewController {

    func block() {
        let alert = UIAlertController(title: "Audio", message: "There is no such audio", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(action)
        
        do {
            let audio = try AVAudioPlayer(contentsOf: URL.applicationDirectory)
            
            audio.play()
        }
        catch {
            self.present(alert, animated: true)
            print("this sound is not found")
            }
        }
    }

