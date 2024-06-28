import UIKit
import Foundation

class CustomButton: UIButton {

    typealias tapOnButtonAction = () -> Void?
    
    var buttonAction: tapOnButtonAction
    
    init(title: String, titleColor: UIColor = .white, backColor: UIColor, action: @escaping tapOnButtonAction) {
        buttonAction = action
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        backgroundColor = backColor
        layer.cornerRadius = 15
        layer.shadowColor = UIColor.systemGray5.cgColor
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.shadowOpacity = 0.8
        translatesAutoresizingMaskIntoConstraints = false
        
        addTarget(self, action: #selector(customButtomTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func customButtomTapped() {
        buttonAction()
    }
    
}
