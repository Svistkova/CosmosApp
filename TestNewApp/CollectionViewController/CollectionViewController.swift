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

    private var viewModelArray = [ViewModel]() {
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
            guard let self = self else { return }
            self.viewModelArray = [
                ViewModel(title: "People", subTitle: model.people),
                ViewModel(title: "Planets", subTitle: model.planets),
                ViewModel(title: "Films", subTitle: model.films),
                ViewModel(title: "Species", subTitle: model.species),
                ViewModel(title: "Vehicles", subTitle: model.vehicles),
                ViewModel(title: "Starships", subTitle: model.starships),
            ]
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModelArray.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        cell.configure(title: viewModelArray[indexPath.row].title, subtitle: viewModelArray[indexPath.row].subTitle)
        return cell
    }

    // MARK: UICollectionViewDelegate

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(viewModelArray[indexPath.row].subTitle)
        let secondVC = DetailCollectionViewController(nibName: "DetailCollectionViewController", bundle: nil)

        service.getDetailedResults(url: viewModelArray[indexPath.row].subTitle) { peopleModel in
            secondVC.cells = peopleModel.map { ViewModel(title: $0.name, subTitle: $0.gender) }
        }

        self.navigationController?.pushViewController(secondVC, animated: false)
    }
}

    //MARK: UICollectionViewDelegateFlowLayout

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 20, height: 80)
    }
}


