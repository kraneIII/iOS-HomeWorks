import UIKit
import Foundation
import FirebaseAuth

protocol ChekerServiceProtocol {
    
    func checkCredentials(email: String, password: String, completeon: @escaping (Bool) -> Void)
    
    func sighUp(email: String, password: String, completeon: @escaping (Bool) -> Void)
}

class CheckService: ChekerServiceProtocol {
    
    
    func checkCredentials(email: String, password: String, completeon: @escaping (Bool) -> Void) {
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if error == nil, authResult != nil {
                completeon(true)
            }
            else {
                completeon(false)
            }
        }
    }
    
    func sighUp(email: String, password: String, completeon: @escaping (Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error == nil, authResult != nil {
                completeon(true)
            }
            else {
                completeon(false)
            }
        }
    }
}
