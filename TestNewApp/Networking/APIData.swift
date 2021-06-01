//
//  APIData.swift
//  TestNewApp
//
//  Created by Marina Svistkova on 28.05.2021.
//

import Foundation

class ViewModel {
    let title: String
    let subTitle: String
    let type: CellType

    init(title: String, subTitle: String, type: CellType) {
        self.title = title
        self.subTitle = subTitle
        self.type = type
    }
}

struct APIData: Codable {
    let people: String
    let planets: String
    let films: String
    let species: String
    let vehicles: String
    let starships: String
}

enum CellType {
    case people
    case planets
    case films
    case species
    case vehicles
    case starships
}

struct DetailCellModel {
    let title: String
    let subTitle: String
}

// People
struct PeopleData: Codable {
    let results: [PeopleResultData]
}

struct PeopleResultData: Codable {
    let name: String
    let gender: String
}

// Planets
struct PlanetsData: Codable {
    let results: [PlanetsResultData]
}

struct PlanetsResultData: Codable {
    let name: String
    let diameter: String
}

//Films
struct FilmsData: Codable {
    let results: [FilmsResultData]
}

struct FilmsResultData: Codable {
    let title: String
    let director: String
}

// Species
struct SpeciesData: Codable {
    let results: [SpeciesResultData]
}

struct SpeciesResultData: Codable {
    let name: String
    let classification: String
}

//Vehicles
struct VehiclesData: Codable {
    let results: [VehiclesResultData]
}

struct VehiclesResultData: Codable {
    let name: String
    let model: String
}

//Starships
struct StarshipsData: Codable {
    let results: [StarshipsResultData]
}

struct StarshipsResultData: Codable {
    let name: String
    let model: String
}
