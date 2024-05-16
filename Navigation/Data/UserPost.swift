
import Foundation
import UIKit

struct UserPost {
    let author: String
    let description: String
    let image: UIImage
    let likes: String
    let views: String
}

extension UserPost {
    
    static func userPost() -> [UserPost] {
        [
            UserPost(author: "official.dota", description: "New Update Is Coming", image: UIImage(named: "dotaUpdate")!, likes: "Likes: 1023", views: "Views: 1683"),
            
            UserPost(author: "Maksim", description: "Thanks for congratulation", image: UIImage(named: "Congratulations")!, likes: "Likes: 914", views: "Views: 1274"),
            
            UserPost(author: "Alex", description: "What a beautiful morning", image: UIImage(named: "Morning")!, likes: "Likes: 21", views: "Views: 63"),
            
            UserPost(author: "Messi.fan", description: "I'll win", image: UIImage(named: "Win")!, likes: "Likes: 146", views: "Views: 283"),
            
        ]
    }
}

