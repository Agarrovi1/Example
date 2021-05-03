//
//  PickLocationViewController.swift
//  local-notifications-demo
//
//  Created by David Rifkin on 11/7/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class PickLocationViewController: UIViewController {

    private var mapView = MKMapView(frame: UIScreen.main.bounds)
    
    private let locationManager = CLLocationManager()
    let initialLocation = CLLocation(latitude: 40.742054, longitude: -73.769417)
    let searchRadius: CLLocationDistance = 2000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
        locationManager.delegate = self
        mapView.userTrackingMode = .follow
    }
}

extension PickLocationViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("New location: \(locations)")
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.requestLocation()
            //Call a function to get the current location
            
        default:
            break
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: \(error)")
    }
    
}
