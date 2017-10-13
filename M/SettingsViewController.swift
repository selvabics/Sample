//
//  SettingsViewController.swift
//  M
//
//  Created by Selvamurugan on 28/02/17.
//  Copyright © 2017 Bosco Soft. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var settingTableview: UITableView!
    
    var menuTitleArr = ["Home", "Movies", "TV Series", "Generes", "Favourites", "Dislike", "Rating", "Terms & Conditions", "Forgot Password", "Settings", "Logout"]
    var menuIconArr = ["IconHome", "Movie", "Tv", "IconCategories", "IconFavourites","Dislike", "Rating", "IconTermsAndConditions", "IconForgotPassword", "IconSettings", "IconLogout"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print("Settings ViewController is Deallocated")
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
        print(indexPath.row)
    }

}
