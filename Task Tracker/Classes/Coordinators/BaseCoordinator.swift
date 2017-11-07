//
//  BaseCoordinator.swift
//  Task Tracker
//
//  Created by Oleksii Tsoniev on 11/7/17.
//  Copyright © 2017 Oleksii Tsoniev. All rights reserved.
//

import Foundation

class BaseCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    func start() {
        start(withOption: nil)
    }
    
    func start(withOption: DeepLinkOption?) {
        
    }
    
    func addDependency(_ coordinator: Coordinator) {
        for element in childCoordinators {
            if element === coordinator {
                return
            }
        }
        childCoordinators.append(coordinator)
    }
    
    func removeDependency(_ coordinator: Coordinator?) {
        guard childCoordinators.isEmpty == false,
            let coordinator = coordinator else {
                return
        }
        
        for (index, element) in childCoordinators.enumerated() {
            if element === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
}
