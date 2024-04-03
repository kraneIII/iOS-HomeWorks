import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    
    
    // MARK: - Layout
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubview(profileHeaderView)
        profileHeaderView.frame = view.frame
    }
    
    // MARK: - Setup
    
    private func setupViewController () {
        view.backgroundColor = .lightGray
        title = "Profile"
    }
    
    // MARK: - ProfileHeaderViewLayout
    private func headerViewLayout() {
        let guide = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            profileHeaderView.leftAnchor.constraint(equalTo: view.leftAnchor),
            profileHeaderView.rightAnchor.constraint(equalTo: view.rightAnchor),
            profileHeaderView.topAnchor.constraint(equalTo: guide.topAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
            
        ])
    }

}




