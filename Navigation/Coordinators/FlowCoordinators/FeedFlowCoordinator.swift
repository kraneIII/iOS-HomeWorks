import UIKit
import Foundation

class FeedFlowCoordinator: FeedBaseCoordinator {
    
    var parentCoordinator: MainBaseCoordinator?
    lazy var rootViewController: UIViewController = UIViewController()
    lazy var navigationController = UINavigationController()
    
    func start()-> UIViewController {
        let feedModel = FeedViewModel()
        rootViewController = UINavigationController(rootViewController: FeedViewController(feedModel: feedModel, coordinator: self))
        
        return rootViewController
    }
    
    func switchTabBar() {
        parentCoordinator?.moveTo(flow: .feed)
        
    }
    
    func moveToSecondScreen() {
        
        let postController = PostViewController(coordinator: self)
        
        rootViewController?.pushViewController(postController, animated: true)
    }
}
