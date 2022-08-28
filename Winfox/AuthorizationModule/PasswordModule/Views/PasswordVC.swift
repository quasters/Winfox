//
//  PasswordVC.swift
//  Winfox
//
//  Created by Наиль Буркеев on 28.08.2022.
//

import UIKit

final class PasswordVC: UIViewController {
    var viewModel: PasswordViewModelInput?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .yellow
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

}
