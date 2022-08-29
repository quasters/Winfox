//
//  LeftVM.swift
//  Winfox
//
//  Created by Наиль Буркеев on 29.08.2022.
//

import Foundation

protocol LeftViewModelInput {
    
}

final class LeftVM: LeftViewModelInput {
    private let complition: (() -> Void)?
    
    required init(complition: (() -> Void)?) {
        self.complition = complition
    }
}
