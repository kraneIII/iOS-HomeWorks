import UIKit
import StorageService


class FeedViewController: UIViewController {
    
    var coordinator: FeedBaseCoordinator?
    
    private var feedModel: CheckKey
    
    var post = Post(title: "Something")
    
    //MARK: MVP
    
    private lazy var keyPassword: UITextField = {
        let keyPassword = UITextField()
        keyPassword.translatesAutoresizingMaskIntoConstraints = false
        keyPassword.placeholder = "Password"
        keyPassword.font = UIFont.systemFont(ofSize: 17)
        
        return keyPassword
    }()
    
    private lazy var checkGuessButton: UIButton = {
        checkGuessButton = UIButton()
        checkGuessButton.setTitle("Tap me", for: .normal)
        checkGuessButton.backgroundColor = .systemGray3
        checkGuessButton.layer.cornerRadius = 15
        checkGuessButton.layer.borderWidth = 0.5
        checkGuessButton.layer.borderColor = UIColor.black.cgColor
        checkGuessButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        checkGuessButton.layer.shadowRadius = 15
        checkGuessButton.setTitleColor(#colorLiteral(red: 0.4117647059, green: 0.5058823529, blue: 0.5529411765, alpha: 0.85), for: .normal)
        
        checkGuessButton.translatesAutoresizingMaskIntoConstraints = false
        checkGuessButton.addTarget(self, action: #selector(guessButtonTapped), for: .touchUpInside)
        
        return checkGuessButton
    }()
    
    private lazy var guessButtonChecker: UILabel = {
        let guessButtonChecker = UILabel()
        guessButtonChecker.translatesAutoresizingMaskIntoConstraints = false
        guessButtonChecker.backgroundColor = .systemGray3
        guessButtonChecker.layer.cornerRadius = 15
        guessButtonChecker.layer.borderWidth = 0.5
        guessButtonChecker.layer.borderColor = UIColor.black.cgColor
        guessButtonChecker.clipsToBounds = true
        
        return guessButtonChecker
    }()
    
    
    // MARK: - StackUIButtons
    
    private lazy var firstStackButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.setTitle("Pressed", for: .normal)
        button.titleLabel?.textColor = .systemGray6
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return button
        
    }()
    
    private lazy var secondStackButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.setTitle("Pressed", for: .normal)
        button.titleLabel?.textColor = .systemGray6
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return button
        
    }()
    
    
    // MARK: - StackView
    
    private lazy var stackView: UIStackView = { [unowned self] in
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
        stackView.addArrangedSubview(firstStackButton)
        stackView.addArrangedSubview(secondStackButton)
        return stackView
    }()

    init(feedModel: CheckKey, coordinator: FeedBaseCoordinator) {
        self.feedModel = feedModel

        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setupViewController()
        layout()
        feedModelBinding()
    }
    
    // MARK: - Layout
    private func layout() {
        addSubViews()
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 200),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            
            keyPassword.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            keyPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 150),
            keyPassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            keyPassword.widthAnchor.constraint(equalToConstant: 20),
            keyPassword.heightAnchor.constraint(equalToConstant: 220),
            
            checkGuessButton.topAnchor.constraint(equalTo: keyPassword.bottomAnchor, constant: 10),
            checkGuessButton.leadingAnchor.constraint(equalTo: keyPassword.leadingAnchor, constant: -15),
            checkGuessButton.widthAnchor.constraint(equalToConstant: 100),
            checkGuessButton.heightAnchor.constraint(equalToConstant: 30),
            
            guessButtonChecker.topAnchor.constraint(equalTo: checkGuessButton.topAnchor),
            guessButtonChecker.leadingAnchor.constraint(equalTo: checkGuessButton.trailingAnchor, constant: 10),
            guessButtonChecker.widthAnchor.constraint(equalToConstant: 30),
            guessButtonChecker.heightAnchor.constraint(equalToConstant: 30),
            
        ])
    }
    
    private func addSubViews() {
        view.addSubview(keyPassword)
        view.addSubview(checkGuessButton)
        view.addSubview(guessButtonChecker)
        view.addSubview(stackView)
        
    }
    
    // MARK: - Setup
    
    private func setupViewController () {
        view.backgroundColor = .systemCyan
        title = "Feed"
        
    }
    
    private func feedModelBinding() {
        feedModel.currentState = { [ weak self ] state in
            guard let self else { return }
            
            switch state {
                
            case .initial:
                self.guessButtonChecker.backgroundColor = .systemGray5
                
            case .confirmed:
                self.guessButtonChecker.backgroundColor = .green
            case .error:
                self.guessButtonChecker.backgroundColor = .systemRed
                
            }
        }
    }
    
    // MARK: - ObjectiveC Func
    
    @objc func guessButtonTapped() {
        feedModel.changeStateIfNeeded(word: keyPassword.text!)
    }
    
    @objc private func buttonPressed() {
        //                self.navigationController?.pushViewController(viewController, animated: true)

        
        let viewController = PostViewController(coordinator: FeedFlowCoordinator())

        coordinator?.moveToSecondScreen()
        viewController.postTitle = post.title
    }
    
    
}
