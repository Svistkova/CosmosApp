//
//  ListViewController.swift
//  TestNewApp
//
//  Created by Marina Svistkova on 26.05.2021.
//

import UIKit


class ListViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    let service = APINetworkingService()

    var cells = ["People" : "",
                 "Planets" : "",
                 "Films" : "",
                 "Species" : "",
                 "Vehicles" : "",
                 "Starships" : ""
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }

    private func fetchData() {
        service.getResults { [weak self] model in
                self?.cells["People"] = model.people
                self?.cells["Planets"] = model.planets
                self?.cells["Films"] = model.films
                self?.cells["Species"] = model.species
                self?.cells["Vehicles"] = model.vehicles
                self?.cells["Starships"] = model.starships
        }
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.configure(title: "jnvifr", subtitle: "skjvbekrbev")
        return cell
    }

}

