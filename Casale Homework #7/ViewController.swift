//
//  ViewController.swift
//  Casale Homework #7
//
//  Created by Amy Casale on 3/28/20.
//  Copyright © 2020 Amy Casale. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    

    
    let locationManager: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!
    
    let colosseumLatitude: CLLocationDegrees = 41.890375
    let colosseumLongitude: CLLocationDegrees = 12.492092
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let newLocation: CLLocation=locations[0]
        NSLog("Something is happening")
        
        if newLocation.horizontalAccuracy >= 0 {
            
            let colosseum:CLLocation = CLLocation(latitude: colosseumLatitude,longitude: colosseumLongitude)
            let delta:CLLocationDistance = colosseum.distance(from: newLocation)
            let miles: Double = (delta * 0.00621371) + 0.5   //meters to miles
            if miles < 3 {
                locationManager.stopUpdatingLocation()
                distanceLabel.text = "Arriving to the Colosseum in three miles."
            } else {
                let commaDelimited: NumberFormatter = NumberFormatter()
                commaDelimited.numberStyle = NumberFormatter.Style.decimal
                distanceLabel.text=commaDelimited.string(from:NSNumber(value: miles))!+" miles to Colosseum"
                
            }
            

            
        }
        
    }
    
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.distanceFilter = 1609;
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        startLocation = nil
    }


}

