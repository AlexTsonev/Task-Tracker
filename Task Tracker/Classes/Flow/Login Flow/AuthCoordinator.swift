//
//  LoginCoordinator.swift
//  Task Tracker
//
//  Created by Oleksii Tsoniev on 11/7/17.
//  Copyright © 2017 Oleksii Tsoniev. All rights reserved.
//

import Foundation

final class AuthCoordinator: BaseCoordinator, AuthCoordinatorOutput {
    
    var finishFlow: RouterCompletion?
    
    fileprivate let router: RouterProtocol
    fileprivate let factory: AuthModulesFactory
    
    //MARK: Public
    
    init(router: RouterProtocol, factory: AuthModulesFactory) {
        self.factory = factory
        self.router = router
    }
    
    override func start() {
        showLogin()
    }
    
    //MARK: Private
    
    fileprivate func showLogin() {
        let loginOutput = factory.makeLoginOutput()
        loginOutput.loginCompletion = { [weak self] in
            self?.finishFlow?()
        }
        loginOutput.signUpButtonTapped = { [weak self] in
            self?.showSignUp()
        }
        router.setRootModule(loginOutput)
    }
    
    fileprivate func showSignUp() {
        let signUpView = factory.makeSignUpHandler()
        signUpView.signUpCompletion = { [weak self] in
            self?.finishFlow?()
        }
        router.push(signUpView)
    }
       
    
}

