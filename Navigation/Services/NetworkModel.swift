import Foundation

struct Planet: Decodable {
    let name: String
    let rotationPeriod: String
    let orbitlaPeriod: String
    let diameter: String
    let climate: String
    let gravity: String
    let terrain: String
    let surfaceWater: String
    let population: String
    let residents: [URL]?
    let films: [URL]?
    let created: String
    let edited: String
    let url: URL?
    
    enum CodingKeys: String, CodingKey {
        case name, diameter, climate, gravity, terrain, population, residents, films, created, edited, url
        case rotationPeriod = "rotation_period"
        case orbitlaPeriod = "orbital_period"
        case surfaceWater = "surface_water"
    }
}
