import UIKit
import Foundation

typealias Action = (()->Void)

protocol FlowCoordinator: AnyObject {
    var parentCoordinator: MainBaseCoordinator? { get set }
}

protocol Coordinator: FlowCoordinator {
    
    var rootViewController: UIViewController { get set }
    
    func start() -> UIViewController

}

extension Coordinator {
    
    var rootViewController: UINavigationController? { get
        {
        (rootViewController as? UINavigationController)
        }
    }
}

//MARK: - TabBar

protocol FeedBaseCoordinator: Coordinator {
    func switchTabBar()
    func moveToSecondScreen()
}

protocol LoginBaseCoordinator: Coordinator {
    func switchTabBar()
    func moveToSecondScreen()
}

protocol MainBaseCoordinator: Coordinator {
    var feedCoordanitor: FeedBaseCoordinator { get }
    var loginCoordinator: LoginBaseCoordinator { get }
    func moveTo(flow: TabBarFlow)
}
