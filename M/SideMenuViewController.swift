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
    
    var menuTitleArr = ["Home", "Movies", "TV Series", "Generes", "Favourites", "Dislike", "Rating", "Settings", "Logout"]
    var menuIconArr = ["IconHome", "Movie", "Tv", "IconCategories", "IconFavourites","Dislike", "Rating", "IconSettings", "IconLogout"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        menuTableview.reloadData()
    }
    
    deinit {
        print("SideMenu ViewController is Deallocated")
    }
    
    // MARK: UITableView Delegate
    
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
        case 1:
            let vc: MoviesViewController = self.storyboard?.instantiateViewController(withIdentifier: "MoviesViewController") as! MoviesViewController
            self.sideMenuViewController.setContentViewController(vc, animated: true)
            self.sideMenuViewController.hideViewController()
            break
        case 2:
            let vc: MoviesListViewController = self.storyboard?.instantiateViewController(withIdentifier: "MoviesListViewController") as! MoviesListViewController
            self.sideMenuViewController.setContentViewController(vc, animated: true)
            self.sideMenuViewController.hideViewController()
            break
        case 3:
            let vc: GenereViewController = self.storyboard?.instantiateViewController(withIdentifier: "GenereViewController") as! GenereViewController
            self.sideMenuViewController.setContentViewController(vc, animated: true)
            self.sideMenuViewController.hideViewController()
            break
        case 7:
            let vc: SettingsViewController = self.storyboard?.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
            self.sideMenuViewController.setContentViewController(vc, animated: true)
            self.sideMenuViewController.hideViewController()
            break
        case 8:
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
