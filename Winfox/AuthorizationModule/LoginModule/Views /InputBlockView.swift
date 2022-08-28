//
//  InputBlockView.swift
//  Winfox
//
//  Created by Наиль Буркеев on 28.08.2022.
//

import UIKit
import FlagPhoneNumber

final class InputBlockView: UIView {
    private let mobileInputTextField = FPNTextField()
    let nextButton = UIButton()
    
    func configure() {
        self.isUserInteractionEnabled = true
        setTextField()
        setButton()
    }
    
    private func setTextField() {
        
        mobileInputTextField.delegate = self
        mobileInputTextField.setCountries(including: [.RU])
        
        self.addSubview(mobileInputTextField)
        mobileInputTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mobileInputTextField.leftAnchor.constraint(equalTo: self.leftAnchor),
            mobileInputTextField.rightAnchor.constraint(equalTo: self.rightAnchor),
            mobileInputTextField.topAnchor.constraint(equalTo: self.topAnchor),
            mobileInputTextField.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.45)
        ])
    }
    
    private func setButton() {
        nextButton.backgroundColor = .white
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.setTitle("Получить код", for: .normal)
        self.addSubview(nextButton)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.leftAnchor.constraint(equalTo: self.leftAnchor),
            nextButton.rightAnchor.constraint(equalTo: self.rightAnchor),
            nextButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            nextButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.45)
        ])
    }
}


// MARK: - FPNTextFieldDelegate
extension InputBlockView: FPNTextFieldDelegate {
    
    func fpnDidSelectCountry(name: String, dialCode: String, code: String) {
        return
    }
    
    func fpnDidValidatePhoneNumber(textField: FPNTextField, isValid: Bool) {
        if isValid {
            nextButton.alpha = 1.0
            nextButton.isEnabled = true
        } else {
            nextButton.alpha = 0.5
            nextButton.isEnabled = false
        }
    }
    
    func fpnDisplayCountryList() {
        return
    }
}

