import UIKit
import Foundation


enum AppConfiguration: String {
    case people = "https://swapi.dev/api/people/16/"
    case films = "https://swapi.dev/api/films/6/"
    case planets = "https://swapi.dev/api/planets/1/"
}


struct NetworkManager {
 
    
    static func reques(for configuration: AppConfiguration) {

        guard let url = URL(string: configuration.rawValue) else { return }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, responce, error in
            
            if let error {
                print(error.localizedDescription)
                return
            }
            
            guard let responce = responce as? HTTPURLResponse else {
                print("No internet connection")
                return
            }
            if !((200..<300).contains(responce.statusCode)) {
                print(responce.statusCode, responce.allHeaderFields)
                return
            }
            
            guard let data else {
                print("No data")
                return
            }
            print(String(bytes: data, encoding: .utf8) ?? "")
        }
        task.resume()
    }
}
