//
//  DataService.swift
//  FoodTracker2
//
//  Created by dinhphu98 on 4/9/18.
//  Copyright © 2018 dinhphu98. All rights reserved.
//

import UIKit
class DataSerVice {
    static let shared : DataSerVice = DataSerVice()
    private var _meals : [Meal]?
    
    var meals : [Meal] {
        set {
            _meals = newValue
        }
        get {
            if _meals == nil {
                updateData()
            }
            return _meals ?? []
        }
    }
    func updateData() {
        _meals = []
        let meal1 = Meal(name: "Hot dog", photo: #imageLiteral(resourceName: "meal1"), rating: 5)
        let meal2 = Meal(name: "Spaghetti", photo: #imageLiteral(resourceName: "meal2"), rating: 4)
        let meal3 = Meal(name: "Pizza", photo: #imageLiteral(resourceName: "meal3"), rating: 3)
        _meals = [meal1!,meal2!,meal3!]
    }
}
