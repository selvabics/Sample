//
//  GenereCell.swift
//  M
//
//  Created by Selvamurugan on 17/05/17.
//  Copyright © 2017 Bosco Soft. All rights reserved.
//

import UIKit

class GenereCell: UITableViewCell, UITableViewDelegate {
    
    @IBOutlet weak var genereImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imgBackTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var imgBackBottomConstraint: NSLayoutConstraint!
    
    let imageParallaxFactor: CGFloat = 100
    var imgBackTopInitial: CGFloat!
    var imgBackBottomInitial: CGFloat!

    override func awakeFromNib() {
        self.clipsToBounds = true
        self.imgBackBottomConstraint.constant -= 2 * imageParallaxFactor
        self.imgBackTopInitial = self.imgBackTopConstraint.constant
        self.imgBackBottomInitial = self.imgBackBottomConstraint.constant
    }
    
    func setBackgroundOffset(_ offset:CGFloat) {
        let boundOffset = max(0, min(1, offset))
        let pixelOffset = (1-boundOffset)*2*imageParallaxFactor
        self.imgBackTopConstraint.constant = self.imgBackTopInitial - pixelOffset
        self.imgBackBottomConstraint.constant = self.imgBackBottomInitial + pixelOffset
    }

}
