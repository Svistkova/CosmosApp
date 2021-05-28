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
                 "Starships" : ""] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(false, animated: false)
        self.title = "Menu"
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
        cell.backgroundColor = UIColor(named: "cellColor")
        cell.layer.cornerRadius = 20
        return cell
    }

    // MARK: UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    }
}

    //MARK: UICollectionViewDelegateFlowLayout

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 20, height: 80)
    }
}
