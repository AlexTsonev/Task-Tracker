//
//  ApplicationCoordinator.swift
//  Task Tracker
//
//  Created by Oleksii Tsoniev on 11/7/17.
//  Copyright © 2017 Oleksii Tsoniev. All rights reserved.
//

import Foundation

fileprivate var isAuthorised = false

fileprivate enum LaunchInstructor {
    case main
    case auth
    
    static func configure(isAuthorised: Bool = isAuthorised) -> LaunchInstructor {
        switch isAuthorised {
        case true:
            return .main
        case false:
            return .auth
        }
    }
}

final class ApplicationCoordinator: BaseCoordinator {
    
    fileprivate let coordinatorFactory: CoordinatorFactory
    fileprivate let router: Router
    
    fileprivate var instructor: LaunchInstructor {
        return LaunchInstructor.configure()
    }
    
    init(router: Router, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }
    
    override func start(withOption: DeepLinkOption?) {
        if let option = withOption {
            switch option {
            case .login:
                runAuthFlow()
            case .main:
                runMainFlow()
            default:
                childCoordinators.forEach({ (coordinator) in
                    coordinator.start(withOption: option)
                })
            }
        } else {
            switch instructor {
            case .auth: runAuthFlow()
            case .main: runMainFlow()
            }
        }
    }
    
    fileprivate func runAuthFlow() {
        var coordinator = coordinatorFactory.makeAuthCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            isAuthorised = true
            self?.start()
            self?.removeDependency(coordinator)
        }
        addDependency(coordinator)
        coordinator.start()
    }
    
    fileprivate func runMainFlow() {
        let (coordinator, module) = coordinatorFactory.makeTabbarCoordinator()
        addDependency(coordinator)
        router.setRootModule(module, hideBar: true)
        coordinator.start()
    }
    
}

