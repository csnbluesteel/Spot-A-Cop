//
//  MapViewController.swift
//  Spot-A-Cop
//
//  Created by tomas nunez on 4/4/19.
//  Copyright © 2019 BLUESTEEL. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var Map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(36.156594, -115.232301)
        let region:MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        Map.setRegion(region, animated: true)
        
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
