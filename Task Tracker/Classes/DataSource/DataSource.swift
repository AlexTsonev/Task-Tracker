//
//  DataSource.swift
//  Task Tracker
//
//  Created by Oleksii Tsoniev on 11/8/17.
//  Copyright © 2017 Oleksii Tsoniev. All rights reserved.
//

import Foundation

class DataSource: DataProviderProtocol {
    
    //MARK: - Private
    
    fileprivate let loader: LoaderProtocol
    fileprivate let dataQueue: DispatchQueue
    fileprivate var loadingCompletions: [DataSuccessCompletion] = []
    fileprivate var reloadingCompletions: [DataSuccessCompletion] = []
    fileprivate var failureCompletions: [DataFailureCompletion] = []
    fileprivate var modelsArray: [ModelType]?
    fileprivate var models: [ModelType]? {
        get {
            var localModels:[ModelType]? = nil
            dataQueue.sync {
                localModels = modelsArray
            }
            return localModels
        } 
        set {
            dataQueue.async {
                self.modelsArray = newValue
            }
        }
    }
    
    //MARK: - Public
    
    var callbackQueue: DispatchQueue = DispatchQueue.main
    
    init(loader: LoaderProtocol) {
        self.loader = loader
        dataQueue = DispatchQueue(label: "DataSource dataQueue",
                                  qos: .background,
                                  attributes: .concurrent,
                                  autoreleaseFrequency: .never,
                                  target: nil)
    }
    
    func load() {
        loader.loadItems(withCompletions: { (result) in
            self.callbackQueue.async {
                self.loadingCompletions.forEach({ (completion) in
                    completion(result)
                })
            }
        }) { (error) in
            self.failureCompletions.forEach({ (completion) in
                completion(error)
            })
        }
    }
    
    func reload() {
        loader.loadItems(withCompletions: { (result) in
            self.callbackQueue.async {
                self.reloadingCompletions.forEach({ (completion) in
                    completion(result)
                })
            }
        }) { (error) in
            self.failureCompletions.forEach({ (completion) in
                completion(error)
            })
        }
    }
    
    func addLoadingCompletion(loadingCompletion: @escaping DataSuccessCompletion) {
        loadingCompletions.append(loadingCompletion)
    }
    
    func addReloadingCompletion(reloadingCompletion: @escaping DataSuccessCompletion) {
        reloadingCompletions.append(reloadingCompletion)
    }
    
    func addFailureCompletion(failureCompletion: @escaping DataFailureCompletion) {
        failureCompletions.append(failureCompletion)
    }
    
    
}
