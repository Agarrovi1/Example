//
//  ViewController.swift
//  Maps
//
//  Created by Angela Garrovillas on 11/1/19.
//  Copyright © 2019 Angela Garrovillas. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {

    let locationManager = CLLocationManager()
    let mapView = MKMapView(frame: UIScreen.main.bounds)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(mapView)
        locationManager.delegate = self
        requestLocationWhenNeeded()
        
        mapView.showsUserLocation = true
        
    }

    private func requestLocationWhenNeeded() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.requestLocation()
        default:
            locationManager.requestWhenInUseAuthorization()
        }
    }

}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //locations.first?.coordinate.
        print(locations)
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("Authorization status changed to \(status.rawValue)")
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.requestLocation()
        default:
            break
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("An error occurred: \(error)")
    }
}
