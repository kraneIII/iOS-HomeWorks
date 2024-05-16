import UIKit
import Foundation

protocol UserService {
    func checkLogin(login: User ) -> User?
}

class CurrentUserService: UserService {
    
    var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func checkLogin(login: User) -> User? {
        
        if login.login == user.login {
            return user
        }
        return nil
        
    }
}

class TestUserService: UserService {
    
    var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func checkLogin(login: User) -> User? {
        
        if login.login == user.login {
            return user
        }
        return nil
        
    }
}

