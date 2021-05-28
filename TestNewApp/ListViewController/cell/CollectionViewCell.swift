//
//  CollectionViewCell.swift
//  TestNewApp
//
//  Created by Marina Svistkova on 28.05.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellTitle: UILabel!
    @IBOutlet weak var cellSubtitle: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(title: String, subtitle: String) {
        cellTitle.text = title
        cellSubtitle.text = subtitle
    }
}
