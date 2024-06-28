import Foundation
import UIKit
import iOSIntPackage

class PhotosViewController: UIViewController {
    
    let imageProcessor = ImageProcessor()
    var imageStorage: [UIImage] = []
    var imageStorage2: [UIImage] = []
    
    let photos = CollectionImage.collectionImage()
    
    private lazy var collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: -8, right: -8)
        collectionView.backgroundColor = .white
        
        viewLayout.minimumLineSpacing = 8
        viewLayout.minimumInteritemSpacing = 8
        viewLayout.sectionInset = .init(top: 8, left: 8, bottom: -8, right: -8)
        viewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        collectionViewLayout()
        TuneCollectionView()
        applyImageFilter()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    //MARK: - Working with THREAD
    
    private func castImages(photos: [CollectionImage]) {
        for image in photos {
            let photo = UIImage(named: image.id) ?? UIImage()
            imageStorage.append(photo)
        }
    }
    
    private func applyImageFilter() {
        
        castImages(photos: photos)
        
        let start = DispatchTime.now() //MARK: - Start time
//        
        imageProcessor.processImagesOnThread(sourceImages: imageStorage,
                                             filter: .chrome,
                                             qos: .userInteractive)
        { imageStorage in
            
            DispatchQueue.main.async { [ weak self ] in
                
                for image in imageStorage {
                    guard let image = image else {return}
                    self?.imageStorage2.append(UIImage(cgImage: image))
                }
                self?.collectionView.reloadData()
                
            }
            
            let end = DispatchTime.now() //MARK: - End time
            let timeInterval = Double(end.uptimeNanoseconds - start.uptimeNanoseconds) / 1_000_000_000
            print("Time: \(timeInterval)")
            
            //MARK: - Time: 0.208933416
//        }
        
        
        //MARK: - Background
        //
//                imageProcessor.processImagesOnThread(sourceImages: imageStorage,
//                                                     filter: .fade,
//                                                     qos: .background)
//                { imageStorage in
//        
//                    DispatchQueue.main.async { [ weak self ] in
//        
//                        for image in imageStorage {
//                            guard let image = image else {return}
//                            self?.imageStorage2.append(UIImage(cgImage: image))
//        
//                            self?.collectionView.reloadData()
//                        }
//                    }
//        
//                    let end = DispatchTime.now() //MARK: - End time
//                    let timeInterval = Double(end.uptimeNanoseconds - start.uptimeNanoseconds) / 1_000_000_000
//                    print("Time: \(timeInterval)")
        //MARK: -Time: 0.771477291
//                }
        
        
//        MARK: - UserInitiated
//                imageProcessor.processImagesOnThread(sourceImages: imageStorage,
//                                                     filter: .fade,
//                                                     qos: .userInitiated)
//                                                     { imageStorage in
//        
//                    DispatchQueue.main.async { [ weak self ] in
//        
//                        for image in imageStorage {
//                            guard let image = image else {return}
//                            self?.imageStorage2.append(UIImage(cgImage: image))
//        
//                            self?.collectionView.reloadData()
//                        }
//                    }
//        
//                    let end = DispatchTime.now() //MARK: - End time
//                    let timeInterval = Double(end.uptimeNanoseconds - start.uptimeNanoseconds) / 1_000_000_000
//                    print("Time: \(timeInterval)")
                    }
        //MARK: -Time: 0.219024667
    }
    
    private func setupViewController () {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        title = "Photo Gallery"
    }
    
    private enum reuseID: String {
        case photos = "PhotosCollectionViewCell_ReuseID"
    }
    
    private func collectionViewLayout() {
        view.addSubview(collectionView)
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            
        ])
    }
    
    private func TuneCollectionView() {
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: reuseID.photos.rawValue)
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imageStorage2.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseID.photos.rawValue, for: indexPath) as! PhotosCollectionViewCell
        
        cell.image.image = imageStorage2[indexPath.item]
        //        let photo = photosStorage[indexPath.row]
        //        cell.congigure(with: photoCollection)
        
        return cell
    }
    
}

extension PhotosViewController: UICollectionViewDelegate {
    
}
