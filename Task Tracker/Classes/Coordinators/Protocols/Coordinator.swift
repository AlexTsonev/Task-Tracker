//
//  Coordinator.swift
//  Task Tracker
//
//  Created by Oleksii Tsoniev on 11/7/17.
//  Copyright © 2017 Oleksii Tsoniev. All rights reserved.
//

import Foundation

protocol Coordinator: class {
    func start()
    func start(withOption: DeepLinkOption?)
}
