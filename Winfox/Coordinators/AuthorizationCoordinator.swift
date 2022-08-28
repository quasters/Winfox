//
//  AuthorizationCoordinator.swift
//  Winfox
//
//  Created by Наиль Буркеев on 28.08.2022.
//

import UIKit

final class AuthorizationCoordinator: AuthorizationCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var type: CoordinatorType { .authorization }
    
    private var builder: AuthorizationBuilderProtocol
        
    required init(_ navigationController: UINavigationController, builder: AuthorizationBuilderProtocol = AuthorizationBuilder()) {
        self.navigationController = navigationController
        self.builder = builder
    }
        
    public func start() {
        showLoginViewController()
    }
    
    public func showLoginViewController() {
        let vc = builder.createLoginModule(completion: { [weak self] in
            self?.showPasswordViewController()
        })
        navigationController.pushViewController(vc, animated: true)
    }
    
    public func showPasswordViewController() {
        let vc = builder.createPasswordModule { [weak self] in
            self?.finish()
        }
        navigationController.pushViewController(vc, animated: true)
    }
}
