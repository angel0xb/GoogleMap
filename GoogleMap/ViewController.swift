//
//  ViewController.swift
//  GoogleMap
//
//  Created by MCS Devices on 1/3/18.
//  Copyright © 2018 angel. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import GooglePlacePicker

class ViewController: UIViewController {
    
    var locationManager: CLLocationManager!
    var placePicker: GMSPlacePicker!
    var latitude: Double!
    var longitude: Double!
    var mapView: GMSMapView!
    @IBOutlet weak var mapViewContainer: UIView!
    
//    @IBAction func showPlacePicker(_ sender: Any) {
//
//    }
    @IBAction func pickPlace(_ sender: Any) {
        let config = GMSPlacePickerConfig(viewport: nil)
        let placePicker = GMSPlacePickerViewController(config: config)
        
        placePicker.delegate = self
        present(placePicker, animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.startUpdatingLocation()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.mapView = GMSMapView(frame: self.mapViewContainer.frame)
        self.mapView.animate(toZoom: 18.0)
        self.view.addSubview(mapView)
    }

}

extension ViewController:CLLocationManagerDelegate{
        

    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]){
        // 1
        let location:CLLocation = locations.last!
        self.latitude = location.coordinate.latitude
        self.longitude = location.coordinate.longitude
        
        // 2
        let coordinates = CLLocationCoordinate2DMake(self.latitude, self.longitude)
        let marker = GMSMarker(position: coordinates)
        marker.title = "I am here"
        marker.map = self.mapView
        self.mapView.animate(toLocation: coordinates)
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didFailWithError error: Error){
        
        print("An error occurred while tracking location changes : \(error)")
    }

}

extension ViewController: GMSPlacePickerViewControllerDelegate{
    // To receive the results from the place picker 'self' will need to conform to
    // GMSPlacePickerViewControllerDelegate and implement this code.
    func placePicker(_ viewController: GMSPlacePickerViewController, didPick place: GMSPlace) {
        // Dismiss the place picker, as it cannot dismiss itself.
//        viewController.dismiss(animated: true, completion: nil)
     
        let mark = GMSMarker(position: place.coordinate)
        mark.map = self.mapView
        self.mapView.animate(toLocation: place.coordinate)
        
        let config = GMSPlacePickerConfig(viewport: viewport)
        print("Place name \(place.name)")
        print("Place address \(place.formattedAddress)")
        print("phone: \(place.phoneNumber)")
        print("Place attributions \(place.attributions)")
        
    }
    
    func placePickerDidCancel(_ viewController: GMSPlacePickerViewController) {
        // Dismiss the place picker, as it cannot dismiss itself.
        viewController.dismiss(animated: true, completion: nil)
        
        
        print("No place selected")
    }
}
