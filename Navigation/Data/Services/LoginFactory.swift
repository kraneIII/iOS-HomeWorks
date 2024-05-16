import UIKit
import Foundation

protocol LoginFactory {
    func makeLoginInsprector() -> LoginInspector
}

struct MyLoginFactory: LoginFactory {
    func makeLoginInsprector() -> LoginInspector {
        let inspector = LoginInspector()
        return inspector
    }
    
    
}
