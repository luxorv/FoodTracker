//
//  Meal.swift
//  FoodTracker
//
//  Created by Victor Ml Polanco on 4/4/16.
//  Copyright © 2016 Victor Manuel Polanco. All rights reserved.
//

import UIKit

class Meal: NSObject, NSCoding {
    
    // MARK: Properties
    
    var name: String
    var photo: UIImage!
    var rating: Int
    
    struct PropertyKey {
        static let nameKey = "name"
        static let photoKey = "photo"
        static let ratingKey = "rating"
    }
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first
    static let ArchiveURL = DocumentsDirectory?.URLByAppendingPathComponent("meals")
    
    // MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int) {
        // Initialize store properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        
        super.init()
        
        // Initialization should fail if there's no name or if the rating is negative.
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        
        // Because photo is an optional property of Meal, use conditional cast.
        let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
        let rating = aDecoder.decodeIntegerForKey(PropertyKey.ratingKey)
        
        // Must call designed initializer.
        self.init(name: name, photo: photo, rating: rating)
    }
    
    // MARK: Functions
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(photo, forKey: PropertyKey.photoKey)
        aCoder.encodeInteger(rating, forKey: PropertyKey.ratingKey)
    }
}
