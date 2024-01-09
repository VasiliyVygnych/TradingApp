//
//  CurrencyViewController.swift
//  TradingApp
//
//  Created by Vasiliy Vygnych on 18.10.2023.
//

import UIKit

class CurrencyViewController: UIViewController {
    
    var presenter: CurrencyPresenterProtocol?
    private var cell = "cell"
    let defaults = UserDefaults.standard
    
//MARK: - collectionView & layout
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = .init(width: 140,
                                height: 54)
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = .init(top: 20, left: 35, bottom: 5, right: 35)
        return layout
    }()
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: self.layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(named: "theme")
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
//MARK: - navigationTitle
    private var navigationTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 22,
                                 weight: .bold)
        label.text = "Currency pair"
        return label
    }()
//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = navigationTitle
        view.backgroundColor = UIColor(named: "theme")
        setupeView()
        setupeButton()
        setupeConstraint()
    }
//MARK: - setupeView
    private func setupeView() {
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionViewCell.self,
                                forCellWithReuseIdentifier: cell)
    }
//MARK: - setupeButton
    private func setupeButton() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(back))
         backButton.tintColor = .white
         navigationItem.leftBarButtonItem = backButton

    }
//MARK: - popViewController
    @objc func back() {
        presenter?.tradeScreen()
    }
//MARK: - setupeConstraint
    private func setupeConstraint() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            collectionView.widthAnchor.constraint(equalToConstant: 380),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
//MARK: - extension CurrencyViewProtocol
extension CurrencyViewController: CurrencyViewProtocol {
}
//MARK: - CollectionViewDataSource & Delegate
extension CurrencyViewController: UICollectionViewDataSource,
                                    UICollectionViewDelegate {
//MARK: - numberOfItemsInSection
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        currencyPair.count
    }
//MARK: - cellForItemAt
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cell,
                                                      for: indexPath) as! CollectionViewCell
        presenter?.saveSelection(indexPath: indexPath, cell: cell)
        let model = currencyPair[indexPath.row]
        cell.textLabel.text = model.currencyPair
        return cell
    }
//MARK: - didSelectItemAt
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        let collectionView = self.collectionView.cellForItem(at: indexPath)
        let model = currencyPair[indexPath.item]
        defaults.set(indexPath.item,
                     forKey: "saveSelectionCell")
            UIView.animate(withDuration: 0.4,
                           delay: 0,
                           options: .curveEaseOut,
                           animations: {
            collectionView?.transform = CGAffineTransform(scaleX: 0.70,
                                                          y: 0.70)
                self.сellColor(indexPath: indexPath)
                self.collectionView.reloadData()
            }, completion: { finished in
                self.presenter?.getButtonText(string: model.currencyPair)
            })
            UIView.animate(withDuration: 0.4,
                           delay: 0,
                           options: .curveEaseOut,
                           animations: {
            collectionView?.transform = CGAffineTransform(scaleX: 1,
                                                          y: 1)
        }, completion: nil)
    }
//MARK: - сellColor
    func сellColor(indexPath: IndexPath) {
        let collectionView = self.collectionView.cellForItem(at: indexPath)
        if indexPath.item == defaults.integer(forKey: "saveSelectionCell") {
            collectionView?.backgroundColor = UIColor(named: "green")
        } else {
            collectionView?.backgroundColor = UIColor(named: "dark")
        }
    }
}
