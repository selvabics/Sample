//
//  TermsViewController.swift
//  M
//
//  Created by Selvamurugan on 08/02/17.
//  Copyright © 2017 Bosco Soft. All rights reserved.
//

import UIKit

class TermsViewController: UIViewController {
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var agreeButton: UIButton!
    @IBOutlet weak var agreeloader: UIActivityIndicatorView!

    @IBOutlet weak var agreeButtonWidthConstraint: NSLayoutConstraint!
    
    var originalWidth: CGFloat = 0
    var originalFrame: CGRect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.agreeloader.stopAnimating()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        closeButton.layer.cornerRadius = closeButton.bounds.height / 2
        agreeButton.layer.cornerRadius = agreeButton.bounds.height / 2
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func agree(_ sender: UIButton) {
        loadAgreeButton()
    }
    
    func loadAgreeButton() {
        originalWidth = self.agreeButton.frame.size.width
        originalFrame = self.agreeButton.frame
        self.agreeloader.startAnimating()
        UIView.animate(withDuration: 0.5, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.agreeButton.frame = CGRect(x: ((self.view.frame.size.width / 2) -  (self.agreeButton.frame.size.height / 2)), y:  self.agreeButton.frame.origin.y, width: self.agreeButton.frame.size.height, height:  self.agreeButton.frame.size.height)
            self.agreeButtonWidthConstraint.constant = self.agreeButton.frame.size.height
            self.agreeButton.setTitle("", for: UIControlState.normal)
            }, completion: { (true) in
                self.dismiss(animated: true, completion: nil)
                self.unLoadAgreeButton()
        })
    }
    
    
    
    func unLoadAgreeButton() {
        UIView.animate(withDuration: 0.5, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.agreeButton.frame = self.originalFrame
            self.agreeButtonWidthConstraint.constant = self.originalWidth
            }, completion: { (true) in
                self.agreeloader.stopAnimating()
                self.agreeButton.setTitle("I Agree", for: UIControlState.normal)
        })
    }

    deinit {
        print("TermsViewController is deallocated")
    }
    
}
