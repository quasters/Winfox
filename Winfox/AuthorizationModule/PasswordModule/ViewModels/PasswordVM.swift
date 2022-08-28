//
//  PasswordVM.swift
//  Winfox
//
//  Created by Наиль Буркеев on 28.08.2022.
//

import Foundation

protocol PasswordViewModelInput {
    
}

final class PasswordVM: PasswordViewModelInput {
    let completion: (() -> Void)?
    
    required init(completion: (() -> Void)?) {
        self.completion = completion
    }
}
