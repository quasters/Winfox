//
//  TabBarPage.swift
//  QuantronSystems
//
//  Created by Наиль Буркеев on 22.08.2022.
//

import Foundation
import UIKit

enum TabBarPage {
    case main
    case map
    
    init?(index: Int) {
        switch index {
        case 0: self = .main
        case 1: self = .map
        default: return nil
        }
    }
    
    func pageOrderNumber() -> Int {
        switch self {
        case .main:
            return 0
        case .map:
            return 1
        }
    }
    
    func titleValue() -> String {
        switch self {
        case .main:
            return "Home"
        case .map:
            return "Map"
        }
    }
    
    func imageValue(isSelected: Bool) -> UIImage? {
        switch self {
        case .main:
            return UIImage(systemName: isSelected ? "house.circle.fill" : "house.circle")
        case .map:
            return UIImage(systemName: isSelected ? "map.circle.fill" : "map.circle")
        }
    }
}
