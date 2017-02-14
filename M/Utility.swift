//
//  Utility.swift
//  M
//
//  Created by Selvamurugan on 13/02/17.
//  Copyright © 2017 Bosco Soft. All rights reserved.
//

import UIKit

class Utility {

    static let sharedInstance = Utility()
    
    private init() {}
    
    func loadButton(loader: UIActivityIndicatorView, button: UIButton, title: String, mainView: UIView, completion: @escaping (_ result: Bool)->()) {
        loader.startAnimating()
        UIView.animate(withDuration: 0.5, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            button.frame = CGRect(x: ((mainView.frame.size.width / 2) -  (button.frame.size.height / 2)), y:  button.frame.origin.y, width: button.frame.size.height, height:  button.frame.size.height)
            button.setTitle(title, for: UIControlState.normal)
            }, completion: { (true) in
                completion(true)
        })
    }
    
    func unLoadButton(loader: UIActivityIndicatorView, button: UIButton, title: String, frame: CGRect) {
        UIView.animate(withDuration: 0.5, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            button.frame = frame
            }, completion: { (true) in
                loader.stopAnimating()
                button.setTitle(title, for: UIControlState.normal)
        })
    }
    
}
