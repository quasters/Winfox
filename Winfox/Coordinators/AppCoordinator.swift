//
//  AppCoordinator.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 22.08.2022.
//

import Foundation
import UIKit

class AppCoordinator: AppCoordinatorProtocol {
    
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    public var navigationController: UINavigationController
    
    public var childCoordinators = [Coordinator]()
    
    public var type: CoordinatorType = .app
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.setNavigationBarHidden(true, animated: false)
    }
    
    public func start() {
        showAuthorizationFlow()
    }
    
    public func showAuthorizationFlow() {
        let authorizationCoordinator: AuthorizationCoordinatorProtocol = AuthorizationCoordinator(navigationController)
        authorizationCoordinator.finishDelegate = self
        authorizationCoordinator.start()
        childCoordinators.append(authorizationCoordinator)
    }
    
    public func showTabFlow() {
        let tabBarCoordinator: TabBarCoordinatorProtocol = TabBarCoordinator(navigationController)
        tabBarCoordinator.finishDelegate = self
        tabBarCoordinator.start()
        childCoordinators.append(tabBarCoordinator)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    public func coordinatorDidFinish(childCoordinator: Coordinator) {
        
        childCoordinators = childCoordinators.filter({ $0.type != childCoordinator.type })
        
        switch childCoordinator.type  {
        case .authorization:
            navigationController.viewControllers.removeAll()
            showTabFlow()
        case .tab:
            navigationController.viewControllers.removeAll()
        default: break
        }
    }
}
