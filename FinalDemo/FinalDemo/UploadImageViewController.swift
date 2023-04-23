//
//  UploadImageViewController.swift
//  FinalDemo
//
//  Created by muxing lin on 4/22/23.
//

import UIKit
import CoreLocation

class UploadImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    var uploadProtocol: UploadImageProtocol?
    
    let locationManager = CLLocationManager()
    
    //var tabBarController = UITabBarController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        
        locationManager.requestLocation()

        // Do any additional setup after loading the view.
    }
    @IBAction func uploadAction(_ sender: Any) {
        
        guard let img = imgView.image else {return}
        guard let location = lblLocation.text else {return}
        guard let title = txtTitle.text else {return}
        
        uploadProtocol?.uploadedImageDelegate(img: img, locationImg: location, titleImg: title)
        
        //self.tabBarController.selectedIndex = 0
        
        self.tabBarController?.selectedIndex = 0
        
        
    }
    
    
    @IBAction func takePictureAction(_ sender: Any) {
        
        let actionSheet = UIAlertController(title: "Take a picture", message: "Something", preferredStyle: .alert)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default){ action in
            if (UIImagePickerController.isSourceTypeAvailable(.camera)){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.camera
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true)
                print("User selected photo library")
            }
            print("User selected camera")
            
        }
        
        let phtotLibraryAction = UIAlertAction(title: "Photo Library", style: .default){ action in
            if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
                imagePicker.allowsEditing = false
                self.present(imagePicker, animated: true)
                print("User selected photo library")
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default){ action in
            print("User selected cancel")
            
        }
        
        actionSheet.addAction(cameraAction)
        actionSheet.addAction(phtotLibraryAction)
        actionSheet.addAction(cancelAction)
        
        self.present(actionSheet, animated: true)
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imgView.image = image
        }
        
        picker.dismiss(animated: true)
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
            self.lblLocation.text = address
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        
        let lat = location.coordinate.latitude
        let longt = location.coordinate.longitude
        
        getAddressFromLocation(location: location)

    }
    
}

