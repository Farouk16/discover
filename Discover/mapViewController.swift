//
//  map.swift
//  Discover
//
//  Created by Farouk on 8/23/17.
//  Copyright © 2017 Farouk. All rights reserved.
//

import UIKit
import MapKit

class mapViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    
    
        
    @IBAction func rabatOn(_ sender: UISwitch) {
    
    if (sender.isOn == true) {
            
            let span: MKCoordinateSpan = MKCoordinateSpanMake(0.1, 0.1)
            let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(33.977029, -6.852802)
            let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
            
            map.setRegion(region, animated: true)
            let annotation = MKPointAnnotation()
            annotation.title = "Rabat"
            annotation.subtitle = "Explore the city"
            map.addAnnotation(annotation)
            
        }else{
            let span: MKCoordinateSpan = MKCoordinateSpanMake(15, 15)
            let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(33.977029, -6.852802)
            let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
            
            map.setRegion(region, animated: true)
        }
    }
        
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

