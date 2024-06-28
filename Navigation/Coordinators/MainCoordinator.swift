import UIKit
import Foundation

enum TabBarFlow {
    
    case feed
    case login

}

class MainCoordinator: MainBaseCoordinator {
    
    var parentCoordinator: MainBaseCoordinator?
    
    lazy var rootViewController: UIViewController = UITabBarController()
    
    lazy var feedCoordanitor: FeedBaseCoordinator = FeedFlowCoordinator()
    
    lazy var loginCoordinator: LoginBaseCoordinator = LoginFlowCoordinator()
    
    func start() -> UIViewController {
        
        let feedViewController = feedCoordanitor.start()
        feedCoordanitor.parentCoordinator = self
        feedViewController.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "square.and.pencil"), tag: 0)
        
        let loginViewController = loginCoordinator.start()
        loginCoordinator.parentCoordinator = self
        loginViewController.tabBarItem = UITabBarItem(title: "Login", image: UIImage(systemName: "person.circle"), tag: 1)
        
        (rootViewController as? UITabBarController)?.viewControllers = [feedViewController, loginViewController]
        
        return rootViewController
    }
    
    func moveTo(flow: TabBarFlow) {
        switch flow {
        case .feed:
            (rootViewController as? UITabBarController)?.selectedIndex = 0
        case .login:
            (rootViewController as? UITabBarController)?.selectedIndex = 1
        }
    }
}
