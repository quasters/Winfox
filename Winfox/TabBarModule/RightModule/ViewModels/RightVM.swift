//
//  RightVM.swift
//  Winfox
//
//  Created by Наиль Буркеев on 29.08.2022.
//

import Foundation

protocol RightViewModelInput {
    
}

final class RightVM: RightViewModelInput {
    private let complition: (() -> Void)?
    
    required init(complition: (() -> Void)?) {
        self.complition = complition
    }
}
