//
//  AuthorizationVM.swift
//  Winfox
//
//  Created by Наиль Буркеев on 28.08.2022.
//

import Foundation

protocol LoginViewModelInput {
    func nextStep(phoneNumber: String)
}

final class LoginVM: LoginViewModelInput {
    let completion: ((String) -> Void)?
    
    required init(completion: ((String) -> Void)?) {
        self.completion = completion
    }

    func nextStep(phoneNumber: String) {
        completion?(phoneNumber)
    }
}
