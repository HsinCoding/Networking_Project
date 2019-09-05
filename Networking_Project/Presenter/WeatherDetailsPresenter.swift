//
//  FetchWeatherDetailsPresenter.swift
//  Networking_Project
//
//  Created by ＵＳＥＲ on 2019/9/4.
//  Copyright © 2019 hsin_project. All rights reserved.
//

import UIKit

protocol WeatherDetailsPresenterDelegate: class {
    func fetchSuccess(_presenter: WeatherDetailsPresenter, didfetch Items: [Results])
}


class WeatherDetailsPresenter: NSObject {

    var itemsArray: [Results] = []
    weak var delegate: WeatherDetailsPresenterDelegate?
    func FetchWeatherDetail()  {
       
        let url = "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=e6831708-02b4-4ef8-98fa-4b4ce53459d9"
        
        let realUrl = URL(string: url)
        URLSession.shared.dataTask(with: realUrl!) { (data, res, error) in
            if error != nil {
                
            } else {
                if let json = data {
                    do {
                        let result = try JSONDecoder().decode(InfoModel.self, from: json)
                        print("result:\(result.result.results.count)")
                        self.itemsArray.append(contentsOf:result.result.results)
                        self.delegate?.fetchSuccess(_presenter: self, didfetch: self.itemsArray)
                        
                    } catch {
                        print("error:\(error)")
                    }
                }
            }
            }.resume()
    }
    
   

    
}
