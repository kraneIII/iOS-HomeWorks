import UIKit
import Foundation

final class FeedViewModel: CheckKey {
    
    var currentState: ((State) -> Void)?
    
    var state: State = .initial {
        didSet {
            print(state)
            currentState?(state)
        }
    }
    
    let secretWord = "Word"
    
    
    func check(word: String)->Bool {
        word == secretWord
    }
    
    func changeStateIfNeeded(word: String) {
        state = check(word: word) ? .confirmed : .error
    }
}
