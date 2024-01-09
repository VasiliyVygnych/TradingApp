//
//  ViewTopController.swift
//  TradingApp
//
//  Created by Vasiliy Vygnych on 18.10.2023.
//

import UIKit

class ViewTopController: UIViewController {
    
    var presenter: TopPresenterProtocol?
    private var cell = "cell"
    
    private var navigationTitle: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 22,
                                 weight: .bold)
        label.text = "TOP 10 Traders"
        return label
    }()
    
    private var headerLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 12,
                                 weight: .semibold)
        label.textColor = .white
        label.backgroundColor = UIColor(named: "lightDarkCell")
        return label
    }()
    private var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.rowHeight = 50
        view.allowsSelection = false
        view.backgroundColor = UIColor(named: "darkCell")
        return view
    }()
//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = navigationTitle
        view.backgroundColor = UIColor(named: "theme")
        setupeTable()
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(named: "theme")
        navigationController?.navigationBar.standardAppearance = appearance
    }
//MARK: - setupeTable
    private func setupeTable() {
        view.addSubview(tableView)
        tableView.layer.cornerRadius = 15
        tableView.register(TableView.self,
                            forCellReuseIdentifier: cell)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.bounces = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor,
                                           constant: 165),
            tableView.widthAnchor.constraint(equalToConstant: 351),
            tableView.heightAnchor.constraint(equalToConstant: 550),
            tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
extension ViewTopController: UITableViewDelegate,
                             UITableViewDataSource {
//MARK: viewForHeaderInSection
    func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0,
                                                        y: 0,
                                                        width: tableView.frame.width,
                                                        height: 50))
        headerLabel.frame = CGRect.init(x: 0,
                                        y: -22,
                                        width: headerView.frame.width,
                                        height: headerView.frame.height)
        headerLabel.text = "  №     County       Name                    Deposit                 Profit"
        headerView.addSubview(headerLabel)
        return headerView
    }
//MARK: - numberOfRowsInSection
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return modelTrade.count
    }
//MARK: - cellForRowAt
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cell,
                                                 for: indexPath) as! TableView

//        self.tableView.endUpdates()
//        self.tableView.beginUpdates()

        
        
        let model = modelTrade.sorted() { $0.profit > $1.profit }[indexPath.row]
        
        Timer.scheduledTimer(withTimeInterval: 3.0,
                             repeats: true) { timer in
            modelTrade = modelTrade.sorted() { $0.profit < $1.profit }
            self.tableView.reloadData()
        }
        
       
        cell.configuration(model: model)
        cell.randomDataСhanges(model: model,
                           indexPath: indexPath)
        cell.numberLabel.text = String(format: "%.0f%",
                                       Float(indexPath.row + 1))
        let colors = [UIColor(named: "darkCell"),
                      UIColor(named: "lightDarkCell")]
        cell.backgroundColor = colors[indexPath.row % colors.count]
        return cell
    }
}
