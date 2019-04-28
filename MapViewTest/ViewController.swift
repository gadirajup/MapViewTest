//
//  ViewController.swift
//  MapViewTest
//
//  Created by Prudhvi Gadiraju on 4/27/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let london = Capital(coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), title: "London",  subtitle: "Home to the 2012 Summer Olympics.")
        let oslo = Capital(coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75), title: "Oslo",  subtitle: "Founded over a thousand years ago.")
        let paris = Capital(coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508), title: "Paris",  subtitle: "Often called the City of Light.")
        let rome = Capital(coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5), title: "Rome",  subtitle: "Has a whole country inside it.")
        let washington = Capital(coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), title: "Washington DC",  subtitle: "Named after George himself.")
        
        mapView.addAnnotations([london, oslo, paris, rome, washington])
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "capital"
        if annotation is Capital {
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            if annotationView == nil {
                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                annotationView?.canShowCallout = true
                let btn = UIButton(type: .detailDisclosure)
                annotationView?.rightCalloutAccessoryView = btn
            } else  {
                annotationView?.annotation = annotation
            }
            
            return annotationView
        }
        
        return nil
    }


}

