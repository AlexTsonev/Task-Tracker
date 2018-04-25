//
//  Loading.swift
//  Task Tracker
//
//  Created by Alex Tsonev on 31.01.18.
//  Copyright © 2018 Oleksii Tsoniev. All rights reserved.
//

import Foundation



protocol RemoteFetching {
    
    typealias RemoteLoadingSuccess = ([Entity]) -> ()
    typealias RemoteLoadingFailure = (Error) -> ()
    
    func load(success: @escaping RemoteLoadingSuccess, failure: @escaping RemoteLoadingFailure)
    func observe(success: @escaping RemoteLoadingSuccess, failure: @escaping RemoteLoadingFailure)

    func removeAllObservers()
}

