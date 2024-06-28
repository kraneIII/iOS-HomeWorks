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
    
    
    func request(id: Int, completion: @escaping (_ name: String)-> Void) {
        
        guard let jsonURL = URL(string: "https://jsonplaceholder.typicode.com/todos/" + String(id)) else { return }
        let task = URLSession.shared.dataTask(with: jsonURL) { data, responce, error in
            
            if let error {
                print(error.localizedDescription)
                return
            }
            
            guard let data else {
                print("no data")
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
            do {
                guard let answer = try JSONSerialization.jsonObject(with: data) as? [String: Any] else { return }
                
                guard let name = answer["title"] as? String else {
                    return
                }
                completion(name)
            }
            catch {
                print("oops")
            }
            
        }
        task.resume()
    }
    
    
    
    func secondRequest(completion: @escaping ((Planet) -> Void)) {
        
        guard let url = URL(string: "https://swapi.dev/api/planets/1") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, responce, error in
            
            if let error {
                print(error.localizedDescription)
                return
            }
            
            guard let data else {
                print("no data")
                return
            }
                        
            guard let responce = responce as? HTTPURLResponse else {
                return
            }
            if !((200..<300).contains(responce.statusCode)) {
                print("responce error")
                return
            }
                do {
                    let answer = try JSONDecoder().decode(Planet.self, from: data)
                    completion(answer)
                }
                catch {
                    print(error.localizedDescription)
                }
        }
        task.resume()
    }
}
