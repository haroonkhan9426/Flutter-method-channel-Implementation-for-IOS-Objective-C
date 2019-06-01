//
//  MapBoxNavigationVC.swift
//  Runner
//
//  Created by APPLE on 01/06/2019.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import UIKit
import Mapbox
import MapboxCoreNavigation
import MapboxNavigation
import MapboxDirections


class MapBoxNavigationVC: UIViewController {
    @IBOutlet weak var mapView: MGLMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
