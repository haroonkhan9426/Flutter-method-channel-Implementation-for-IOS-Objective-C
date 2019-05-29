//
//  MapboxVC.swift
//  Runner
//
//  Created by APPLE on 29/05/2019.
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//

import UIKit

class MapboxVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
