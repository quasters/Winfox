//
//  TabBarCoordinator.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 22.08.2022.
//

import UIKit

final class TabBarCoordinator: TabBarCoordinatorProtocol {
    weak var finishDelegate: CoordinatorFinishDelegate?
    
    public var tabBarController: UITabBarController
    
    public var navigationController: UINavigationController
    
    public var childCoordinators = [Coordinator]()
    
    public var type: CoordinatorType = .tab
    
    private var builder: TabBarBuilderProtocol
    
    required init(_ navigationController: UINavigationController, builder: TabBarBuilderProtocol = TabBarBuilder()) {
        self.navigationController = navigationController
        tabBarController = UITabBarController()
        tabBarController.tabBar.backgroundColor = .white
        tabBarController.tabBar.tintColor = .black
        
        self.builder = builder
    }
    
    public func start() {
        let pages: [TabBarPage] = [.main, .map]
        let controllers = pages.map({ getTabControllers($0) })
        prepareTabBarModule(withTabControllers: controllers)
    }
    
    public func selectPage(_ page: TabBarPage) {
        tabBarController.selectedIndex = page.pageOrderNumber()
    }
    
    public func currentPage() -> TabBarPage? {
        return TabBarPage.init(index: tabBarController.selectedIndex)
    }
    
    private func getTabControllers(_ page: TabBarPage) -> UINavigationController {
        let navController = UINavigationController()
        navController.setNavigationBarHidden(false, animated: false)
        navController.tabBarItem = UITabBarItem(title: page.titleValue(),
                                                image: page.imageValue(isSelected: false),
                                                selectedImage: page.imageValue(isSelected: true))
        
        switch page {
        case .main:
            let vc = builder.createLeftModule(completion: nil)
            navController.pushViewController(vc, animated: true)
        case .map:
            let vc = builder.createRightModule(completion: nil)
            navController.pushViewController(vc, animated: true)
        }
        return navController
    }
    
    private func prepareTabBarModule(withTabControllers tabControllers: [UIViewController]) {
        tabBarController.setViewControllers(tabControllers, animated: true)
        tabBarController.selectedIndex = TabBarPage.main.pageOrderNumber()
        tabBarController.tabBar.isTranslucent = false
        navigationController.pushViewController(tabBarController, animated: true)
    }
}
