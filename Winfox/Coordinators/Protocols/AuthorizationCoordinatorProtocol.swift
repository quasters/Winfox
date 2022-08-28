//
//  AuthorizationCoordinatorProtocol.swift
//  Winfox
//
//  Created by Наиль Буркеев on 28.08.2022.
//

import Foundation

protocol AuthorizationCoordinatorProtocol: Coordinator {
    func showLoginViewController()
    func showPasswordViewController()
}
