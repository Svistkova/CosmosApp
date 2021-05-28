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
        navigationController?.setNavigationBarHidden(true, animated: false)
    }



    @IBAction func getInfoTapped(_ sender: UIButton) {
        self.navigationController?.pushViewController(ListViewController(nibName: "ListViewController", bundle: nil), animated: true)
    }
}
