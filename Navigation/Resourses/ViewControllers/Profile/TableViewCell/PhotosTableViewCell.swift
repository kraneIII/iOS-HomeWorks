
import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private lazy var photosLabel: UILabel = {
        let photosLabel = UILabel()
        photosLabel.text = "Photos"
        photosLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        photosLabel.textColor = .black
        photosLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return photosLabel
    }()
    
    
    private lazy var backImage: UIImageView = {
        let backImage = UIImageView()
        backImage.translatesAutoresizingMaskIntoConstraints = false
        
        return backImage
    }()
    
//MARK: - UIImageViews
    
    private lazy var tableViewFirstImage: UIImageView = {
        let tableViewFirstImage = UIImageView()
        tableViewFirstImage.layer.cornerRadius = 6
        tableViewFirstImage.layer.masksToBounds = true
        tableViewFirstImage.translatesAutoresizingMaskIntoConstraints = false
        
        return tableViewFirstImage
    }()
    
    private lazy var tableViewSecondImage: UIImageView = {
        let tableViewSecondImage = UIImageView()
        tableViewSecondImage.layer.cornerRadius = 6
        tableViewSecondImage.layer.masksToBounds = true
        tableViewSecondImage.translatesAutoresizingMaskIntoConstraints = false
        
        return tableViewSecondImage
    }()
    
    private lazy var tableViewThirdImage: UIImageView = {
        let tableViewThirdImage = UIImageView()
        tableViewThirdImage.layer.cornerRadius = 6
        tableViewThirdImage.layer.masksToBounds = true
        tableViewThirdImage.translatesAutoresizingMaskIntoConstraints = false

        
        return tableViewThirdImage
    }()
    
    private lazy var tableViewForthImage: UIImageView = {
        let tableViewForthImage = UIImageView()
        tableViewForthImage.layer.cornerRadius = 6
        tableViewForthImage.layer.masksToBounds = true
        tableViewForthImage.translatesAutoresizingMaskIntoConstraints = false

        
        return tableViewForthImage
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: .default, reuseIdentifier: reuseIdentifier)
        addSubView()
        tableViewPhotoCellLayout()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private
    
    private func addSubView() {
        contentView.addSubview(photosLabel)
        contentView.addSubview(tableViewFirstImage)
        contentView.addSubview(tableViewSecondImage)
        contentView.addSubview(tableViewThirdImage)
        contentView.addSubview(tableViewForthImage)
        contentView.addSubview(backImage)
        
    }
    
    
    private func tableViewPhotoCellLayout() {
        addSubView()
        NSLayoutConstraint.activate([
                                            
            photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            backImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            backImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            tableViewFirstImage.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            tableViewFirstImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
            tableViewFirstImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor ,constant: -12),
            tableViewFirstImage.widthAnchor.constraint(equalToConstant: 87),
            tableViewFirstImage.heightAnchor.constraint(equalToConstant: 70),
            
            tableViewSecondImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            tableViewSecondImage.leftAnchor.constraint(equalTo: tableViewFirstImage.rightAnchor, constant: 8),
            tableViewSecondImage.widthAnchor.constraint(equalToConstant: 87),
            tableViewSecondImage.heightAnchor.constraint(equalTo: tableViewFirstImage.heightAnchor),
            
            tableViewThirdImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            tableViewThirdImage.leftAnchor.constraint(equalTo: tableViewSecondImage.rightAnchor, constant: 8),
            tableViewThirdImage.widthAnchor.constraint(equalToConstant: 87),
            tableViewThirdImage.heightAnchor.constraint(equalTo: tableViewSecondImage.heightAnchor),
            
            tableViewForthImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            tableViewForthImage.leftAnchor.constraint(equalTo: tableViewThirdImage.rightAnchor, constant: 8),
            tableViewForthImage.widthAnchor.constraint(equalToConstant: 87),
            tableViewForthImage.heightAnchor.constraint(equalTo: tableViewThirdImage.heightAnchor),
        ])
    }
    
    
    func imagePhotosSetup(userPhoto: UserPhotos) {
        tableViewFirstImage.image = userPhoto.photoViewOne
        tableViewSecondImage.image = userPhoto.photoViewTwo
        tableViewThirdImage.image = userPhoto.photoViewThree
        tableViewForthImage.image = userPhoto.photoViewForth
        backImage.image = userPhoto.imageBack
    }
    
}
