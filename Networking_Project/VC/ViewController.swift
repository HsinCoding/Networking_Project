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

class ViewController: UIViewController, UITableViewDataSource, UICollectionViewDataSource, WeatherDetailsPresenterDelegate  {
   
    
    @IBOutlet weak var collectionView: UICollectionView!

    @IBOutlet weak var tableView: UITableView!
    var itemsArray:[Results] = []
    let weatherPresenter = WeatherDetailsPresenter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("testhi")
        weatherPresenter.delegate = self
        weatherPresenter.FetchWeatherDetail()
        registerCell() 
        
    }
    
    // MARK: - registerCell
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
        cell.locationName.text = item.locationName
        cell.parameterName1.text = item.parameterName1
        cell.parameterName2.text = item.parameterName2
        cell.parameterUnit2.text = item.parameterUnit2
        cell.parameterName3.text = item.parameterName3
        cell.parameterUnit3.text = item.parameterUnit3
        
        return cell
    }
    
    // MARK: - UICollectionViewDataSource
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RegionCell", for: indexPath)
        cell.backgroundColor = UIColor.blue
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

