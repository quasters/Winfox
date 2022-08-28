//
//  Builder.swift
//  Winfox
//
//  Created by Наиль Буркеев on 28.08.2022.
//

import UIKit

protocol AuthorizationBuilderProtocol {
    func createLoginModule(completion: (() -> Void)?) -> UIViewController
    func createPasswordModule(completion: (() -> Void)?) -> UIViewController
}

final class AuthorizationBuilder: AuthorizationBuilderProtocol {
    public func createLoginModule(completion: (() -> Void)?) -> UIViewController {
        let vm = LoginVM(completion: completion)
        let vc = LoginVC()
        vc.viewModel = vm
        return vc
    }
    
    public func createPasswordModule(completion: (() -> Void)?) -> UIViewController {
        let vm = LoginVM(completion: completion)
        let vc = LoginVC()
        vc.viewModel = vm
        return vc
    }
}
