import UIKit
import iOSIntPackage


class PostCell: UITableViewCell {
    
    //MARK: - UIElements
    
    private lazy var topLabel: UILabel = {
        let topLabel = UILabel()
        topLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        topLabel.numberOfLines = 1
        topLabel.textColor = .black
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return topLabel
    }()
    
    
    private lazy var imagePost: UIImageView = { [unowned self] in
        var imagePost = UIImageView()
        imagePost.translatesAutoresizingMaskIntoConstraints = false
        imagePost.contentMode = .scaleAspectFit
        imagePost.backgroundColor = .black
        
        return imagePost
    }()
    
    
    
    private lazy var postInfo: UILabel = {
        let postInfo = UILabel()
        postInfo.translatesAutoresizingMaskIntoConstraints = false
        postInfo.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        postInfo.textColor = .systemGray
        postInfo.numberOfLines = 1
        
        return postInfo
    }()
    
    private lazy var viewsLabel: UILabel = {
        let viewsLabel = UILabel()
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        viewsLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        viewsLabel.textColor = .black
        
        return viewsLabel
    }()
    
    private lazy var likesLabel: UILabel = {
        let likesLabel = UILabel()
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        likesLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        likesLabel.textColor = .black
        
        return likesLabel
    }()
    
    //MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        allViewsLayot()
        addSubviews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(topLabel)
        contentView.addSubview(postInfo)
        contentView.addSubview(likesLabel)
        contentView.addSubview(viewsLabel)
        contentView.addSubview(imagePost)
    }
    
    //MARK: - Layout
    
    private func allViewsLayot() {
        
        addSubviews()
        
        NSLayoutConstraint.activate([
            
            topLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            topLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            topLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            
            imagePost.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 8),
            imagePost.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imagePost.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            
            postInfo.topAnchor.constraint(equalTo: imagePost.bottomAnchor, constant: 16),
            postInfo.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            postInfo.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            
            likesLabel.topAnchor.constraint(equalTo: postInfo.bottomAnchor, constant: 20),
            likesLabel.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            
            viewsLabel.topAnchor.constraint(equalTo: postInfo.bottomAnchor, constant: 20),
            viewsLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            
        ])
        
    }

    func configure(userPostInfo: UserPost) {
        postInfo.text = userPostInfo.description
        likesLabel.text = userPostInfo.likes
        viewsLabel.text = userPostInfo.views
        topLabel.text = userPostInfo.author
        
        let imageFilter = ImageProcessor()
        imageFilter.processImage(sourceImage: userPostInfo.image, filter: .chrome, completion: { image in
            imagePost.image = userPostInfo.image
        })
        
    }
}
