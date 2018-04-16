//
//  Meal.swift
//  FoodTracker2
//
//  Created by dinhphu98 on 4/9/18.
//  Copyright © 2018 dinhphu98. All rights reserved.
//

import UIKit

class Meal {
    var name : String?
    var photo : UIImage?
    var rating : Int?
    
    init?(name : String , photo : UIImage , rating : Int) {
        
        if name.isEmpty || (rating < 0 && rating > 5) {
            return nil
        }
        
        self.name = name
        self.photo = photo
        self.rating = rating
    }
    
}
