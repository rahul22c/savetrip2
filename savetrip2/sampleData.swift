//
//  sampleData.swift
//  savetrip2
//
//  Created by Rahul Chandrawanshi on 10/4/16.
//  Copyright © 2016 Rahul Chandrawanshi. All rights reserved.
//

import UIKit

class sampleData{
    
    var name: String!
    var tripname : String!
    var photo : UIImage?
    var place : String?
    
    init(name:String!, tripname: String! ,photo: UIImage?, place: String!)
    { self.name = name
        self.tripname = tripname
        self.photo = photo
        self.place = place
        
    }
}
