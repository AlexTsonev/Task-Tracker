//
//  Request.swift
//  Task Tracker
//
//  Created by Oleksii Tsoniev on 11/8/17.
//  Copyright © 2017 Oleksii Tsoniev. All rights reserved.
//

import Foundation

class Request: RemoteRequesting {    
    
    //MARK: - Private
    
    fileprivate let path: String
    fileprivate let scheme: String
    fileprivate let host: String
    fileprivate var parameters: [String:String] = [:]
    
    var url: URL?
    
    func buildQueryItems() -> [URLQueryItem]? {
        let result = (self.parameters.map({ (key,value) -> URLQueryItem in
            return URLQueryItem(name: key, value: value)
        }))
        return result.isEmpty ? nil : result
    }
    
    func buildUrlComponents(with items: [URLQueryItem]?) -> URLComponents {
        var urlComp = URLComponents()
        urlComp.queryItems = items
        urlComp.path = path
        urlComp.host = host
        urlComp.scheme = scheme
        return urlComp
    }
    
    //MARK: - Public
    
    init(path: String, scheme: String, host: String) {
        self.path = path
        self.scheme = scheme
        self.host = host
    }
    
    func build() -> URLRequest {
        let queryItems = buildQueryItems()
        let components = buildUrlComponents(with: queryItems)
        let resultUrl = components.url!
        let request = URLRequest(url: resultUrl)
        url = request.url
        return request
    }
    
    func configurate(withParameters params: [String : String]) {
        parameters = params
    }
    
}
