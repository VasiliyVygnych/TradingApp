//
//  CustomViewTrade.swift
//  TradingApp
//
//  Created by Vasiliy Vygnych on 19.10.2023.
//

import UIKit

class CustomViewTrade: UIView {
    
    var presenter: TradePresenterProtocol?
    private let activityIndicator = UIActivityIndicatorView()
    
    private var stackView: UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        return stack
    }()
    var topView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "theme")
        return view
    }()
    var customKeyboardView: CustomKeyboardView = {
       let view = CustomKeyboardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "theme")
        return view
    }()
//MARK: - timerView
    private var timerView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "dark")
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1.0
        return view
    }()
    private var timerLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 12,
                                 weight: .semibold)
        label.text = "Timer"
        return label
    }()
     var timerTitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 16,
                                 weight: .bold)
        label.textAlignment = .center
        return label
    }()
    private var minusTime: UIButton = {
      let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "minus.circle"),
                                  for: .normal)
        button.tintColor = .white
        return button
    }()
    private var plusTime: UIButton = {
      let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "plus.circle"),
                                  for: .normal)
        button.tintColor = .white
        return button
    }()
//MARK: - investmentView
    private var investmentView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "dark")
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1.0
        return view
    }()
    private var investmentLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 12,
                                 weight: .semibold)
        label.text = "Investment"
        return label
    }()
    var investmentTitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 16,
                                 weight: .bold)
        label.textAlignment = .center
        return label
    }()
    private var investmentMinus: UIButton = {
      let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "minus.circle"),
                                  for: .normal)
        button.tintColor = .white
        return button
    }()
    private var investmentPlus: UIButton = {
      let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "plus.circle"),
                                  for: .normal)
        button.tintColor = .white
        return button
    }()
//MARK: - sellView
    private var sellButton: UIButton = {
       let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "red")
        view.layer.cornerRadius = 12
        return view
    }()
    private var sellTitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 24,
                                 weight: .bold)
        label.text = "Sell"
        return label
    }()
//MARK: - buyView
    private var buyButton: UIButton = {
       let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "green")
        view.layer.cornerRadius = 12
        return view
    }()
    private var buyTitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 24,
                                 weight: .bold)
        label.text = "Buy"
        return label
    }()
//MARK: - nextScreenButton
    private var nextScreenButton: UIButton = {
      let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "dark")
        button.layer.cornerRadius = 12
        return button
    }()
     var buttonTitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 16,
                                 weight: .bold)
         label.text = "Currency pair"
        return label
    }()
    private var buttonImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "arrow.left")
        return image
    }()
//MARK: - conteinerView
   var conteinerView: UIView = {
      let view = UIView()
       view.translatesAutoresizingMaskIntoConstraints = false
       view.backgroundColor = UIColor(named: "theme")
       return view
   }()
//MARK: - init
   init() {
       super.init(frame: .zero)
       setupeButton()
       initialization()
       setupeConstraint()
       setupeActivityIndicator()
       newView.append(conteinerView)
       let recognizer = UITapGestureRecognizer(target: self,
                                               action: #selector(didTap))
       self.addGestureRecognizer(recognizer)
   }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//MARK: - didTap timer & investmentView views
    @objc func didTap(_ gesture: UITapGestureRecognizer) {
        let timer = gesture.location(in: timerView.superview)
        let investmet = gesture.location(in: investmentView.superview)
       
        
        if (timerView.layer.presentation()?.frame.contains(timer))! {
            UIView.animate(withDuration: 0.4) {
                self.timerView.layer.borderColor = UIColor(named: "green")?.cgColor
                self.investmentView.layer.borderColor = UIColor(named: "theme")?.cgColor
                self.presenter?.openKeyboard()
            }
        }
       else if (investmentView.layer.presentation()?.frame.contains(investmet))! {
            UIView.animate(withDuration: 0.4) {
                self.investmentView.layer.borderColor = UIColor(named: "green")?.cgColor
                self.timerView.layer.borderColor = UIColor(named: "theme")?.cgColor
                self.presenter?.openKeyboard()
            }
       } else {
           UIView.animate(withDuration: 0.4) {
               self.presenter?.closeKeyboard()
               self.defaulViewtBorderColor()
           }
       }
    }
//MARK: - defaulViewtBorderColor
    func defaulViewtBorderColor() {
        investmentView.layer.borderColor = UIColor(named: "theme")?.cgColor
        timerView.layer.borderColor = UIColor(named: "theme")?.cgColor
    }
}
//MARK: - extension
private extension CustomViewTrade {
   func initialization() {
       self.addSubview(stackView)
       stackView.addArrangedSubview(topView)
       stackView.addArrangedSubview(conteinerView)
       
       nextScreenButton.addSubview(buttonTitle)
       nextScreenButton.addSubview(buttonImage)
       
       topView.addSubview(nextScreenButton)
       topView.addSubview(timerView)
       topView.addSubview(investmentView)
       topView.addSubview(sellButton)
       topView.addSubview(buyButton)
       
       timerView.addSubview(timerLabel)
       timerView.addSubview(minusTime)
       timerView.addSubview(plusTime)
       timerView.addSubview(timerTitle)
    
       investmentView.addSubview(investmentLabel)
       investmentView.addSubview(investmentTitle)
       investmentView.addSubview(investmentMinus)
       investmentView.addSubview(investmentPlus)
       
       sellButton.addSubview(sellTitle)
       buyButton.addSubview(buyTitle)
       
       conteinerView.isHidden = true
       conteinerView.addSubview(customKeyboardView)
   }
//MARK: - setupeActivityIndicator
    private func setupeActivityIndicator() {
        buyButton.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
         activityIndicator.centerYAnchor.constraint(equalTo: buyButton.centerYAnchor),
         activityIndicator.trailingAnchor.constraint(equalTo: buyButton.trailingAnchor, constant: -20),
        ])
    }
//MARK: - setupeButton
    private func setupeButton() {
        nextScreenButton.addTarget(self,
                             action: #selector(nextScreen),
                             for: .touchUpInside)
        minusTime.addTarget(self,
                            action: #selector(minusTimeButton),
                            for: .touchUpInside)
        plusTime.addTarget(self,
                           action: #selector(plusTimeButton),
                           for: .touchUpInside)
        investmentPlus.addTarget(self,
                                 action: #selector(investmentPlusButton),
                                 for: .touchUpInside)
        investmentMinus.addTarget(self,
                                  action: #selector(investmentMinusButton),
                                  for: .touchUpInside)
        sellButton.addTarget(self,
                             action: #selector(selectSellButton),
                             for: .touchUpInside)
        buyButton.addTarget(self,
                            action: #selector(selectBuyButton),
                            for: .touchUpInside)
    }
//MARK: - target button
    @objc func nextScreen() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            self.nextScreenButton.transform = CGAffineTransform(scaleX: 0.70, y: 0.70)
            }, completion: { finished in
                self.presenter?.currencyScreen()
            })
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.nextScreenButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
    }
    
    
    

    @objc func minusTimeButton(sender: UIButton) {
        sender.tag -= 1
        print("minusTime \(sender.tag)")
    }
    @objc func plusTimeButton(sender: UIButton) {
        sender.tag += 1
        print("plusTime \(sender.tag)")
    }
    @objc func investmentPlusButton() {
        let value = 1
        myFinances.investment = (myFinances.investment + Double(value))
        print("investmentPlus \(myFinances.investment)")
        presenter?.updateView?()
    }
    @objc func investmentMinusButton() {
        let value = 1
        myFinances.investment = (myFinances.investment - Double(value))
        print("investmentMinus \(myFinances.investment)")
        presenter?.updateView?()
//        if myFinances.investment >= 0 {
//            investmentMinus.isHidden = true
//        }
    }
 
    
    
//MARK: - selectSellButton
    @objc func selectSellButton() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            self.sellButton.transform = CGAffineTransform(scaleX: 0.70, y: 0.70)
            }, completion: { finished in
                print("sellButton")
            })
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.sellButton.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
    }
    @objc func selectBuyButton() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            self.buyButton.transform = CGAffineTransform(scaleX: 0.90, y: 0.90)
            }, completion: { finished in
                self.activityIndicator.startAnimating()
            })
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false, block: { (_) in
            self.presenter?.checkingPurchase()
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
                self.buyButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
            self.activityIndicator.stopAnimating()
        })
    }
//MARK: - setupeConstraint
   func setupeConstraint() {
       NSLayoutConstraint.activate([
        customKeyboardView.topAnchor.constraint(equalTo: self.topAnchor, constant: 200),
        customKeyboardView.widthAnchor.constraint(equalToConstant: 320),
        customKeyboardView.heightAnchor.constraint(equalToConstant: 250),
        customKeyboardView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
       ])
       
       NSLayoutConstraint.activate([
        stackView.topAnchor.constraint(equalTo: self.topAnchor),
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
       ])
       NSLayoutConstraint.activate([
        topView.heightAnchor.constraint(equalToConstant: 205),
       ])
//MARK: - nextScreenButton
       NSLayoutConstraint.activate([
        nextScreenButton.topAnchor.constraint(equalTo: topView.topAnchor, constant: 10),
        nextScreenButton.widthAnchor.constraint(equalToConstant: 315),
        nextScreenButton.heightAnchor.constraint(equalToConstant: 54),
        nextScreenButton.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
           
        buttonTitle.centerYAnchor.constraint(equalTo: nextScreenButton.centerYAnchor),
        buttonTitle.centerXAnchor.constraint(equalTo: nextScreenButton.centerXAnchor),
        
        buttonImage.widthAnchor.constraint(equalToConstant: 24),
        buttonImage.heightAnchor.constraint(equalToConstant: 24),
        buttonImage.centerYAnchor.constraint(equalTo: nextScreenButton.centerYAnchor),
        buttonImage.leftAnchor.constraint(equalTo: nextScreenButton.leftAnchor, constant: 280)
        ])
//MARK: - timerView
       NSLayoutConstraint.activate([
        timerView.topAnchor.constraint(equalTo: topView.topAnchor, constant: 74),
        timerView.widthAnchor.constraint(equalToConstant: 152),
        timerView.heightAnchor.constraint(equalToConstant: 54),
        timerView.leftAnchor.constraint(equalTo: topView.leftAnchor, constant:  42),

        timerLabel.topAnchor.constraint(equalTo: timerView.topAnchor, constant: 5),
        timerLabel.centerXAnchor.constraint(equalTo: timerView.centerXAnchor),

        timerTitle.topAnchor.constraint(equalTo: timerView.topAnchor, constant: 27),
        timerTitle.centerXAnchor.constraint(equalTo: timerView.centerXAnchor),
        timerTitle.widthAnchor.constraint(equalToConstant: 70),

        minusTime.topAnchor.constraint(equalTo: timerView.topAnchor, constant: 27),
        minusTime.widthAnchor.constraint(equalToConstant: 18),
        minusTime.heightAnchor.constraint(equalToConstant: 18),
        minusTime.leftAnchor.constraint(equalTo: timerView.leftAnchor, constant: 15),

        plusTime.topAnchor.constraint(equalTo: timerView.topAnchor, constant: 27),
        plusTime.widthAnchor.constraint(equalToConstant: 18),
        plusTime.heightAnchor.constraint(equalToConstant: 18),
        plusTime.rightAnchor.constraint(equalTo: timerView.rightAnchor, constant: -15)
        ])
//MARK: - investmentView
       NSLayoutConstraint.activate([
        investmentView.topAnchor.constraint(equalTo: topView.topAnchor, constant: 74),
        investmentView.widthAnchor.constraint(equalToConstant: 152),
        investmentView.heightAnchor.constraint(equalToConstant: 54),
        investmentView.leftAnchor.constraint(equalTo: topView.leftAnchor, constant:  205),

        investmentLabel.topAnchor.constraint(equalTo: investmentView.topAnchor, constant: 5),
        investmentLabel.centerXAnchor.constraint(equalTo: investmentView.centerXAnchor),

        investmentTitle.topAnchor.constraint(equalTo: investmentView.topAnchor, constant: 27),
        investmentTitle.centerXAnchor.constraint(equalTo: investmentView.centerXAnchor),
        investmentTitle.widthAnchor.constraint(equalToConstant: 70),

        investmentMinus.topAnchor.constraint(equalTo: investmentView.topAnchor, constant: 27),
        investmentMinus.widthAnchor.constraint(equalToConstant: 18),
        investmentMinus.heightAnchor.constraint(equalToConstant: 18),
        investmentMinus.leftAnchor.constraint(equalTo: investmentView.leftAnchor, constant: 15),

        investmentPlus.topAnchor.constraint(equalTo: investmentView.topAnchor, constant: 27),
        investmentPlus.widthAnchor.constraint(equalToConstant: 18),
        investmentPlus.heightAnchor.constraint(equalToConstant: 18),
        investmentPlus.rightAnchor.constraint(equalTo: investmentView.rightAnchor, constant: -15)
        ])
//MARK: - sellView
       NSLayoutConstraint.activate([
        sellButton.topAnchor.constraint(equalTo: topView.topAnchor, constant: 139),
        sellButton.widthAnchor.constraint(equalToConstant: 152),
        sellButton.heightAnchor.constraint(equalToConstant: 54),
        sellButton.leftAnchor.constraint(equalTo: topView.leftAnchor, constant:  42),

        sellTitle.topAnchor.constraint(equalTo: sellButton.topAnchor, constant: 8),
        sellTitle.leftAnchor.constraint(equalTo: sellButton.leftAnchor, constant:  20)
        ])
//MARK: - buyView
       NSLayoutConstraint.activate([
        buyButton.topAnchor.constraint(equalTo: topView.topAnchor, constant: 139),
        buyButton.widthAnchor.constraint(equalToConstant: 152),
        buyButton.heightAnchor.constraint(equalToConstant: 54),
        buyButton.leftAnchor.constraint(equalTo: topView.leftAnchor, constant:  205),

        buyTitle.topAnchor.constraint(equalTo: buyButton.topAnchor, constant: 8),
        buyTitle.leftAnchor.constraint(equalTo: buyButton.leftAnchor, constant:  20)
        ])
       NSLayoutConstraint.activate([
        conteinerView.heightAnchor.constraint(equalToConstant: 210),
        ])
   }
}
