//
//  WelcomeViewController.swift
//  TradingApp
//
//  Created by Vasiliy Vygnych on 27.12.2023.
//

import UIKit

class WelcomeViewController: UIViewController {
    
//MARK: - topConteinerView
    private var topConteinerView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "dark")
        view.layer.cornerRadius = 25
        return view
    }()
    private var imageApp: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "AppIcon")
        return image
    }()
    private var nameApp: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 18,
                                 weight: .bold)
        label.text = "TradeApp"
        return label
    }()
    private var descriptionApp: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14,
                                 weight: .semibold)
        label.text = "Oфициальная онлайн площадка для трейдинга, которой пользуются миллионы пользователей."
        return label
    }()
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15,
                                 weight: .bold)
        label.text = "text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text text"
        return label
    }()
//MARK: - UIButton
    private var backButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back to the agreement",
                        for: .normal)
        button.backgroundColor = UIColor(named: "dark")
        button.layer.cornerRadius = 12
        return button
    }()
//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = UIColor(named: "theme")
        setupeView()
        setupeConstraint()
        setupeButton()
    }
//MARK: - setupeView
    private func setupeView() {
        view.addSubview(topConteinerView)
        topConteinerView.addSubview(imageApp)
        topConteinerView.addSubview(nameApp)
        topConteinerView.addSubview(descriptionApp)
        view.addSubview(titleLabel)
        view.addSubview(backButton)
    }
//MARK: - setupeButton
    private func setupeButton() {
        backButton.addTarget(self,
                             action: #selector(popToRoot),
                             for: .touchUpInside)
    }
//MARK: - mhetod target
    @objc func popToRoot() {
        navigationController?.popViewController(animated: true)
     }
//MARK: - setupeConstraint
    private func setupeConstraint() {
        NSLayoutConstraint.activate([
            topConteinerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            topConteinerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topConteinerView.widthAnchor.constraint(equalToConstant: 360),
            topConteinerView.heightAnchor.constraint(equalToConstant: 120),
        ])
        
        NSLayoutConstraint.activate([
            imageApp.leadingAnchor.constraint(equalTo: topConteinerView.leadingAnchor, constant: 10),
            imageApp.centerYAnchor.constraint(equalTo: topConteinerView.centerYAnchor),
            imageApp.widthAnchor.constraint(equalToConstant: 100),
            imageApp.heightAnchor.constraint(equalToConstant: 100),
        ])
        
        NSLayoutConstraint.activate([
            nameApp.topAnchor.constraint(equalTo: topConteinerView.topAnchor, constant: 10),
            nameApp.leadingAnchor.constraint(equalTo: imageApp.trailingAnchor, constant: 10),
            nameApp.widthAnchor.constraint(equalToConstant: 100),
            nameApp.heightAnchor.constraint(equalToConstant: 20),
        ])
        
        NSLayoutConstraint.activate([
            descriptionApp.topAnchor.constraint(equalTo: nameApp.bottomAnchor, constant: 5),
            descriptionApp.leadingAnchor.constraint(equalTo: imageApp.trailingAnchor, constant: 10),
            descriptionApp.trailingAnchor.constraint(equalTo: topConteinerView.trailingAnchor, constant: -13),
            descriptionApp.heightAnchor.constraint(lessThanOrEqualToConstant: 75)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topConteinerView.bottomAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backButton.widthAnchor.constraint(equalToConstant: 315),
            backButton.heightAnchor.constraint(equalToConstant: 54),
            backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80)
        ])
    }
}
