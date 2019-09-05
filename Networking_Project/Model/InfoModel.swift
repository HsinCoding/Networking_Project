//
//  InfoModel.swift
//  Networking_Project
//
//  Created by ＵＳＥＲ on 2019/9/2.
//  Copyright © 2019 hsin_project. All rights reserved.
//

import UIKit

struct InfoModel: Codable {
    let result: Result
}

struct Result: Codable {
    let limit, offset, count: Int
    let sort: String
    let results: [Results]
}

struct Results:Codable {
    let parameterName2: String 
    let parameterUnit2: String
    let parameterName1: String // description
    let parameterUnit3: String
    let parameterName3, parameterValue1, locationName: String
    let endTime, startTime: String
    let _id: Int
}

