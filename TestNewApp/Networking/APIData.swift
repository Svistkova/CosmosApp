//
//  APIData.swift
//  TestNewApp
//
//  Created by Marina Svistkova on 28.05.2021.
//

import Foundation

struct APIData: Codable {
    let people: String
    let planets: String
    let films: String
    let species: String
    let vehicles: String
    let starships: String
}

struct APIModel: Decodable {
    let people: String
    let planets: String
    let films: String
    let species: String
    let vehicles: String
    let starships: String
}
