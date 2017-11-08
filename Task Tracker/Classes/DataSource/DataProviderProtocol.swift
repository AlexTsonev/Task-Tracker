//
//  DataProviderProtocol.swift
//  Task Tracker
//
//  Created by Oleksii Tsoniev on 11/8/17.
//  Copyright © 2017 Oleksii Tsoniev. All rights reserved.
//

import Foundation

protocol DataProviderProtocol {
    
    func load()
    func reload()
    
    func addLoadingCompletion(loadingCompletion: @escaping DataSuccessCompletion)
    func addReloadingCompletion(reloadingCompletion: @escaping DataSuccessCompletion)
    func addFailureCompletion(failureCompletion: @escaping DataFailureCompletion)
    
}
