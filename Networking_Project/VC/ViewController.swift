//
//  ViewController.swift
//  Networking_Project
//
//  Created by ＵＳＥＲ on 2019/9/2.
//  Copyright © 2019 hsin_project. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource, WeatherDetailsPresenterDelegate  {
   

    @IBOutlet weak var tableView: UITableView!
    var itemsArray:[Results] = []
    let weatherPresenter = WeatherDetailsPresenter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("test")
        weatherPresenter.delegate = self
        weatherPresenter.FetchWeatherDetail()
        registerCell() 
        
    }
    
    // MARK: - UITableViewDataSource
    func registerCell() {
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }
    
    
   // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        let item = itemsArray[indexPath.row]
        cell.location.text = item.locationName
        
        return cell
    }
    

    // MARK: - WeatherDetailsPresenterDelegate
    
    func fetchSuccess(_presenter: WeatherDetailsPresenter, didfetch Items: [Results]) {
        self.itemsArray = Items
        DispatchQueue.main.async {
             self.tableView.reloadData()
        }
    }

    
}

