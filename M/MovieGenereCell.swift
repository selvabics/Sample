//
//  MovieGenereCell.swift
//  M
//
//  Created by Selvamurugan on 20/05/17.
//  Copyright © 2017 Bosco Soft. All rights reserved.
//

import UIKit

enum DiceTableViewCellScrollDirection {
    case scrollDirectionNone
    case scrollDirectionRight
    case scrollDirectionLeft
    case scrollDirectionUp
    case scrollDirectionDown
    case scrollDirectionCrazy
}

let DiceTableViewCellDirectionNotification = "DiceTableViewCellDirectionNotification"
let DiceTableViewMaximumOffset: CGFloat = 50.0
let DiceTableViewOffsetFactor: CGFloat = 0.25

class MovieGenereCell: UITableViewCell {

    @IBOutlet weak var genereImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var constraintVerticalCenter: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        genereImageView.clipsToBounds = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.handleDiceTableViewCellDirectionNotification), name: NSNotification.Name(rawValue: DiceTableViewCellDirectionNotification), object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func handleDiceTableViewCellDirectionNotification(_ notification: Notification) {
        let notificationObject: Any? = notification.object
        let scrollDirection: DiceTableViewCellScrollDirection = notificationObject as! DiceTableViewCellScrollDirection
        var constant: CGFloat = constraintVerticalCenter.constant
        switch scrollDirection {
        case DiceTableViewCellScrollDirection.scrollDirectionUp:
            constant -= DiceTableViewOffsetFactor
            if (-1.0 * DiceTableViewMaximumOffset) > constant {
                constant = -1 * DiceTableViewMaximumOffset
            }
        case DiceTableViewCellScrollDirection.scrollDirectionDown:
            constant += DiceTableViewOffsetFactor
            if DiceTableViewMaximumOffset < constant {
                constant = DiceTableViewMaximumOffset
            }
        default: break
        }
        constraintVerticalCenter.constant = constant
    }
    
}
