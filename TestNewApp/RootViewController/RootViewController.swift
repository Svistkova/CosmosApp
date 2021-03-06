//
//  RootViewController.swift
//  TestNewApp
//
//  Created by Marina Svistkova on 26.05.2021.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    @IBAction func getInfoTapped(_ sender: UIButton) {
        self.navigationController?.pushViewController(CollectionViewController(nibName: "CollectionViewController", bundle: nil), animated: true)
    }
}
