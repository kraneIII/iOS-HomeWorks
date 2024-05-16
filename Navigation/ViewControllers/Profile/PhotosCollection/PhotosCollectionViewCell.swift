

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    let image = UIImageView()
//    let collectionOfPhotosGenerator = PhotosViewController()
    
    private lazy var postCellImage: UIImageView = {
        let postCellImage = UIImageView()
        postCellImage.translatesAutoresizingMaskIntoConstraints = false
        
        return postCellImage
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        cellImageLayout()
        addSubView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubView() {
        image.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(image)
        contentView.addSubview(postCellImage)
    }
    
    //MARK: - Private
    
    private func cellImageLayout() {
        addSubView()
        NSLayoutConstraint.activate([
        
            image.widthAnchor.constraint(equalToConstant: 120),
            image.heightAnchor.constraint(equalToConstant: 120),
            
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
        ])
    }
    
    func congigure(with collectionImage: CollectionImage) {
        postCellImage.image = collectionImage.collectionImage
//        postCellImage.image = photoCollection.randomElement()
        
    }
}
