//
//  InputPasswordBlockView.swift
//  Winfox
//
//  Created by Наиль Буркеев on 28.08.2022.
//

import UIKit

class InputPasswordBlockView: UIView {
    let passwordTextField = UITextField()
    let nextButton = UIButton()
    
    func configure() {
        self.isUserInteractionEnabled = true
        setTextField()
        setButton()
    }
    
    private func setTextField() {
        
        passwordTextField.delegate = self
        passwordTextField.font = UIFont.systemFont(ofSize: 20)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        self.addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextField.leftAnchor.constraint(equalTo: self.leftAnchor),
            passwordTextField.rightAnchor.constraint(equalTo: self.rightAnchor),
            passwordTextField.topAnchor.constraint(equalTo: self.topAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.45)
        ])
    }
    
    private func setButton() {
        nextButton.backgroundColor = .white
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.setTitle("Войти", for: .normal)
        nextButton.isEnabled = false
        nextButton.alpha = 0.5
        self.addSubview(nextButton)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.leftAnchor.constraint(equalTo: self.leftAnchor),
            nextButton.rightAnchor.constraint(equalTo: self.rightAnchor),
            nextButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            nextButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.45)
        ])
    }
    
    @objc
    private func textFieldDidChange(_ textField: UITextField) {
        if textField.text?.count == 6 {
            nextButton.isEnabled = true
            nextButton.alpha = 1.0
        } else {
            nextButton.isEnabled = false
            nextButton.alpha = 0.5
        }
    }
}

extension InputPasswordBlockView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentCharacterCount = textField.text?.count ?? 0
        if range.length + range.location > currentCharacterCount {
            return false
        }
        let newLength = currentCharacterCount + string.count - range.length
        return newLength <= 6
    }
}
