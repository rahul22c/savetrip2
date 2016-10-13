//
//  ViewController.swift
//  savetrip2
//
//  Created by Rahul Chandrawanshi on 9/23/16.
//  Copyright © 2016 Rahul Chandrawanshi. All rights reserved.
//

import UIKit
import CoreLocation

class MainviewController: UIViewController , CLLocationManagerDelegate , UIImagePickerControllerDelegate

{
    
    //MARK: Properties
    
    
    @IBOutlet weak var latitude: UILabel!
    

    @IBOutlet weak var longitude: UILabel!
    
    
    @IBOutlet weak var placeLable: UILabel!
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var addLocation: UIBarButtonItem!
    
    var tempcoordinate : Coordinates!
    
    // MARK: Values
    
    let locationManager = CLLocationManager()
    
    var locValue:CLLocationCoordinate2D!
    
    var place: String! = "unknown"


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
      
        // Create a location manager object
        self.addLocation.isEnabled = false
        
        // Set the delegate
        self.locationManager.delegate = self
        
        self.locationManager.requestWhenInUseAuthorization()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK :Locationdelegate
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
        
        
    {   self.addLocation.isEnabled = false
        self.activityIndicator.startAnimating()
        self.locValue = manager.location!.coordinate
        
        latitude.text = String(self.locValue.latitude)
        longitude.text = String(self.locValue.longitude)
        
        
        CLGeocoder().reverseGeocodeLocation(manager.location!) { (placemarks, ErrorType) -> Void in
            if(ErrorType != nil)
            {
                print("Error: " + ErrorType!.localizedDescription);
                return;
                
                
            }
            
            if((placemarks?.count)! > 0)
            {
                let pm = placemarks![0] ;
                print(pm.locality!);
                print(pm.postalCode!);
                print(pm.administrativeArea!);
                print(pm.country!);
                
                if pm.locality == nil{
                    self.place = "unknown"
                }
                else
                {
                    self.place = (pm.locality! + " " + pm.administrativeArea! + " " + pm.country!)
                }
                }
            self.placeLable.text = self.place
            
            self.tempcoordinate = Coordinates(longitude: self.locValue.longitude, latitude: self.locValue.latitude, place: self.place)
            
            self.locationManager.stopUpdatingLocation()
            
            self.activityIndicator.stopAnimating()
            self.addLocation.isEnabled = true
        }
        
    }
    
    //Mark: Actions
    
    @IBAction func acquireLocation(_ sender: AnyObject) {
        self.locationManager.startUpdatingLocation()
        print("Locationacquire")
    }
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "addLocation")
        {   let CoordinateData = segue.destination as! DetailsViewController
            CoordinateData.coordinates = self.tempcoordinate
            
        }

    
  
    }
}

