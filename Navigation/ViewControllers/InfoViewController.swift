import AVFoundation
import UIKit

class InfoViewController: UIViewController {
    
    private var audioPlayer: AVAudioPlayer!
    
    var track = "Shaya Zamora No Love For A Sinner"

    private lazy var playAudio: UIButton = {
        let playAudio = UIButton()
        playAudio.translatesAutoresizingMaskIntoConstraints = false
        playAudio.setImage(UIImage(systemName: "play"), for: .normal)
        playAudio.layer.shadowColor = UIColor.black.cgColor
        playAudio.layer.shadowRadius = 5
        playAudio.addTarget(self, action: #selector(play), for: .touchUpInside)
        
        return playAudio
    }()
    
    private lazy var nextAudio: UIButton = {
        let nextAudio = UIButton()
        nextAudio.setImage(UIImage(systemName: "arrowshape.right.fill"), for: .normal)
        nextAudio.translatesAutoresizingMaskIntoConstraints = false
     
        return nextAudio
    }()
    
    private lazy var previousAudio: UIButton = {
        let previousAudio = UIButton()
        previousAudio.setImage(UIImage(systemName: "arrowshape.left.fill"), for: .normal)
        previousAudio.translatesAutoresizingMaskIntoConstraints = false
 
        return previousAudio
    }()
    
    private lazy var audioLabel: UILabel = {
       let audioLabel = UILabel()
        audioLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return audioLabel
    }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAVPlayer()
        setupViewController()
        layout()
    }
    
    private func setupAVPlayer() {
                
        guard let firstMusicURL = Bundle.main.url(forResource: "Shaya Zamora No Love For A Sinner", withExtension: "mp3") else { return }
        guard let secondMusicURL = Bundle.main.url(forResource: "Abe Parker It Is What It Is", withExtension: "mp3") else { return }
        
        let music: [URL] = [firstMusicURL, secondMusicURL]
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: music.first!)
//            try audioPlayer = AVAudioPlayer(contentsOf: secondMusicURL)
            setupAudioSession()
        }
        catch {
            print("something went wong")
        }
    }
    
    private func setupAudioSession() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playback)
        }
        catch {
            print("error")
        }
    }
    
    private func playMusic() {
        if audioPlayer.isPlaying {
            audioPlayer.stop()
            playAudio.setImage(UIImage(systemName: "pause"), for: .normal)
        }
        else {
            audioPlayer.play()
            playAudio.setImage(UIImage(systemName: "play"), for: .normal)
        }
    }
    
    private func addSubViews() {
//        view.addSubview(button)
        view.addSubview(previousAudio)
        view.addSubview(nextAudio)
        view.addSubview(playAudio)
        view.addSubview(audioLabel)
    }
    
    
    // MARK: - Layout
    private func layout() {
        addSubViews()
        NSLayoutConstraint.activate([
            
            playAudio.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playAudio.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            nextAudio.leftAnchor.constraint(equalTo: playAudio.rightAnchor, constant: 10),
            nextAudio.topAnchor.constraint(equalTo: playAudio.topAnchor),
            
            previousAudio.topAnchor.constraint(equalTo: playAudio.topAnchor),
            previousAudio.rightAnchor.constraint(equalTo: playAudio.leftAnchor, constant: -10),
            
            audioLabel.bottomAnchor.constraint(equalTo: playAudio.topAnchor,constant: 10),
            audioLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    
    // MARK: - Setup
    
    private func setupViewController() {
        title = "Something"
        view.backgroundColor = .white
        
    }
    
    //MARK: - objc
    
    @objc func play() {
        playMusic()
    }
    
}
