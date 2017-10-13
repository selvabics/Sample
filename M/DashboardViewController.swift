//
//  DashboardViewController.swift
//  M
//
//  Created by Selvamurugan on 09/02/17.
//  Copyright © 2017 Bosco Soft. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var scaleTransition: ScaleTransition!
    var startingFrame: CGRect = CGRect.zero
    var scrollUp: Bool = false
    var cellAnimationSize: CGFloat = 0
    
    fileprivate var currentPage: Int = 0 {
        didSet {
            let filmIndustry = filmIndustryArr[self.currentPage]
            self.titleLabel.text = filmIndustry.industryName
        }
    }
    fileprivate var pageSize: CGSize {
        let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
        var pageSize = layout.itemSize
        if layout.scrollDirection == .horizontal {
            pageSize.width += layout.minimumLineSpacing
        } else {
            pageSize.height += layout.minimumLineSpacing
        }
        return pageSize
    }
    
    fileprivate var orientation: UIDeviceOrientation {
        return UIDevice.current.orientation
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.sideMenuViewController.navigationController?.isNavigationBarHidden = false
        
        self.currentPage = 0
        self.cellAnimationSize = self.tableView.bounds.height
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print("Dashboard ViewController is Deallocated")
    }
    
    // MARK: - UIScrollView Delegate Methods
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // Cell Animation
        if(scrollView.panGestureRecognizer.translation(in: scrollView.superview).y > 0) {
            scrollUp = true
        }else{
            scrollUp = false
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.cellAnimationSize = 50
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let layout = self.collectionView.collectionViewLayout as! UPCarouselFlowLayout
        let pageSide = (layout.scrollDirection == .horizontal) ? self.pageSize.width : self.pageSize.height
        let offset = (layout.scrollDirection == .horizontal) ? scrollView.contentOffset.x : scrollView.contentOffset.y
        currentPage = Int(floor((offset - pageSide / 2) / pageSide) + 1)
    }
    
    // MARK: - CollectionView Delegate Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmIndustryArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: FilmIndustryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilmIndustryCell", for: indexPath) as! FilmIndustryCell
        let filmIndustry: FilmIndustry = filmIndustryArr[indexPath.row]
        cell.filmIndustryImageView.image = UIImage(named: filmIndustry.industryImageName)
        cell.nameLabel.text = filmIndustry.industryName
         
        cell.containerView.layer.shadowColor = UIColor.black.cgColor
        cell.containerView.layer.shadowOpacity = 0.5
        cell.containerView.layer.shadowOffset = CGSize.zero
        cell.containerView.layer.shadowRadius = 5
        
        return cell
    }
    
    // MARK: UITableView Delegate
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        // Cell Animation
        cell.alpha = 0.8
        if scrollUp {
            cell.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 0, -cellAnimationSize, 0)
        }else{
            cell.layer.transform = CATransform3DTranslate(CATransform3DIdentity, 0, cellAnimationSize, 0)
        }
        UIView.animate(withDuration: 1, delay: 0, options: UIViewAnimationOptions.allowUserInteraction, animations: {
            cell.alpha = 1
            cell.layer.transform = CATransform3DIdentity
        }, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FilmCell = tableView.dequeueReusableCell(withIdentifier: "FilmCell", for: indexPath) as! FilmCell
        let film: Film = filmArr[indexPath.row]
        cell.filmImageView.image = UIImage(named: film.filmImageName)
        cell.nameLabel.text = film.filmName
        cell.descriptionLabel.text = film.filmDescription
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell: FilmCell = tableView.cellForRow(at: indexPath) as! FilmCell
        startingFrame = (cell.filmImageView.superview?.convert(cell.filmImageView.frame, to: nil))!
        
        let vc: FilmViewController = self.storyboard?.instantiateViewController(withIdentifier: "FilmViewController") as! FilmViewController
        vc.modalPresentationStyle = .custom
        scaleTransition = ScaleTransition(startFrame: startingFrame)
        vc.transitioningDelegate = scaleTransition
        self.present(vc, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {}
    }
    
}
