import UIKit
import Foundation

class Checker {
    
    static var shared = Checker()
    
    private let login: String = ""
    private let password: String = "some"
    
    private init() {}
    
    func check(loginn: String , passwordd: String ) -> Bool {
        
        if loginn == login && passwordd == password {
            return true
        }
        
        return false
        
    }
    
}
