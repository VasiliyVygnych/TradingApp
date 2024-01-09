//
//  CollectionViewCell.swift
//  TradingApp
//
//  Created by Vasiliy Vygnych on 10.12.2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
//MARK: - textLabel
    var textLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
//MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupeLadel()
        self.backgroundColor = UIColor(named: "dark")
        self.layer.cornerRadius = 12
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//MARK: - setupeLadel
    private func setupeLadel() {
        addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: self.topAnchor,
                                       constant: 5),
            textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                           constant: 5),
            textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                            constant: -5),
            textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                          constant: -5),
        ])
    }
}
