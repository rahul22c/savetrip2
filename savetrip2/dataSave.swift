//
//  dataSave.swift
//  savetrip2
//
//  Created by Rahul Chandrawanshi on 9/29/16.
//  Copyright © 2016 Rahul Chandrawanshi. All rights reserved.
//

import Foundation
import UIKit

class dataSave: NSObject, NSCoding  {
    
    //MARk : Properties
    
    var nameByUser : String! = "nil"
    
    var tripName : String!
    
    var place :String! = "Unknown"
    
    var latitude: Double!
    
    var longitude: Double!
    
    var photo: UIImage?
    
    // MARK: Types
    
    
    struct PropertyKey {
        static let namekey = "name"
        static let tripnamekey = "tripname"
        static let placekey = "place"
        static let latitudekey = "latitude"
        static let longitudekey = "longitude"
        static let photokey = "tripimage"
    }
    
    
    // MARK: NSCoding
    
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nameByUser, forKey: PropertyKey.namekey)
        aCoder.encode(tripName, forKey: PropertyKey.tripnamekey)
        aCoder.encode(place, forKey: PropertyKey.placekey)
        aCoder.encode(latitude, forKey: PropertyKey.latitudekey)
        aCoder.encode(longitude, forKey: PropertyKey.longitudekey)
        aCoder.encode(photo, forKey: PropertyKey.photokey )
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let nameByuser = aDecoder.decodeObject(forKey: PropertyKey.namekey) as! String
        
        // Because photo is an optional property of Meal, use conditional cast.
        let tripname = aDecoder.decodeObject(forKey: PropertyKey.tripnamekey) as? String
        
        let places = aDecoder.decodeObject(forKey: PropertyKey.placekey) as? String
        
        let latitudes = aDecoder.decodeDouble(forKey: PropertyKey.latitudekey)
        
        let longitudes = aDecoder.decodeDouble(forKey: PropertyKey.longitudekey)
        
        let photos = aDecoder.decodeObject(forKey: PropertyKey.photokey) as? UIImage
        
        
        // Must call designated initializer.
        self.init(nameByUser : nameByuser , tripName : tripname! , place :places!, latitude: latitudes , longitude:longitudes , photo : photos! )
    }
    

    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("Savetrips")
    
    
    
    
    //MARK: Initialization
    init(nameByUser : String! , tripName : String! , place :String!, latitude: Double! , longitude: Double! , photo: UIImage)
    {
        self.nameByUser = nameByUser
        self.tripName = tripName
        self.place = place
        self.latitude = latitude
        self.longitude = longitude
        self.photo = photo
        
        
        
        
        
        
    }
    
    
    
    
    
    
    
}
