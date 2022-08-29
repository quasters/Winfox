//
//  TabBarBuilder.swift
//  Winfox
//
//  Created by Наиль Буркеев on 28.08.2022.
//

import UIKit

protocol TabBarBuilderProtocol {
    func createLeftModule(completion: (() -> Void)?) -> UIViewController
    func createRightModule(completion: (() -> Void)?) -> UIViewController
}

final class TabBarBuilder: TabBarBuilderProtocol {
    public func createLeftModule(completion: (() -> Void)?) -> UIViewController {
        let vc = LeftVC()
        let vm = LeftVM(complition: completion)
        vc.viewModel = vm
        return vc
    }
    
    public func createRightModule(completion: (() -> Void)?) -> UIViewController {
        let vc = RightVC()
        let vm = RightVM(complition: completion)
        vc.viewModel = vm
        return vc
    }
}
