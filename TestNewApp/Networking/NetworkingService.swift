//
//  NetworkingService.swift
//  TestNewApp
//
//  Created by Marina Svistkova on 28.05.2021.
//

import Foundation
import Alamofire

struct APINetworkingService {

    func getResults(completed: @escaping (APIData) -> Void) {
        let urlString = "https://swapi.dev/api"
        AF.request(urlString).responseDecodable(of: APIData.self) { response in
            switch response.result {
            case .success(let results):
                let resultsModel = APIData(people: results.people, planets: results.planets, films: results.films, species: results.species, vehicles: results.vehicles, starships: results.starships)
                completed(resultsModel)
            case .failure(_):
                print("Networking Failed")
            }
        }
    }

    func getDetailedResults(url: String, infoType: CellType, completed:  @escaping ([DetailCellModel]) -> Void) {

        switch infoType {
        case .people:
            AF.request(url).responseDecodable(of: PeopleData.self) { response in
                switch response.result {
                case .success(let data):
                    let resultModel: [DetailCellModel] = data.results.map { singlePersonInfo in
                        DetailCellModel(title: singlePersonInfo.name, subTitle: singlePersonInfo.gender)
                    }
                    completed(resultModel)
                case .failure(_):
                    print("Networking Failed")
                }
            }
        case .planets:
            AF.request(url).responseDecodable(of: PlanetsData.self) { response in
                switch response.result {
                case .success(let data):
                    let resultModel: [DetailCellModel] = data.results.map { singleInfo in
                        DetailCellModel(title: singleInfo.name, subTitle: singleInfo.diameter)
                    }
                    completed(resultModel)
                case .failure(_):
                    print("Networking Failed")
                }
            }
        case .films:
            AF.request(url).responseDecodable(of: FilmsData.self) { response in
                switch response.result {
                case .success(let data):
                    let resultModel: [DetailCellModel] = data.results.map { singleInfo in
                        DetailCellModel(title: singleInfo.title, subTitle: singleInfo.director)
                    }
                    completed(resultModel)
                case .failure(_):
                    print("Networking Failed")
                }
            }
        case .species:
            AF.request(url).responseDecodable(of: SpeciesData.self) { response in
                switch response.result {
                case .success(let data):
                    let resultModel: [DetailCellModel] = data.results.map { singleInfo in
                        DetailCellModel(title: singleInfo.name, subTitle: singleInfo.classification)
                    }
                    completed(resultModel)
                case .failure(_):
                    print("Networking Failed")
                }
            }
        case .vehicles:
            AF.request(url).responseDecodable(of: VehiclesData.self) { response in
                switch response.result {
                case .success(let data):
                    let resultModel: [DetailCellModel] = data.results.map { singleInfo in
                        DetailCellModel(title: singleInfo.name, subTitle: singleInfo.model)
                    }
                    completed(resultModel)
                case .failure(_):
                    print("Networking Failed")
                }
            }
        case .starships:
            AF.request(url).responseDecodable(of: StarshipsData.self) { response in
                switch response.result {
                case .success(let data):
                    let resultModel: [DetailCellModel] = data.results.map { singleInfo in
                        DetailCellModel(title: singleInfo.name, subTitle: singleInfo.model)
                    }
                    completed(resultModel)
                case .failure(_):
                    print("Networking Failed")
                }
            }
        }
    }
}

