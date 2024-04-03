
import UIKit

class InfoViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        layout()
    }
    // MARK: - Button
    
    private lazy var button: UIButton = {
        let modalButton = UIButton()
        modalButton.translatesAutoresizingMaskIntoConstraints = false
        modalButton.layer.cornerRadius = 10
        modalButton.backgroundColor = .purple
        modalButton.setTitle("alertMessage", for: .normal)
        modalButton.setTitleColor(.cyan , for: .normal)
        modalButton.addTarget(self, action: #selector(alertButtonTapped), for: .touchUpInside)
        modalButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        modalButton.layer.shadowOpacity = 0.7
        modalButton.layer.shadowRadius = 3
        return modalButton
    }()
    
    
    // MARK: - Layout
    private func layout() {
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 100),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
    
    // MARK: - Setup
    
    private func setupViewController() {
        title = "Something"
        view.backgroundColor = .white
        
    }
    // MARK: - Alert
    
    @objc func alertButtonTapped (_ sender: UIButton){
        
        let alertMessage = UIAlertController(title: "goodVibes", message: "helloWRLD", preferredStyle: .alert)
        let ok = UIAlertAction(title: "ok", style: .default, handler: { action in
            print("OK")
        })
        let cancel = UIAlertAction(title: "cancel", style: .cancel, handler: { action in
            print("CANCEL")
        })
        
        alertMessage.addAction(ok)
        alertMessage.addAction(cancel)

        self.present(alertMessage, animated: true)
        
        
        
    }
    
}
