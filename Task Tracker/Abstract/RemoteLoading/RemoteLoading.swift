//
//  Loading.swift
//  Task Tracker
//
//  Created by Alex Tsonev on 31.01.18.
//  Copyright © 2018 Oleksii Tsoniev. All rights reserved.
//

import Foundation

typealias LoadingSuccess = (Data) -> ()
typealias LoadingFailure = (Error) -> ()

protocol RemoteLoading {
    func load(success: @escaping LoadingSuccess, failure: @escaping LoadingFailure)
}

protocol RemoteObserving {
    func observe(completion: @escaping LoadingSuccess, failure: @escaping LoadingFailure)
    func removeAllObservers()
}

typealias RemoteFetching = RemoteLoading & RemoteObserving
