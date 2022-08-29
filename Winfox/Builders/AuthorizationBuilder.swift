//
//  Builder.swift
//  Winfox
//
//  Created by Наиль Буркеев on 28.08.2022.
//

import UIKit

protocol AuthorizationBuilderProtocol {
    func createLoginModule(completion: ((String) -> Void)?) -> UIViewController
    func createPasswordModule(login: String, completion: (() -> Void)?) -> UIViewController
}

final class AuthorizationBuilder: AuthorizationBuilderProtocol {
    public func createLoginModule(completion: ((String) -> Void)?) -> UIViewController {
        let vm = LoginVM(completion: completion)
        let vc = LoginVC()
        vc.viewModel = vm
        return vc
    }
    
    public func createPasswordModule(login: String, completion: (() -> Void)?) -> UIViewController {
        let vm = PasswordVM(login: login, completion: completion)
        let vc = PasswordVC()
        vc.viewModel = vm
        return vc
    }
}
