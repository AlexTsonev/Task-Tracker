//
//  LoginView.swift
//  Task Tracker
//
//  Created by Oleksii Tsoniev on 11/7/17.
//  Copyright © 2017 Oleksii Tsoniev. All rights reserved.
//

import Foundation

protocol LoginView: BaseView {
    var loginCompletion: () -> Void? { get set }
    var signUpButtonTapped: () -> Void? { get set }
}
