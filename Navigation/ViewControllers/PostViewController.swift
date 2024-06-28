
import UIKit

class PostViewController: UIViewController {
    
    var coordinator: FeedBaseCoordinator?
    
    
    var postTitle: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        
        let barButton = UIBarButtonItem(barButtonSystemItem: .add, target: self , action: #selector(modal) )
        
        navigationItem.rightBarButtonItem = barButton
        
    }
    
    init(coordinator: FeedBaseCoordinator) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupViewController() {
        title = "Something"
        view.backgroundColor = .systemPurple
    }
    
    
    
    // MARK: - ObkectiveC Func
    
    
        @objc func modal (_ sender: UIBarButtonItem) {
            let infoViewController = InfoViewController()
    
            infoViewController.modalTransitionStyle = .coverVertical
    
            present(infoViewController, animated: true)    
        }
}
