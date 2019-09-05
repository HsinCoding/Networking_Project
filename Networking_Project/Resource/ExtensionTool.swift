//
//  ExtensionTool.swift
//  Networking_Project
//
//  Created by ＵＳＥＲ on 2019/9/5.
//  Copyright © 2019 hsin_project. All rights reserved.
//

import UIKit


extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var addedDict = [Element: Bool]()
        return filter {
            addedDict.updateValue(true, forKey: $0) == nil
        }
    }
    mutating func removeDuplicates() {
        self = self.removingDuplicates()
    }
}

