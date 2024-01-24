//
//  TableView.swift
//  TradingApp
//
//  Created by Vasiliy Vygnych on 18.10.2023.
//

import UIKit

class TableView: UITableViewCell {
    
// MARK: - UILabel
    var numberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15,
                                 weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    private var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15,
                                 weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
     var depositLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15,
                                 weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .right
        return label
    }()
     var profitLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15,
                                 weight: .bold)
        label.textColor = .green
        label.numberOfLines = 0
        label.textAlignment = .right
        return label
    }()
// MARK: - UIImageView
   private var imagePreview: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
// MARK: - configuration
    func configuration(model: Items) {
        nameLabel.text = model.name
        depositLabel.text = String(format: "$%.0f%",
                                   Float(model.deposit))
        profitLabel.text = String(format: "$%.0f%",
                                  Float(model.profit))
        imagePreview.image = model.image
    }
//MARK: - randomDataСhanges
    func randomDataСhanges(model: Items,
                           indexPath: IndexPath) {
        Timer.scheduledTimer(withTimeInterval: 3.0,
                             repeats: true) { timer in
            let randomInt = Int.random(in: -1000...1000)
            let randomItem = Int.random(in: 0...9)
            if indexPath.row == randomItem {
                self.depositLabel.text = String(format: "$%.0f%",
                                           Float(model.deposit + randomInt))
                self.profitLabel.text = String(format: "$%.0f%",
                                          Float(model.profit + randomInt))
                if model.deposit & model.profit < 0 {
                    self.depositLabel.textColor = .red
                    self.profitLabel.textColor = .red
                }
            }
        }
    }
// MARK: - init
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style,
                   reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel)
        contentView.addSubview(depositLabel)
        contentView.addSubview(imagePreview)
        contentView.addSubview(profitLabel)
        contentView.addSubview(numberLabel)
        setupeConstraint()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
// MARK: - setupeConstraint
    private func setupeConstraint() {
        NSLayoutConstraint.activate([
            numberLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            numberLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
            numberLabel.widthAnchor.constraint(equalToConstant: 20),
            
            imagePreview.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imagePreview.leftAnchor.constraint(equalTo: numberLabel.rightAnchor, constant: 10),
            imagePreview.widthAnchor.constraint(equalToConstant: 26.24),
            imagePreview.heightAnchor.constraint(equalToConstant: 26.24),
            
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.leftAnchor.constraint(equalTo: imagePreview.rightAnchor, constant: 30),
            nameLabel.widthAnchor.constraint(equalToConstant: 67.8),
            
            depositLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            depositLabel.rightAnchor.constraint(equalTo: profitLabel.leftAnchor, constant: -20),
            depositLabel.widthAnchor.constraint(equalToConstant: 61.24),
            
            profitLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profitLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            profitLabel.widthAnchor.constraint(equalToConstant: 74.36),
        ])
    }
}
