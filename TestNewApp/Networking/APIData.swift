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

    init(title: String, subTitle: String) {
        self.title = title
        self.subTitle = subTitle
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

struct PeopleData: Codable {
    let results: [PeopleResultData]
}

struct PeopleResultData: Codable {
    let name: String
    let gender: String
}


enum CellType {
    case people(PeopleModel)
    case planets(PlanetsModel)
    case films(FilmsModel)
    case species(SpeciesModel)
    case vehicles(VehiclesModel)
    case starships(StarshipsModel)
}


struct PeopleModel {
    let name: String
    let gender: String
}

struct PlanetsModel {

}

struct FilmsModel {

}

struct SpeciesModel {

}

struct VehiclesModel {

}

struct StarshipsModel {

}
