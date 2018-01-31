//
//  FirebaseLoader.swift
//  Task Tracker
//
//  Created by Alex Tsonev on 31.01.18.
//  Copyright © 2018 Oleksii Tsoniev. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct FirebaseObserver: RemoteFetching {
    
    fileprivate var reference: DatabaseReference
    
    init(path: String) {
        reference = Database.database().reference(withPath: path)
    }
    
    func load(success: @escaping LoadingSuccess, failure: @escaping LoadingFailure) {
        reference.observeSingleEvent(of: .value) { (snapshot) in
            guard let data = snapshot.value as? Data else {
                return
            }
            success(data)
        }
    }
    
    func observe(completion: @escaping LoadingSuccess, failure: @escaping LoadingFailure) {
        reference.observe(.value) { (snapshot) in
            guard let data = snapshot.value as? Data else {
                return
            }
            completion(data)
        }
        
    }
    
    func removeAllObservers() {
        reference.removeAllObservers()
    }
}
