
import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
        
    // MARK: - UILabel
    
    let fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Hipster Cat"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    // MARK: - TextFielf


    let labelStatus: UILabel = {
        let status = UILabel()
        status.translatesAutoresizingMaskIntoConstraints = false
        status.text = "Wrire something..."
        status.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        status.layer.opacity = 0.5
        status.layer.opacity = 0.5


        return status
    }()
    
    // MARK: - TextFielf
    
    
    let textField: UITextField = {
        let personalInfo = UITextField()
        personalInfo.translatesAutoresizingMaskIntoConstraints = false
        personalInfo.placeholder = "Wrire something..."
        personalInfo.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        personalInfo.backgroundColor = .white
//        personalInfo.isEnabled = true
//        personalInfo.keyboardType = .default
//        personalInfo.layer.opacity = 0.5
        personalInfo.layer.cornerRadius = 12
        personalInfo.layer.borderWidth = 1
        personalInfo.layer.borderColor = UIColor.black.cgColor
        
        return personalInfo
    }()
        
    // MARK: - Avatar
    
    private lazy var avatar: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "avatar"))
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 64
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        return imageView
    }()

    
    // MARK: - Button
    
    private lazy var statusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 4
        button.backgroundColor = .systemBlue
        button.layer.shadowOffset.width = 4
        button.layer.shadowOffset.height = 4
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.titleLabel?.textColor = .white
        button.addTarget(UIEvent(), action: #selector(statusButtonTapped), for: .touchUpInside)
        button.setTitle("Show status", for: .normal)
        return button
    }()
    
    // MARK: - Init

    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        translatesAutoresizingMaskIntoConstraints = false
        addSubViews()
                buttonLayout()
                textFieldLayout()
                fullNameLabelLayout()
                avatarLayout()
                statusButtonTapped()
                labelStatusLayot()

    }
    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        addSubViews()
//        buttonLayout()
//        textFieldLayout()
//        fullNameLabelLayout()
//        avatarLayout()
//        statusButtonTapped()
//        labelStatusLayot()
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - StutusLabelLayout

    func labelStatusLayot() {
        addSubview(labelStatus)
        NSLayoutConstraint.activate([
            labelStatus.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 16),
            labelStatus.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -5)
        ])
    }
    
    // MARK: - fullNameLabelLayout
    
    func fullNameLabelLayout() {
        addSubview(fullNameLabel)
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 31),
            fullNameLabel.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 16)
            
        ])
    }

    // MARK: - ButtonLayout
    
    func buttonLayout() {
        addSubview(statusButton)
        NSLayoutConstraint.activate([
            statusButton.widthAnchor.constraint(equalToConstant: 300),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            statusButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            statusButton.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 16),
            statusButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16)
        ])
    }
    
    // MARK: - textFieldLayout
    
    
    func textFieldLayout() {
        addSubview(textField)
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 240),
            self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            textField.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 16),
            textField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -10),
            textField.heightAnchor.constraint(equalToConstant: 40),
            textField.rightAnchor.constraint(equalTo: rightAnchor, constant: -16)
        ])
        
    }

    
    // MARK: - AvatarLayut
    
    func avatarLayout() {
        addSubview(avatar)
        NSLayoutConstraint.activate([
            avatar.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            avatar.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            avatar.widthAnchor.constraint(equalToConstant: 128),
            avatar.heightAnchor.constraint(equalToConstant: 128)
            
        ])
        
    }
    
    // MARK: - AddSubViews
    
    func addSubViews() {
        addSubview(avatar)
        addSubview(statusButton)
        addSubview(textField)
        addSubview(fullNameLabel)
        addSubview(labelStatus)
        
        
    }
    
    @objc func statusButtonTapped (){
        labelStatus.text = textField.text
        print (textField.text!)
    }
}
