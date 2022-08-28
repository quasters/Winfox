//
//  ViewController.swift
//  Winfox
//
//  Created by Наиль Буркеев on 28.08.2022.
//

import UIKit

final class LoginVC: UIViewController {
    var viewModel: LoginViewModelInput?
    
    private let label = UILabel()
    private let inputBlockView = InputBlockView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.3435441554, green: 0.3309321404, blue: 0.8350966573, alpha: 1)
        
        setLabel()
        createInputBlockView()
    }
    
    private func setLabel() {
        label.text = "Введите номер телефона"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        self.view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
            label.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20)
        ])
    }
    
    private func createInputBlockView() {
        inputBlockView.configure()
        
        inputBlockView.nextButton.addTarget(self, action: #selector(nextButtonTouched), for: .touchUpInside)
        
        self.view.addSubview(inputBlockView)
        
        inputBlockView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            inputBlockView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
            inputBlockView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -20),
            inputBlockView.heightAnchor.constraint(equalToConstant: 120),
            inputBlockView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            label.bottomAnchor.constraint(equalTo: inputBlockView.topAnchor, constant: -6)
        ])
    }
    
    @objc
    private func nextButtonTouched() {
        print("touched")
    }
}

