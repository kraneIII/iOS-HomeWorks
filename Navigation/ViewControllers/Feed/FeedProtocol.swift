import Foundation

protocol CheckKey {
    
    var currentState: ((State)->Void)? {get set}
    var state: State {get set}
    func check(word: String)->Bool
    func changeStateIfNeeded(word: String)

}

enum State {
    case initial
    case confirmed
    case error
}
