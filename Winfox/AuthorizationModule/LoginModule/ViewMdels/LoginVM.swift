//
//  AuthorizationVM.swift
//  Winfox
//
//  Created by Наиль Буркеев on 28.08.2022.
//

import Foundation

protocol LoginViewModelInput {
    
}

final class LoginVM: LoginViewModelInput {
    let completion: (() -> Void)?
    
    required init(completion: (() -> Void)?) {
        self.completion = completion
    }
    
    func request() {
        
    }
}
