import UIKit
import Foundation

class LoginFlowCoordinator: LoginBaseCoordinator {
    
    var parentCoordinator: MainBaseCoordinator?
    lazy var rootViewController: UIViewController = UIViewController()
    lazy var navigationController = UINavigationController()
    
    func start()-> UIViewController {
        rootViewController = UINavigationController(rootViewController: LogInViewController(coordinator: self))
        
        return rootViewController
    }
    
    func switchTabBar() {
        parentCoordinator?.moveTo(flow: .login)
    }

    func moveToSecondScreen() {
        let profileController = ProfileViewController(coordinator: self)
        rootViewController?.pushViewController(profileController, animated: true)
    }
    
    
}
