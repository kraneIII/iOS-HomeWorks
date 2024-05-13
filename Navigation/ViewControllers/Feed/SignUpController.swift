import FirebaseAuth
import UIKit
import Foundation



class SignUpController: UIViewController, UITextFieldDelegate {
    
//    private var checker: CheckService?

    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(email)
        stackView.addArrangedSubview(password)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = UIColor.black.cgColor
        stackView.layer.cornerRadius = 7
        stackView.backgroundColor = .systemGray6
        
        return stackView
    }()
    
    private lazy var email: UITextField = {
        let email = UITextField()
        email.placeholder = "Email"
        email.layer.cornerRadius = 7
        email.layer.borderWidth = 1
        email.delegate = self
        email.textColor = .systemBlue
        email.translatesAutoresizingMaskIntoConstraints = false
        
        
        return email
    }()
    
    private lazy var password: UITextField = {
        let password = UITextField()
        password.placeholder = "Password"
        password.delegate = self
        password.autocorrectionType = UITextAutocorrectionType.default
        password.textColor = .systemBlue
        password.translatesAutoresizingMaskIntoConstraints = false
        
        
        return password
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign up", for: .normal)
        button.tintColor = .systemBlue
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.layer.shadowRadius = 3.0
        button.layer.shadowColor = UIColor.systemGray5.cgColor
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        addSubViews()
        setupUI()
        layout()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        password.resignFirstResponder()
        email.resignFirstResponder()
        return true
    }
    
    private func setupUI() {
        view.backgroundColor = .white
    }
    
    private func addSubViews() {
        view.addSubview(stackView)
        view.addSubview(signUpButton)
        
    }
    
    private func layout() {
        addSubViews()
        
        NSLayoutConstraint.activate([
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150),
            stackView.widthAnchor.constraint(equalToConstant: 250),
            
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 5),
            
            email.heightAnchor.constraint(equalToConstant: 30),
            
            password.heightAnchor.constraint(equalToConstant: 30),
            
        ])
        
    }
    
    
    @objc func signUp() {
        
        guard let email = email.text, email != "", let password = password.text, password != "" else { return }
        
        Auth.auth().createUser(withEmail: email, password: password, completion: { [weak self] authResult, error  in
            guard let self else { return }
            dismiss(animated: true)
        })
        }
}


