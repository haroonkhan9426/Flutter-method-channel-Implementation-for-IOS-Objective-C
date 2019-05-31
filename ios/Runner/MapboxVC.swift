//
//  MapboxVC.swift
//  Runner
//
//  Created by APPLE on 29/05/2019.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import UIKit
import Mapbox

class MapboxVC: UIViewController, MGLMapViewDelegate{

    @IBOutlet weak var mapView: MGLMapView!
    var markers = Array<MGLPointAnnotation>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate;
        let baseLocation = CLLocationCoordinate2D(latitude: 33.684422, longitude: 73.047882)
    
        //Setting camera to a base location which is Islamabad
        mapView.setCenter(baseLocation, zoomLevel: 10, animated: true)
        mapView.delegate = self
        
        //print("Name: \(appDelegate.getMarkers())")
        markers = appDelegate.markers as! [MGLPointAnnotation]
        markers = appDelegate.getMarkers() as! [MGLPointAnnotation]
        let marker = MGLPointAnnotation()
        marker.coordinate = CLLocationCoordinate2D(latitude: 33.684422, longitude: 73.047882)
        marker.title = "Islamabad"
        marker.subtitle = "Capital City of Pakistan"
        mapView.addAnnotations(markers)
        
        for mark in markers{
            print("Following data recieved\n")
            print("Name: \(mark.title ?? "No Value found")\n")
            
        }
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
        return nil
    }
    
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        return true
    }
    
}

