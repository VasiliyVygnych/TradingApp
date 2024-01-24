//
//  PreloaderViewController.swift
//  TradingApp
//
//  Created by Vasiliy Vygnych on 20.10.2023.
//

import UIKit

class PreloaderViewController: UIViewController {
    
    var presenter: PreloaderPresenterProtocol?
    
//MARK: - backgroundImage
    private var backgroundImage: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "backgroundImage")
        return image
    }()
//MARK: - visualEffect
    private lazy var visualEffect: UIVisualEffectView = {
        let blur = UIBlurEffect(style: .systemChromeMaterialDark)
        let view = UIVisualEffectView(effect: blur)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
//MARK: - progressBar
    private let progressBar: UIProgressView = {
        let progressBar = UIProgressView()
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.progress = 0.1
        progressBar.tintColor = UIColor(named: "green")
        progressBar.trackTintColor = .gray
        progressBar.layer.cornerRadius = 12
        progressBar.clipsToBounds = true
        return progressBar
    }()
    private var progressLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 16,
                                 weight: .bold)
        label.textAlignment = .center
        label.text = "0%"
        return label
    }()
//MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupeView()
        setupeProgressBar()
        setupeConstraint()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupeProgressBar()
    }
    
    private func setupeView() {
        view.backgroundColor = UIColor(named: "theme")
        view.addSubview(visualEffect)
        view.addSubview(backgroundImage)
        view.addSubview(progressBar)
    }
//MARK: - setupeProgressBar
    private func setupeProgressBar() {
        progressBar.addSubview(progressLabel)
        for x in 0...100 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(x)*0.01 ) {
                self.progressBar.setProgress(Float(x)/100, animated: true)
                let uploader: Float = Float(x) / 100
                self.progressLabel.text = String(format: "%.0f%%", uploader * 100)
                if self.progressBar.progress == 1.0 {
                    UIView.animate(withDuration: 0.7) {
                        self.visualEffect.isHidden = false
                        self.setupeAlert()
                        self.progressBar.isHidden = true
                        self.view.backgroundColor = .black
                    }
                }
            }
        }
    }
//MARK: - setupeAlert
    private func setupeAlert() {
            guard let alert = self.presenter?.permissionForNotification() else { return }
            self.present(alert,
                         animated: true)
    }
//MARK: - setupeConstraint
    private func setupeConstraint() {
        NSLayoutConstraint.activate([
            progressBar.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            progressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressBar.heightAnchor.constraint(equalToConstant: 23),
            progressBar.widthAnchor.constraint(equalToConstant: 300),
            
            progressLabel.centerYAnchor.constraint(equalTo: progressBar.centerYAnchor),
            progressLabel.centerXAnchor.constraint(equalTo: progressBar.centerXAnchor),
            progressLabel.heightAnchor.constraint(equalToConstant: 19),
            progressLabel.widthAnchor.constraint(equalToConstant: 52)
        ])
        NSLayoutConstraint.activate([
            visualEffect.topAnchor.constraint(equalTo: view.topAnchor),
            visualEffect.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            visualEffect.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            visualEffect.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
extension PreloaderViewController: PreloaderViewProtocol {}
