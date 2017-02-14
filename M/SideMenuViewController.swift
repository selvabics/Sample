//
//  SideMenuViewController.swift
//  M
//
//  Created by Selvamurugan on 13/02/17.
//  Copyright © 2017 Bosco Soft. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var menuTableview: UITableView!
    
    var menuTitleArr = ["Home", "Categories", "Favourites", "Terms & Conditions", "Forgot Password", "Settings", "Logout"]
    var menuIconArr = ["IconHome", "IconCategories", "IconFavourites", "IconTermsAndConditions", "IconForgotPassword", "IconSettings", "IconLogout"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        menuTableview.reloadData()
        print("viewWillAppear")
    }
    
    deinit {
        print("SideMenuViewController is Deallocated")
    }
    
    // MARK: UITableView Delegate
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0.5
        cell.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 0, 50, 0)
        UIView.animate(withDuration: 1) {
            cell.alpha = 1
            cell.layer.transform = CATransform3DIdentity
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuTitleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuTableViewCell
        cell.menuTitleLabel.text = menuTitleArr[indexPath.row]
        cell.iconButton.setImage(UIImage(named: menuIconArr[indexPath.row]), for: UIControlState.normal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            let vc: DashboardViewController = self.storyboard?.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
            self.sideMenuViewController.setContentViewController(vc, animated: true)
            self.sideMenuViewController.hideViewController()
            break
        case 3:
            let vc: TermsViewController = self.storyboard?.instantiateViewController(withIdentifier: "TermsViewController") as! TermsViewController
            self.sideMenuViewController.setContentViewController(vc, animated: true)
            self.sideMenuViewController.hideViewController()
            break
        case 4:
            let vc: ForgotPasswordViewController = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as! ForgotPasswordViewController
            self.sideMenuViewController.setContentViewController(vc, animated: true)
            self.sideMenuViewController.hideViewController()
            break
        case 6:
            let vc: ViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            self.sideMenuViewController.setContentViewController(vc, animated: true)
            self.sideMenuViewController.hideViewController()
            break
        default:
            self.sideMenuViewController.hideViewController()
            break
        }
    }
    
}
