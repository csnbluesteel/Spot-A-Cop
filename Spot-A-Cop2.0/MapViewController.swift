//
//  MapViewController.swift
//  Spot-A-Cop
//
//  Created by tomas nunez on 4/11/19.
//  Copyright © 2019 BLUESTEEL. All rights reserved.
//

import Parse
import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!    
    let locationManager = CLLocationManager()
    let regionInMeters: Double = 300
    var locations = [PFObject]()
    var location = PFObject(className:"location")
    
    @IBAction func dropApin(_ sender: Any) {
        
        let annotation = MKPointAnnotation()
        let locationCoordinate = CLLocationCoordinate2D(latitude: mapView.userLocation.coordinate.latitude, longitude: mapView.userLocation.coordinate.longitude)
        let latitude = locationCoordinate.latitude
        let longitude = locationCoordinate.longitude
        
        let point = PFGeoPoint(latitude:latitude, longitude: longitude)
        
        location["coordinates"] = point
        annotation.coordinate = locationCoordinate
        annotation.title = "COP!"
        mapView.addAnnotation(annotation)
        
        location.saveInBackground { (success: Bool, failure: Error?) in
            if (success) {
                print("Coordinates were saved")
            } else {
                
                print("Coordinates were not saved")
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?
    {
        if !(annotation is MKPointAnnotation) {
            return nil
        }
        
        let annotationIdentifier = "annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier)
        
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView!.canShowCallout = true
        }
        else {
            annotationView!.annotation = annotation
        }
        annotationView!.image = UIImage(named: "Mr piggy")
        annotationView?.transform = CGAffineTransform(scaleX: 0.05, y: 0.07)
        return annotationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLocationServices()
        mapView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "location")
        query.includeKeys(["coordinates"])
        // query.limit = 20
        
        query.findObjectsInBackground { (locations, error) in
            if locations != nil{
                self.locations = locations!
                //print(self.locations)
                //var savedCord = locations
                var count = 0
                for location in locations!{
                    let annotation = MKPointAnnotation()
                    //let point = PFGeoPoint(latitude:latitude, longitude: longitude)
                    print("Count = \(count)")
                    //print(location)
                    let value = type(of: location)
                    print("'\(location)' of type '\(value)'")
                    count = count + 1
                    //let test_point = PFObject(className: "coordinates")
                    let test_point = location["coordinates"] as! PFGeoPoint
                    let locationCoordinate = CLLocationCoordinate2D(latitude: test_point.latitude, longitude: test_point.longitude)
                    //print(String(location[0]))
                    //let locationCoordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
                    annotation.coordinate = locationCoordinate
                    annotation.title = "COP!"
                    self.mapView.addAnnotation(annotation)
                }
                
            }
        }
    }


    
    func setupLocationManager()  {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func centerViewOnUserLoction(){
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion.init(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func checkLocationServices(){
        if CLLocationManager.locationServicesEnabled(){
            setupLocationManager()
            checkLocationAuthorization()
        }else {
            // show alert letting
        }
    }
    
    func checkLocationAuthorization(){
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            centerViewOnUserLoction()
            locationManager.startUpdatingLocation()
            break
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            break
        case .authorizedAlways:
            break
        }
    }
    
    @IBAction func LogOutButton(_ sender: Any) {
        PFUser.logOut()
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
       let delegate =  UIApplication.shared.delegate as! AppDelegate
        delegate.window?.rootViewController = loginViewController
    }
}

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion.init(center: center, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
        mapView.setRegion(region, animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
    
}



