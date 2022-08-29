//
//  PasswordVC.swift
//  Winfox
//
//  Created by Наиль Буркеев on 28.08.2022.
//

import UIKit

final class PasswordVC: UIViewController {
    var viewModel: PasswordViewModelInput?
    
    private let label = UILabel()
    private let inputBlockView = InputPasswordBlockView()
    private let updateButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.3435441554, green: 0.3309321404, blue: 0.8350966573, alpha: 1)
        self.navigationController?.navigationBar.tintColor = .white
        
        setLabel()
        createInputBlockView()
        setUpdateButton()
        
        viewModel?.passwordRequest(response: { [weak self] isSuccessed in
            if !isSuccessed {
                self?.showErrorAlert(message: "String")
            }
        })
        
        updateButtonTouched()
    }
    
    private func setLabel() {
        label.text = "Введите полученный код"
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
        
        inputBlockView.nextButton.addTarget(self, action: #selector(loginButtonTouched), for: .touchUpInside)
        
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
    
    private func setUpdateButton() {
        updateButton.setTitle("Получить новый код", for: .normal)
        updateButton.setTitleColor(.white, for: .normal)
        updateButton.addTarget(self, action: #selector(updateButtonTouched), for: .touchUpInside)
        self.view.addSubview(updateButton)
        
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            updateButton.topAnchor.constraint(equalTo: inputBlockView.bottomAnchor, constant: 8),
            updateButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
            updateButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    @objc
    private func loginButtonTouched() {
        viewModel?.login(verificationCode: inputBlockView.passwordTextField.text ?? "", completion: { [viewModel, showErrorAlert] isSuccessed in
            if isSuccessed {
                viewModel?.exitAuthorization()
            } else {
                showErrorAlert("Ошибка авторизации. Неправильно введен код из сообщения.")
            }
        })
    }
    
    @objc
    private func updateButtonTouched() {
        updateButton.isUserInteractionEnabled = false
        updateButton.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) { [weak self] in
            self?.updateButton.isUserInteractionEnabled = true
            self?.updateButton.alpha = 1.0
        }
    }
    
    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

}
