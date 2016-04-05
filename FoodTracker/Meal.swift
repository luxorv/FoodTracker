//
//  Meal.swift
//  FoodTracker
//
//  Created by Victor Ml Polanco on 4/4/16.
//  Copyright © 2016 Victor Manuel Polanco. All rights reserved.
//

import UIKit

class Meal {
    
    // MARK: Properties
    
    var name: String
    var photo: UIImage!
    var rating: Int
    
    // MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int) {
        // Initialize store properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        
        // Initialization should fail if there's no name or if the rating is negative.
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
}
