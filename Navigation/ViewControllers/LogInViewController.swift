import UIKit
import Foundation

protocol LoginViewControllerDelegate {
    
    func check(login: String, password: String) -> Bool
}

struct LoginInspector: LoginViewControllerDelegate {
    func check(login: String, password: String) -> Bool {
        return Checker.shared.check(loginn: login, passwordd: password)
    }
    
}

extension String {
    var numbers: String { return "1234567890"}
    var letter: String { return "abcdefghijklmnopqrstuvwxyz"}
    var upperLetter: String { return "ABCDEFGHIJKLMNOPQRSTUVWXYZ"}
    var punctuation: String { return "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~" }
    var letters:     String { return letter + upperLetter }
    var printable:   String { return numbers + letters + punctuation }
    
    mutating func replace(at index: Int, with character: Character) {
        var stringArray = Array(self)
        stringArray[index] = character
        self = String(stringArray)
    }

}


class LogInViewController: UIViewController, UITextFieldDelegate {
    
    private var timer: Timer?
    private var counter = 20
    
    private lazy var timerLabel: UILabel = {
        let timerLabel = UILabel()
        timerLabel.text = "20"
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.textColor = .gray
        
        return timerLabel
    }()
    
    private lazy var timerCompletionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    //MARK: - BruteForce
    
    func bruteForce(unlockPassword: String) {
        
        let allowedPasswords: [String] = String().printable.map {
        String($0) }
        
        var password: String = ""
        
        while password != unlockPassword {
            password = generateBruteForce(password, fromArray: allowedPasswords)
        }
        
        print(password)
    }
    
    func indexOf(character: Character, _ array: [String]) -> Int {
        return array.firstIndex(of: String(character))!
    }

    func characterAt(index: Int, _ array: [String]) -> Character {
        return index < array.count ? Character(array[index])
                                   : Character("")
    }
    
    func generateBruteForce(_ string: String, fromArray array: [String]) -> String {
        var str: String = string

        if str.count <= 0 {
            str.append(characterAt(index: 0, array))
        }
        else {
            str.replace(at: str.count - 1,
                        with: characterAt(index: (indexOf(character: str.last!, array) + 1) % array.count, array))

            if indexOf(character: str.last!, array) == 0 {
                str = String(generateBruteForce(String(str.dropLast()), fromArray: array)) + String(str.last!)
            }
        }

        return str
    }

    
    
    
    //MARK: - BruteForceEnd

    
    var loginDelegate: LoginViewControllerDelegate?
    
    var coordinator: LoginBaseCoordinator?
    
    // MARK: - StackView
    
    private lazy var stackView: UIStackView = { [unowned self] in
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        stackView.axis = .vertical
        stackView.spacing = 0.5
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        
        
        stackView.addArrangedSubview(emailField)
        stackView.addArrangedSubview(passwordField)
        return stackView
    }()
    
    // MARK: - LogoView
    
    private lazy var logoView: UIImageView = {
        let logoView = UIImageView(image: UIImage(named: "mainLogo" ))
        logoView.translatesAutoresizingMaskIntoConstraints = false
        return logoView
    }()
    
    // MARK: - TextField
    
    private lazy var emailField: UITextField = {
        
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
    
    private lazy var passwordField: UITextField = {
        
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
    
    private lazy var indicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.hidesWhenStopped = true
        indicator.style = .medium
        indicator.translatesAutoresizingMaskIntoConstraints = false
        
        return indicator
    }()
    
    // MARK: - Button
    
    private lazy var bruteForceButton: UIButton = {
        let bruteForce = UIButton()
        bruteForce.setTitle("Подобрать пароль", for: .normal)
        bruteForce.setTitleColor(.gray, for: .normal)
        bruteForce.layer.cornerRadius = 10
        bruteForce.layer.shadowColor = UIColor.white.cgColor
        bruteForce.layer.shadowOpacity = 0.5
        bruteForce.layer.shadowOffset = CGSize(width: 5, height: 5)
        bruteForce.layer.shadowRadius = 4
        bruteForce.translatesAutoresizingMaskIntoConstraints = false
        bruteForce.backgroundColor = .white
        bruteForce.addTarget(self, action: #selector(brutePassword), for: .touchUpInside)
       
        return bruteForce
    }()
    
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitleColor(.white, for: .normal)
        button.backgroundImage(for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        //        button.setBackgroundImage( UIImage(named: "blue_pixel"), for: .normal)
        button.backgroundColor = UIColor(named: "Color")
        button.setTitle("Login", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 0.5
        button.layer.masksToBounds = true
        button.layer.shadowOpacity = 0.5
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowRadius = 3
        button.addTarget(self, action: #selector(profileButtonTapped), for: .touchUpInside )
        
        return button
    }()
    
    init(coordinator: LoginBaseCoordinator) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        passwordField.resignFirstResponder()
        emailField.resignFirstResponder()

        return true
    }
    

    //MARK: - Private
        
    private func addSubViews() {
        view.addSubview(button)
        view.addSubview(logoView)
        view.addSubview(stackView)
        view.addSubview(bruteForceButton)
        view.addSubview(indicator)
        view.addSubview(timerLabel)
        view.addSubview(timerCompletionLabel)
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
            
            bruteForceButton.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 10),
            bruteForceButton.leftAnchor.constraint(equalTo: button.leftAnchor,constant: 50),
            bruteForceButton.rightAnchor.constraint(equalTo: button.rightAnchor, constant: -50),
            bruteForceButton.heightAnchor.constraint(equalToConstant: 30),
            
            indicator.heightAnchor.constraint(equalToConstant: 30),
            indicator.widthAnchor.constraint(equalToConstant: 30),
            indicator.leftAnchor.constraint(equalTo: bruteForceButton.rightAnchor,constant: -30),
            indicator.topAnchor.constraint(equalTo: bruteForceButton.topAnchor),
            
            timerLabel.topAnchor.constraint(equalTo: indicator.topAnchor,constant: 5),
            timerLabel.leftAnchor.constraint(equalTo: indicator.rightAnchor, constant: 5),
            
            timerCompletionLabel.topAnchor.constraint(equalTo: bruteForceButton.bottomAnchor, constant: 10),
            timerCompletionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerCompletionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            
            
        ])
    }
    
    private func alert() {
        let alert = UIAlertController(title: "Ошибка", message: "Логин или пароль введены неверно", preferredStyle: .alert)
        let alertAct = UIAlertAction(title: "Ок", style: .default)
        
        alert.addAction(alertAct)
        present(alert, animated: true)
    }
    
    private func checker() -> Bool {
        LoginInspector().check(login: emailField.text ?? "", password: passwordField.text ?? "")
    }
    
     func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    @objc func profileButtonTapped() {
        if checker() == true {
            
            coordinator?.moveToSecondScreen()

//            let profileViewController = ProfileViewController()
//                  self.navigationController?.pushViewController(profileViewController, animated: true)
        }
        else {
            
            alert()
            emailField.text = ""
            passwordField.text = ""
        }
    }
    
    // MARK: - MoveViewsWhenKeyboardAppear
    //MARK: - код для подбора пароля
    
    @objc func brutePassword() {
        
        let workItem = DispatchWorkItem {
            self.bruteForce(unlockPassword: "some")
        }

        self.timerLabel.isHidden = false
        self.indicator.startAnimating()
        self.timerCompletionLabel.text = nil
        DispatchQueue.global().async(execute: workItem)
        workItem.notify(queue: .main){
            
            self.passwordField.isSecureTextEntry = false
            
            self.indicator.stopAnimating()
            self.passwordField.text = "some"
            workItem.cancel()
            
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [weak self] timer in
            guard let self else { return }
            counter -= 1
            self.timerLabel.text = "\(counter)"
            if counter <= 0 {
                
                workItem.cancel()
                self.indicator.stopAnimating()
                timer.invalidate()
                self.timerLabel.isHidden = true
                self.timerCompletionLabel.textColor = .red
                self.timerCompletionLabel.text = "Error"
                self.timer = nil
                self.counter = 20
            }
            
            if workItem.isCancelled == true {
                self.timerLabel.isHidden = true
                self.timerCompletionLabel.textColor = .systemBlue
                self.timerCompletionLabel.text = "Password found"
                self.timer?.invalidate()
                self.timer = nil
                self.counter = 20
            }
            
            
        })
    }
        
//        let brute = DispatchQueue(label: "passwordBrute", qos: .userInteractive, attributes: .concurrent)
//        let workItem = DispatchWorkItem {
//            self.bruteForce(unlockPassword: "some")
//        }
  
//        self.indicator.startAnimating()
        
//        DispatchQueue.global().async(execute: workItem)
////        brute.async(execute: workItem)
//        workItem.notify(queue: .main){
//            
//            self.passwordField.isSecureTextEntry = false
//            
//            self.indicator.stopAnimating()
//            self.passwordField.text = "some"
//
//        }
//    }

    @objc func moveViewsUp(notification: NSNotification){
        
        view.frame.origin.y = -100
    }
    
    @objc func moveViewsDown(notification: NSNotification){
        view.frame.origin.y = 100
    }
    
    // MARK: - HideKeyboardUsingTapGestureRecognizer
    
    @objc func hideKeyboard() {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
    }

    
    
}
