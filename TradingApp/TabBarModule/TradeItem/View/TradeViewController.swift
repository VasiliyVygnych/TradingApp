//
//  TradeViewController.swift
//  TradingApp
//
//  Created by Vasiliy Vygnych on 18.10.2023.
//

import UIKit
import WebKit

class TradeViewController: UIViewController,
                           WKUIDelegate {
    
    var presenter: TradePresenterProtocol?
    private let loader = UIActivityIndicatorView()
    private var webView = WKWebView()
    
//MARK: - navigationTitle
    private var navigationTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 22,
                                 weight: .bold)
        label.text = "Trade"
        return label
    }()
//MARK: - customView
    var customView: CustomViewTrade = {
       let view = CustomViewTrade()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
//MARK: - balansView
    private var balansView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "dark")
        view.layer.cornerRadius = 12
        return view
    }()
    private var balanceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 12,
                                 weight: .semibold)
        label.text = "Balance"
        return label
    }()
    private var balanceTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 16,
                                 weight: .bold)
        return label
    }()
//MARK: - conteinerStackView
    private var conteinerStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        return stack
    }()
//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.titleView = navigationTitle
        view.backgroundColor = UIColor(named: "theme")
        setupeCustomViews()
        setupeLoader()
        setupeWebView()
        setupeView()
        setupeConstraint()
        presenter?.viewDidLoad()
        presenter?.updateView = { [ weak self ] in
            self?.balanceTitle.text = String(myFinances.balance)
            self?.customView.investmentTitle.text = String(myFinances.investment)
        }
    }
//MARK: - request
    override func viewWillAppear(_ animated: Bool) {
        presenter?.request()
    }
//MARK: - setupeCustomView
    private func setupeCustomViews() {
        customView.presenter = presenter
        customView.customKeyboardView.presenter = presenter
    }
//MARK: - setupeView
    private func setupeView() {
        view.addSubview(balansView)
        balansView.addSubview(balanceLabel)
        balansView.addSubview(balanceTitle)
        view.addSubview(conteinerStackView)
        conteinerStackView.addArrangedSubview(customView)
        let recognizer = UITapGestureRecognizer(target: self,
                                                action: #selector(didTap))
        view.addGestureRecognizer(recognizer)
    }
//MARK: - view didTap
    @objc func didTap(_ gesture: UITapGestureRecognizer) {
        let keyboard = gesture.location(in: view.superview)
        if (view.layer.presentation()?.frame.contains(keyboard))! {
            UIView.animate(withDuration: 0.4) {
                self.presenter?.closeKeyboard()
                self.customView.defaulViewtBorderColor()
            }
        }
    }
//MARK: - setupeLoader
    private func setupeLoader() {
        webView.addSubview(loader)
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.color = .white
        loader.startAnimating()
    }
//MARK: - setupWebView
    private func setupeWebView() {
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.navigationDelegate = self
        webView.backgroundColor = UIColor(named: "theme")
    }
    private func setupeConstraint() {
//MARK: - loader
        NSLayoutConstraint.activate([
            loader.centerYAnchor.constraint(equalTo: webView.centerYAnchor),
            loader.centerXAnchor.constraint(equalTo: webView.centerXAnchor),
        ])
//MARK: - balansView
        NSLayoutConstraint.activate([
            balansView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            balansView.widthAnchor.constraint(equalToConstant: 315),
            balansView.heightAnchor.constraint(equalToConstant: 54),
            balansView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            balanceLabel.topAnchor.constraint(equalTo: balansView.topAnchor, constant: 5),
            balanceLabel.centerXAnchor.constraint(equalTo: balansView.centerXAnchor),

            balanceTitle.topAnchor.constraint(equalTo: balansView.topAnchor, constant: 27),
            balanceTitle.centerXAnchor.constraint(equalTo: balansView.centerXAnchor)
        ])
//MARK: - webView
        NSLayoutConstraint.activate([
            webView.widthAnchor.constraint(equalToConstant: 390),
            webView.heightAnchor.constraint(equalToConstant: 340),
            webView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -290)
        ])
//MARK: - conteinerStackView
        NSLayoutConstraint.activate([
            conteinerStackView.widthAnchor.constraint(equalToConstant: 400),
            conteinerStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            conteinerStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80),
        ])
    }
}
//MARK: - extension TradeViewProtocol & setData
extension TradeViewController: TradeViewProtocol {
    func setData() {
        balanceTitle.text = String(myFinances.balance)
    
        let formatterTimer = NumberFormatter()
        formatterTimer.decimalSeparator = ":"
        formatterTimer.maximumFractionDigits = 2
        formatterTimer.minimumFractionDigits = 2
        let formattedTimer = formatterTimer.string(from: NSNumber(value: 59))
        customView.timerTitle.text = formattedTimer
        
        let formatterInvestment = NumberFormatter()
        formatterInvestment.decimalSeparator = "."
        formatterInvestment.maximumFractionDigits = 2
        formatterInvestment.minimumFractionDigits = 1
        let formattedInvestment = formatterInvestment.string(from: NSNumber(value: myFinances.investment))
        customView.investmentTitle.text = formattedInvestment
    }
//MARK: - setTextButton
    func setTextButton(text: String) {
        customView.buttonTitle.text = text
    }
//MARK: - webView load
    func setRequest(request: URLRequest) {
        webView.load(request)
    }
}
//MARK: - WKNavigationDelegate
extension TradeViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView,
                 didCommit navigation: WKNavigation!) {
        loader.stopAnimating()
    }
}
