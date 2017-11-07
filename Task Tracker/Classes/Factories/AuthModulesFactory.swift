//
//  AuthModulesFactory.swift
//  Task Tracker
//
//  Created by Oleksii Tsoniev on 11/7/17.
//  Copyright © 2017 Oleksii Tsoniev. All rights reserved.
//

import Foundation

protocol AuthModulesFactory {
    func makeLoginOutput() -> LoginView
    func makeSignUpHandler() -> SignUpView
}
