//
//  MoviesViewController.swift
//  M
//
//  Created by Selvamurugan on 20/05/17.
//  Copyright © 2017 Bosco Soft. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, RATreeViewDelegate, RATreeViewDataSource, UIScrollViewDelegate {
    
    @IBOutlet var treeView : RATreeView!
    
    var lastContentOffset = CGPoint.zero

    override func viewDidLoad() {
        super.viewDidLoad()

//        treeView.register(UINib(nibName: String(describing: Genere1Cell.self), bundle: nil), forCellReuseIdentifier: String(describing: Genere1Cell.self))
//        treeView.register(UINib(nibName: String(describing: Genere2Cell.self), bundle: nil), forCellReuseIdentifier: String(describing: Genere2Cell.self))
        treeView.register(UINib(nibName: String(describing: MovieGenereCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MovieGenereCell.self))
        treeView.register(UINib(nibName: "MovieGenere1Cell", bundle: nil), forCellReuseIdentifier: "MovieGenere1Cell")
        treeView.delegate = self;
        treeView.dataSource = self;
        treeView.separatorStyle = .init(0)
        treeView.separatorColor = self.view.backgroundColor
        
        treeView.scrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print("Movies ViewController is deallocated")
    }
    
    //MARK: RATreeView data source
    
    func treeView(_ treeView: RATreeView, numberOfChildrenOfItem item: Any?) -> Int {
        if let item = item as? Genere {
            return item.subGenere.count
        } else {
            return genereArr.count
        }
    }
    
    func treeView(_ treeView: RATreeView, child index: Int, ofItem item: Any?) -> Any {
        if let item = item as? Genere {
            return item.subGenere[index]
        } else {
            return genereArr[index] as AnyObject
        }
    }
    
    func treeView(_ treeView: RATreeView, cellForItem item: Any?) -> UITableViewCell {
        let item = item as! Genere
        let level = item.level
        if level == "2" {
            let cell = treeView.dequeueReusableCell(withIdentifier: "MovieGenere1Cell") as! MovieGenereCell
            cell.genereImageView.image = UIImage(named: item.genereImageName)
            cell.nameLabel.text = item.genereName
            return cell
        }else{
            let cell = treeView.dequeueReusableCell(withIdentifier: String(describing: MovieGenereCell.self)) as! MovieGenereCell
            cell.genereImageView.image = UIImage(named: item.genereImageName)
            cell.nameLabel.text = item.genereName
            return cell
        }
    }
    
    func treeView(_ treeView: RATreeView, heightForRowForItem item: Any) -> CGFloat {
        if let item = item as? Genere {
            let level = item.level
            if level == "2" {
                return 100
            }else{
                return 150
            }
        } else {
            return 150
        }
    }
    
    func treeView(_ treeView: RATreeView, didSelectRowForItem item: Any) {
        
    }
    
    func treeView(_ treeView: RATreeView, canEditRowForItem item: Any) -> Bool {
        return false
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var scrollDirection: DiceTableViewCellScrollDirection = DiceTableViewCellScrollDirection.scrollDirectionNone
        if lastContentOffset.x > scrollView.contentOffset.x {
            scrollDirection = DiceTableViewCellScrollDirection.scrollDirectionRight
        }
        else if lastContentOffset.x < scrollView.contentOffset.x {
            scrollDirection = DiceTableViewCellScrollDirection.scrollDirectionLeft
        }
        else if lastContentOffset.y > scrollView.contentOffset.y {
            scrollDirection = DiceTableViewCellScrollDirection.scrollDirectionDown
        }
        else if lastContentOffset.y < scrollView.contentOffset.y {
            scrollDirection = DiceTableViewCellScrollDirection.scrollDirectionUp
        }
        else {
            scrollDirection = DiceTableViewCellScrollDirection.scrollDirectionCrazy
        }
        
        lastContentOffset = scrollView.contentOffset
        let notificationObject: Any? = scrollDirection
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: DiceTableViewCellDirectionNotification), object: notificationObject)
    }

}
