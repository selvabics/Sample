//
//  DashboardViewController.swift
//  M
//
//  Created by Selvamurugan on 09/02/17.
//  Copyright © 2017 Bosco Soft. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.sideMenuViewController.navigationController?.isNavigationBarHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print("DashboardViewController is Deallocated")
    }
    
}
