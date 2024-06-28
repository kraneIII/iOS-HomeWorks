
import UIKit
import SnapKit

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
        personalInfo.isEnabled = true
        personalInfo.keyboardType = .default
        personalInfo.layer.opacity = 0.5
        personalInfo.layer.cornerRadius = 12
        personalInfo.layer.borderWidth = 1
        personalInfo.layer.borderColor = UIColor.black.cgColor
        
        return personalInfo
    }()
    
    private lazy var avatar: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "avatar"))
        imageView.layer.borderWidth = 3
        imageView.layer.cornerRadius = 64
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        
        let imageTapped = UITapGestureRecognizer(target: self, action: #selector(profileImageTapped))
        
        imageView.addGestureRecognizer(imageTapped)
        
        return imageView
    }()
    
    private lazy var animationCancelButton: UIButton = {
        let animationCancelButton = UIButton()
        animationCancelButton.setImage(UIImage(systemName: "arrowshape.forward.fill"), for: .normal)
        animationCancelButton.translatesAutoresizingMaskIntoConstraints = false
        animationCancelButton.layer.opacity = 0
        
        animationCancelButton.addTarget(self, action: #selector(animationCancel), for: .touchUpInside)
        
        return animationCancelButton
    }()
    
    private lazy var hideView: UIView = {
        let hideView = UIView()
        hideView.layer.opacity = 0
        hideView.backgroundColor = .white
        hideView.layer.masksToBounds = true
        hideView.translatesAutoresizingMaskIntoConstraints = false
        
        return hideView
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
        statusButtonTapped()
        Layout()
        isUserInteractionEnabled = true
        //
        //        fullNameLabel.snp.makeConstraints{ maker in
        //            maker.left.equalToSuperview().inset(160)
        //            maker.top.equalToSuperview().inset(31)
        //
        //            labelStatus.snp.makeConstraints{ maker in
        //                maker.left.equalToSuperview().inset(160)
        //                maker.bottom.equalToSuperview().inset(0)
        //
        //                avatar.snp.makeConstraints{ maker in
        //                    maker.left.equalToSuperview().inset(16)
        //                    maker.top.equalToSuperview().inset(20)
        //                    maker.width.equalTo(128)
        //                    maker.height.equalTo(128)
        //                }
        //
        //                animationCancelButton.snp.makeConstraints{ maker in
        //                    maker.top.equalToSuperview().inset(20)
        //                    maker.trailing.equalToSuperview().inset(-16)
        //                }
        //
        //                statusButton.snp.makeConstraints { maker in
        //                    maker.width.equalTo(360)
        //                    maker.height.equalTo(50)
        //                    maker.centerX.equalToSuperview()
        //                    maker.top.equalToSuperview().inset(164)
        //                    maker.left.equalToSuperview().inset(16)
        //                }
        //
        //
        //                hideView.snp.makeConstraints{ maker in
        //                    maker.top.equalToSuperview().inset(20)
        //                    maker.bottom.equalToSuperview().inset(-16)
        //                    maker.trailing.equalToSuperview()
        //                    maker.leading.equalToSuperview()
        //                }
        //
        //                textField.snp.makeConstraints{ maker in
        //                    maker.bottom.equalTo(statusButton).inset(60)
        //                    maker.left.equalToSuperview().inset(160)
        //                    maker.height.equalTo(40)
        //                    maker.width.equalTo(215)
        //                }
        //            }
        //        }
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //    MARK: - Layout
    
    
    func Layout() {
        addSubViews()
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 240),
            self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            textField.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 16),
            textField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -10),
            textField.heightAnchor.constraint(equalToConstant: 40),
            textField.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            
            avatar.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            avatar.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            avatar.widthAnchor.constraint(equalToConstant: 128),
            avatar.heightAnchor.constraint(equalToConstant: 128),
            
            animationCancelButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            animationCancelButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            hideView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            hideView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            hideView.trailingAnchor.constraint(equalTo: trailingAnchor),
            hideView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            statusButton.widthAnchor.constraint(equalToConstant: 300),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            statusButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            statusButton.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 16),
            statusButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            
            fullNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 31),
            fullNameLabel.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 16),
            
            labelStatus.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 16),
            labelStatus.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -5),
        ])
        
    }
    
    // MARK: - ANIMATION
    
    private func animation() {
        
        let centerOrigin = contentView.center
        
        let animator = UIViewPropertyAnimator(
            duration: 0.5,
            curve: .easeOut
        ) {
            
            self.avatar.center = CGPoint(x: centerOrigin.x, y: 1.5 * centerOrigin.y)
            self.avatar.transform = CGAffineTransform.init(scaleX: 2, y: 2)
            self.avatar.layer.cornerRadius = 0
            
            self.hideView.layer.opacity = 1
            self.hideView.transform = CGAffineTransform.init(scaleX: 1, y: 10)
            
        }
        animator.startAnimation(afterDelay: 1.0)
        
        
        let secondAnimator = UIViewPropertyAnimator(
            duration: 0.3,
            curve: .linear
        ) {
            self.animationCancelButton.layer.opacity = 1
        }
        secondAnimator.startAnimation(afterDelay: 1.5)
    }
    
    private func cancelAnimation() {
        
        let cancelAnimator = UIViewPropertyAnimator(
            duration: 0.5,
            curve: .easeIn
        ) {
            //            self.avatar.frame = self.avatar.frame.offsetBy(dx: -116, dy: -96)
            self.avatar.center = CGPoint(x: 0.4 * self.avatar.center.x, y: 0.5 * self.avatar.center.y)
            self.avatar.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
            //            self.avatar.layer.cornerRadius = 64
            self.avatar.layer.cornerRadius = self.avatar.frame.size.width / 2
            self.animationCancelButton.layer.opacity = 0
            
            self.hideView.layer.opacity = 0
        }
        cancelAnimator.startAnimation(afterDelay: 1)
        
    }
    
    
    // MARK: - AddSubViews
    
    func addSubViews() {
        addSubview(hideView)
        addSubview(statusButton)
        addSubview(textField)
        addSubview(fullNameLabel)
        addSubview(labelStatus)
        addSubview(animationCancelButton)
        addSubview(avatar)
    }
    
    func userConfig(user: User){
        fullNameLabel.text = user.fullName
        labelStatus.text = user.status
        avatar.image = user.avatar
    }
    
    
    //MARK: - OBJC FUNC
    
    @objc func profileImageTapped() {
        animation()
        
    }
    
    @objc func animationCancel() {
        cancelAnimation()
        
    }
    
    @objc func statusButtonTapped (){
        labelStatus.text = textField.text
        print (textField.text!)
    }
}
