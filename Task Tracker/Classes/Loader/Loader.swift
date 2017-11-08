//
//  Loader.swift
//  Task Tracker
//
//  Created by Oleksii Tsoniev on 11/8/17.
//  Copyright © 2017 Oleksii Tsoniev. All rights reserved.
//

import Foundation

class Loader: LoaderProtocol {

    //MARK: - Private
    
    let modelClass: ModelType.Type
    let request: Request
    
    var successCompletion: DataSuccessCompletion?
    var failureCompletion: DataFailureCompletion?
    
    let session = {
        return URLSession(configuration: .default)
    } ()

    //MARK: - Public
    
    init(withRequest request: Request, modelClass: ModelType.Type) {
        self.request = request
        self.modelClass = modelClass
    }
    
    func loadItems(withCompletions success: @escaping (ModelType) -> (), failure: @escaping (Error) -> ()) {
        successCompletion = success
        failureCompletion = failure
        
        DispatchQueue.global().async {
            let task = self.session.dataTask(with: self.request.build(), completionHandler: { (data, response, error) in
                guard data != nil else {
                    self.failureCompletion?(error!)
                    return
                }
                let dict = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                if (error == nil && dict != nil) {
                    let model = self.modelClass.init(dictionary: dict as! [String:Any?])
                    self.successCompletion?(model)
                } else {
                    self.failureCompletion?(error!)
                }
                
            })
            task.resume()
        }
    }
    
}
