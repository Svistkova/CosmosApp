//
//  CollectionViewController.swift
//  TestNewApp
//
//  Created by Marina Svistkova on 28.05.2021.
//

import UIKit


class CollectionViewController: UICollectionViewController {

    private let reuseIdentifier = "Cell"
    private let service = APINetworkingService()

    private var cells = ["People" : "",
                 "Planets" : "",
                 "Films" : "",
                 "Species" : "",
                 "Vehicles" : "",
                 "Starships" : ""
    ] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(false, animated: false)
        self.collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
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

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        let titleArray = cells.map({$0.key})
        cell.configure(title: titleArray[indexPath.row], subtitle: cells[titleArray[indexPath.row]]!)
        cell.backgroundColor = .red

        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
}
