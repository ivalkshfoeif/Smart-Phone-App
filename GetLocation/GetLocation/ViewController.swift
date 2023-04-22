//
//  ViewController.swift
//  GetLocation
//
//  Created by muxing lin on 4/21/23.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var lblLatitude: UILabel!
    
    @IBOutlet weak var lblLongtitude: UILabel!
    
    
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        
        // Do any additional setup after loading the view.
    }
    
    

    @IBAction func getLatAndLongt(_ sender: Any) {
        
        locationManager.requestLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        
        let lat = location.coordinate.latitude
        let longt = location.coordinate.longitude
        
        lblLatitude.text = "Lat: \(lat)"
        lblLongtitude.text = "Longt: \(longt)"
        getAddressFromLocation(location: location)

    }
    
    
    func getAddressFromLocation(location: CLLocation){
        let geoEncoder = CLGeocoder()
        geoEncoder.reverseGeocodeLocation(location){ placemarks, error in
            if error != nil {
                print(error)
                return
            }
            
            var address = ""
            guard let place = placemarks?.first else {return}
            
            if place.name != nil {
                address += place.name! + ","
            }
            if place.locality != nil {
                address += place.locality! + ","
            }
            if place.subLocality != nil {
                address += place.subLocality! + ","
            }
            if place.country != nil {
                address += place.country! + ","
            }
            if place.postalCode != nil {
                address += place.postalCode! + ","
            }
            
            print(address)
        }
    }
    
    
}

