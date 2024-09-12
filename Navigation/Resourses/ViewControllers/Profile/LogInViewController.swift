import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - StackView
    
    private lazy var stackView: UIStackView = { [unowned self] in
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        stackView.axis = .vertical
        stackView.spacing = 0.5
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        
        
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(secondTextField)
        return stackView
    }()
    
    // MARK: - LogoView
    
    private lazy var logoView: UIImageView = {
        let logoView = UIImageView(image: UIImage(named: "mainLogo" ))
        logoView.translatesAutoresizingMaskIntoConstraints = false
        return logoView
    }()
    
    // MARK: - TextField
    
    private lazy var textField: UITextField = {
        
        let textField = UITextField()
        textField.placeholder = "   Email or phone"
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.tintColor = UIColor(named: "Color")
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemGray6
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.next
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.delegate = self
        
        return textField
    }()
    
    private lazy var secondTextField: UITextField = {
        
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "   Password"
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.textColor = .black
        passwordTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        passwordTextField.tintColor = UIColor(named: "Color")
        passwordTextField.autocapitalizationType = .none
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.autocorrectionType = UITextAutocorrectionType.no
        passwordTextField.keyboardType = UIKeyboardType.default
        passwordTextField.returnKeyType = UIReturnKeyType.done
        passwordTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        passwordTextField.isSecureTextEntry = true
        passwordTextField.resignFirstResponder()
        passwordTextField.delegate = self
        
        return passwordTextField
    }()
    
    // MARK: - Button
    
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.backgroundImage(for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        //        button.setBackgroundImage( UIImage(named: "blue_pixel"), for: .normal)
        button.backgroundColor = UIColor(named: "Color")
        button.setTitle("Log In", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 0.5
        button.layer.masksToBounds = true
        button.layer.shadowOpacity = 0.5
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowRadius = 3
        button.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside )
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInViewControllerSetup()
        addSubViews()
        Layout()

        
        let tapGuester = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGuester)
        
        NotificationCenter.default.addObserver(self, selector: #selector(moveViewsUp), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(moveViewsDown), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    // MARK: - HideKeyboardUsingButton
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        secondTextField.resignFirstResponder()
        textField.resignFirstResponder()

        return true
    }
    

    //MARK: - Private
        
    private func addSubViews() {
        view.addSubview(button)
        view.addSubview(logoView)
        view.addSubview(stackView)
    }
    
    private func logInViewControllerSetup() {
        view.backgroundColor = .white
        title = "Log In"
//                tabBarController?.tabBar.isHidden = true
    }
       
    private func Layout() {
        addSubViews()
        NSLayoutConstraint.activate([
            logoView.widthAnchor.constraint(equalToConstant: 100),
            logoView.heightAnchor.constraint(equalToConstant: 100),
            logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            
            stackView.heightAnchor.constraint(equalToConstant: 100),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            stackView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 120),
            
            button.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            
        ])
    }
    
   
    
    @objc func profileButtonTapped() {
        let profileViewController = ProfileViewController()
        self.navigationController?.pushViewController(profileViewController, animated: true)
    }
    
    // MARK: - MoveViewsWhenKeyboardAppear

    @objc func moveViewsUp(notification: NSNotification){
        
        view.frame.origin.y = -100
    }
    
    @objc func moveViewsDown(notification: NSNotification){
        view.frame.origin.y = 100
    }
    
    // MARK: - HideKeyboardUsingTapGestureRecognizer
    
    @objc func hideKeyboard() {
        textField.resignFirstResponder()
        secondTextField.resignFirstResponder()
    }

    
    
}
