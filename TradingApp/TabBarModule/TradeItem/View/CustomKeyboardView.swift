//
//  CustomKeyboardView.swift
//  TradingApp
//
//  Created by Vasiliy Vygnych on 20.12.2023.
//

import UIKit

class CustomKeyboardView: UIView {
    var presenter: TradePresenterProtocol?
    
//MARK: - UIButtons
    private var firstButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.setTitle("1",
                        for: .normal)
        return button
    }()
    private var secondButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.setTitle("2",
                        for: .normal)
        return button
    }()
    private var thirdButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.setTitle("3",
                        for: .normal)
        return button
    }()
    private var fourthButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.setTitle("4",
                        for: .normal)
        return button
    }()
    private var fifthButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.setTitle("5",
                        for: .normal)
        return button
    }()
    private var sixthButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.setTitle("6",
                        for: .normal)
        return button
    }()
    private var seventhButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.setTitle("7",
                        for: .normal)
        return button
    }()
    private var eighthButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.setTitle("8",
                        for: .normal)
        return button
    }()
    private var ninthButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.setTitle("9",
                        for: .normal)
        return button
    }()
    private var zeroButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.setTitle("0",
                        for: .normal)
        return button
    }()
    private var deleteButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.setImage(UIImage(systemName: "delete.forward.fill"),
                        for: .normal)
        button.tintColor = .white
        return button
    }()
    private var doneButton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "green")
        button.layer.cornerRadius = 10
        button.setTitle("done",
                        for: .normal)
        return button
    }()
//MARK: - init
    init() {
        super.init(frame: .zero)
        initialization()
        setupeConstraint()
        setupeButton()
    }
     required init(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
}
//MARK: - extension
private extension CustomKeyboardView {
//MARK: - initialization
    func initialization() {
        self.addSubview(firstButton)
        self.addSubview(secondButton)
        self.addSubview(thirdButton)
        self.addSubview(fourthButton)
        self.addSubview(fifthButton)
        self.addSubview(sixthButton)
        self.addSubview(seventhButton)
        self.addSubview(eighthButton)
        self.addSubview(ninthButton)
        self.addSubview(zeroButton)
        self.addSubview(deleteButton)
        self.addSubview(doneButton)
    }
//MARK: - setupeButton
    private func setupeButton() {
        firstButton.addTarget(self, action: #selector(one), for: .touchUpInside)
        secondButton.addTarget(self, action: #selector(two), for: .touchUpInside)
        thirdButton.addTarget(self, action: #selector(three), for: .touchUpInside)
        fourthButton.addTarget(self, action: #selector(four), for: .touchUpInside)
        fifthButton.addTarget(self, action: #selector(five), for: .touchUpInside)
        sixthButton.addTarget(self, action: #selector(sixt), for: .touchUpInside)
        seventhButton.addTarget(self, action: #selector(seven), for: .touchUpInside)
        eighthButton.addTarget(self, action: #selector(eight), for: .touchUpInside)
        ninthButton.addTarget(self, action: #selector(nint), for: .touchUpInside)
        zeroButton.addTarget(self, action: #selector(zero), for: .touchUpInside)
        deleteButton.addTarget(self, action: #selector(deleteNumder), for: .touchUpInside)
        doneButton.addTarget(self, action: #selector(done), for: .touchUpInside)
    }
//MARK: - firstButton target
    @objc func one() {
        presenter?.clickAnimation(button: firstButton)
        presenter?.keyboardNumber(number: 1)
    }
//MARK: - secondButton target
    @objc func two() {
        presenter?.clickAnimation(button: secondButton)
        presenter?.keyboardNumber(number: 2)
    }
//MARK: - thirdButton target
    @objc func three() {
        presenter?.clickAnimation(button: thirdButton)
        presenter?.keyboardNumber(number: 3)
    }
//MARK: - fourthButton target
    @objc func four() {
        presenter?.clickAnimation(button: fourthButton)
        presenter?.keyboardNumber(number: 4)
    }
//MARK: - fifthButton target
    @objc func five() {
        presenter?.clickAnimation(button: fifthButton)
        presenter?.keyboardNumber(number: 5)
    }
//MARK: - sixthButton target
    @objc func sixt() {
        presenter?.clickAnimation(button: sixthButton)
        presenter?.keyboardNumber(number: 6)
    }
//MARK: - seventhButton target
    @objc func seven() {
        presenter?.clickAnimation(button: seventhButton)
        presenter?.keyboardNumber(number: 7)
    }
//MARK: - eighthButton target
    @objc func eight() {
        presenter?.clickAnimation(button: eighthButton)
        presenter?.keyboardNumber(number: 8)
    }
//MARK: - ninthButton target
    @objc func nint() {
        presenter?.clickAnimation(button: ninthButton)
        presenter?.keyboardNumber(number: 9)
    }
//MARK: - zeroButton target
    @objc func zero() {
        presenter?.clickAnimation(button: zeroButton)
        presenter?.keyboardNumber(number: 0)
    }
//MARK: - deleteButton target
    @objc func deleteNumder() {
        presenter?.clickAnimation(button: deleteButton)
        print("deleteButton")
    }
//MARK: - doneButton target
    @objc func done() {
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
            self.doneButton.transform = CGAffineTransform(scaleX: 0.70,
                                                          y: 0.70)
            })
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
            self.doneButton.transform = CGAffineTransform(scaleX: 1,
                                                          y: 1)
        }, completion: { finished in
            UIView.animate(withDuration: 0.3,
                           delay: 0,
                           options: .curveEaseOut,
                           animations: {
                self.presenter?.closeKeyboard()
            })
        })
    }
//MARK: - setupeConstraint
    func setupeConstraint() {
        NSLayoutConstraint.activate([
        firstButton.topAnchor.constraint(equalTo: self.topAnchor),
        firstButton.widthAnchor.constraint(equalToConstant: 100),
        firstButton.heightAnchor.constraint(equalToConstant: 45),
        firstButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5)
        ])
        NSLayoutConstraint.activate([
        secondButton.topAnchor.constraint(equalTo: self.topAnchor),
        secondButton.widthAnchor.constraint(equalToConstant: 100),
        secondButton.heightAnchor.constraint(equalToConstant: 45),
        secondButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
        thirdButton.topAnchor.constraint(equalTo: self.topAnchor),
        thirdButton.widthAnchor.constraint(equalToConstant: 100),
        thirdButton.heightAnchor.constraint(equalToConstant: 45),
        thirdButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5)
        ])

        NSLayoutConstraint.activate([
        fourthButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 5),
        fourthButton.widthAnchor.constraint(equalToConstant: 100),
        fourthButton.heightAnchor.constraint(equalToConstant: 45),
        fourthButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5)
        ])
        NSLayoutConstraint.activate([
        fifthButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 5),
        fifthButton.widthAnchor.constraint(equalToConstant: 100),
        fifthButton.heightAnchor.constraint(equalToConstant: 45),
        fifthButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
        sixthButton.topAnchor.constraint(equalTo: thirdButton.bottomAnchor, constant: 5),
        sixthButton.widthAnchor.constraint(equalToConstant: 100),
        sixthButton.heightAnchor.constraint(equalToConstant: 45),
        sixthButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5)
        ])

        NSLayoutConstraint.activate([
        seventhButton.topAnchor.constraint(equalTo: fourthButton.bottomAnchor, constant: 5),
        seventhButton.widthAnchor.constraint(equalToConstant: 100),
        seventhButton.heightAnchor.constraint(equalToConstant: 45),
        seventhButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5)
        ])
        NSLayoutConstraint.activate([
        eighthButton.topAnchor.constraint(equalTo: fifthButton.bottomAnchor, constant: 5),
        eighthButton.widthAnchor.constraint(equalToConstant: 100),
        eighthButton.heightAnchor.constraint(equalToConstant: 45),
        eighthButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
        ninthButton.topAnchor.constraint(equalTo: sixthButton.bottomAnchor, constant: 5),
        ninthButton.widthAnchor.constraint(equalToConstant: 100),
        ninthButton.heightAnchor.constraint(equalToConstant: 45),
        ninthButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5)
        ])
        
        NSLayoutConstraint.activate([
        doneButton.topAnchor.constraint(equalTo: seventhButton.bottomAnchor, constant: 5),
        doneButton.widthAnchor.constraint(equalToConstant: 100),
        doneButton.heightAnchor.constraint(equalToConstant: 45),
        doneButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5)
        ])
        NSLayoutConstraint.activate([
        zeroButton.topAnchor.constraint(equalTo: eighthButton.bottomAnchor, constant: 5),
        zeroButton.widthAnchor.constraint(equalToConstant: 100),
        zeroButton.heightAnchor.constraint(equalToConstant: 45),
        zeroButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
        deleteButton.topAnchor.constraint(equalTo: ninthButton.bottomAnchor, constant: 5),
        deleteButton.widthAnchor.constraint(equalToConstant: 100),
        deleteButton.heightAnchor.constraint(equalToConstant: 45),
        deleteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5)
        ])
    }
}
