//
//  ViewController.swift
//  Task Tracker
//
//  Created by Oleksii Tsoniev on 11/7/17.
//  Copyright © 2017 Oleksii Tsoniev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let request = Request(path: "/forecast/4022405ad172d623e5937f15b392f953/37.8267,-122.4233", scheme: "https", host: "api.darksky.net")

    var dataSource: DataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let loader: LoaderProtocol = Loader(withRequest: request, modelClass: WeatherCollection.self)
        dataSource = DataSource(loader: loader)
        dataSource.addLoadingCompletion { (model) in
            model.collection()?.forEach({ (item) in
                print("success \(item)")
            })
        }
        dataSource.addFailureCompletion { (error) in
            print("error: \(error)")
        }
        dataSource.load()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

