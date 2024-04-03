
import UIKit



class FeedViewController: UIViewController {
    
    let post = Post(title: "")
    
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

    // MARK: - StackViewLayout
    private func stackViewLayout() {
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 200),
            stackView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
//    // MARK: - Button
//
//    private lazy var feedButton: UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .systemBlue
//        button.layer.cornerRadius = 10
//        button.layer.shadowOffset = CGSize(width: 5, height: 5)
//        button.layer.shadowColor = UIColor.black.cgColor
//        button.layer.shadowOpacity = 0.7
//        button.setTitle("Pressed", for: .normal)
//        button.titleLabel?.textColor = .white
//        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
//
//        return button
//
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stackView)
        stackViewLayout()
     setupViewController()
//        layout()
        }
    
    // MARK: - Setup

    private func setupViewController () {
        view.backgroundColor = .systemCyan
        title = "Feeds"
        
    }
    
    // MARK: - Constraint

//    private func layout() {
//        view.addSubview(feedButton)
//        NSLayoutConstraint.activate([
//            feedButton.widthAnchor.constraint(equalToConstant: 100),
//            feedButton.heightAnchor.constraint(equalToConstant: 50),
//            feedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            feedButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//
//        ])
//    }
    // MARK: - ObjectiveC Func

    @objc private func buttonPressed() {
        let viewController = PostViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
        viewController.postTitle = post.title
    }
    
        
    }
