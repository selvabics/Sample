//
//  MoviesListViewController.swift
//  M
//
//  Created by Selvamurugan on 22/05/17.
//  Copyright © 2017 Bosco Soft. All rights reserved.
//

import UIKit

func color(_ rgbColor: Int) -> UIColor{
    return UIColor(
        red:   CGFloat((rgbColor & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbColor & 0x00FF00) >> 8 ) / 255.0,
        blue:  CGFloat((rgbColor & 0x0000FF) >> 0 ) / 255.0,
        alpha: CGFloat(1.0)
    )
}

class MoviesListViewController: UIViewController, FaveButtonDelegate, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var heartButton: FaveButton?
    @IBOutlet var loveButton : FaveButton?
    
    let transition = PopAnimator()
    var startingFrame: CGRect = CGRect.zero
    
    let colors = [
        DotColors(first: color(0x7DC2F4), second: color(0xE2264D)),
        DotColors(first: color(0xF8CC61), second: color(0x9BDFBA)),
        DotColors(first: color(0xAF90F4), second: color(0x90D1F9)),
        DotColors(first: color(0xE9A966), second: color(0xF8C852)),
        DotColors(first: color(0xF68FA7), second: color(0xF6A2B8))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print("MoviesList ViewController is deallocated")
    }
    
    // MARK: - FaveButton Delegate Methods
    
    func faveButton(_ faveButton: FaveButton, didSelected selected: Bool){
    }
    
    func faveButtonDotColors(_ faveButton: FaveButton) -> [DotColors]?{
        if( faveButton === heartButton || faveButton === loveButton){
            return colors
        }
        return nil
    }
    
    // MARK: - CollectionView Delegate Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmIndustryArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MoviesListCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesListCell", for: indexPath) as! MoviesListCell
        let filmIndustry: FilmIndustry = filmIndustryArr[indexPath.row]
        cell.genereImageView.image = UIImage(named: filmIndustry.industryImageName)
        cell.nameLabel.text = filmIndustry.industryName
        
        cell.contentView.layer.shadowColor = UIColor.black.cgColor
        cell.contentView.layer.shadowOpacity = 0.5
        cell.contentView.layer.shadowOffset = CGSize.zero
        cell.contentView.layer.shadowRadius = 5
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let imageCell = cell as! MoviesListCell
        self.setCellImageOffset(imageCell, indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell: MoviesListCell = collectionView.cellForItem(at: indexPath) as! MoviesListCell
        let frame = (cell.superview?.convert(cell.frame, to: self.view))!
        startingFrame = frame
        
        let vc: FilmViewController = self.storyboard?.instantiateViewController(withIdentifier: "FilmViewController") as! FilmViewController
        vc.transitioningDelegate = self
        self.present(vc, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {}
    }
    
    // MARK: ScrollView Delegate Methods
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView == self.collectionView) {
            for cell in self.collectionView.visibleCells {
                let indexPath = cell.indexPath
                self.setCellImageOffset(cell as! MoviesListCell, indexPath: indexPath!)
            }
        }
    }
    
    // MARK: UITableView Parallex Effect Methods
    
    func setCellImageOffset(_ cell: MoviesListCell, indexPath: IndexPath) {
        let attributes: UICollectionViewLayoutAttributes? = collectionView?.layoutAttributesForItem(at: indexPath)
        let cellFrame = attributes?.frame
        let cellFrameInTable = self.collectionView.convert(cellFrame!, to:self.collectionView.superview)
        let cellOffset = cellFrameInTable.origin.y + cellFrameInTable.size.height
        let tableHeight = self.collectionView.bounds.size.height + cellFrameInTable.size.height
        let cellOffsetFactor = cellOffset / tableHeight
        cell.setBackgroundOffset(cellOffsetFactor)
    }

}

extension UICollectionViewCell {
    
    var indexPath: IndexPath? {
        return (superview as? UICollectionView)?.indexPath(for: self)
    }
}

extension MoviesListViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.originFrame = startingFrame
        transition.presenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.presenting = false
        return transition
    }
}
