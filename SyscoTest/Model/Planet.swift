//
//  Planet.swift
//  SyscoTest
//
//  Created by Kasun Ranasinghe on 2022-12-02.
//

import Foundation


// MARK: - Planet
struct Planet:Codable,Hashable {
    let name, rotationPeriod, orbitalPeriod, diameter: String
    let climate, gravity, terrain, surfaceWater: String
    let population: String
    let residents, films: [String]
    let created, edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter, climate, gravity, terrain
        case surfaceWater = "surface_water"
        case population, residents, films, created, edited, url
    }
    
}

// To accept the results requre responce object

// MARK: - PlanetList
struct PlanetList:Codable {
    let count: Int
    let next: String
    let previous: String?
    let results: [Planet]
}

