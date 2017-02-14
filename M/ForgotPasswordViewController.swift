//
//  ForgotPasswordViewController.swift
//  M
//
//  Created by Selvamurugan on 09/02/17.
//  Copyright © 2017 Bosco Soft. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailIdView: UIView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var sendloader: UIActivityIndicatorView!
    
    @IBOutlet weak var sendButtonWidthConstraint: NSLayoutConstraint!
    
    var originalWidth: CGFloat = 0
    var originalFrame: CGRect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sendloader.stopAnimating()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        emailIdView.layer.cornerRadius = emailIdView.bounds.height / 2
        closeButton.layer.cornerRadius = closeButton.bounds.height / 2
        sendButton.layer.cornerRadius = sendButton.bounds.height / 2
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func send(_ sender: UIButton) {
        loadSendButton()
    }
    
    func loadSendButton() {
        originalWidth = self.sendButton.frame.size.width
        originalFrame = self.sendButton.frame
        self.sendloader.startAnimating()
        UIView.animate(withDuration: 0.5, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.sendButton.frame = CGRect(x: ((self.view.frame.size.width / 2) -  (self.sendButton.frame.size.height / 2)), y:  self.sendButton.frame.origin.y, width: self.sendButton.frame.size.height, height:  self.sendButton.frame.size.height)
            self.sendButtonWidthConstraint.constant = self.sendButton.frame.size.height
            self.sendButton.setTitle("", for: UIControlState.normal)
            }, completion: { (true) in
                self.dismiss(animated: true, completion: nil)
                self.unLoadSendButton()
        })
    }
    
    func unLoadSendButton() {
        UIView.animate(withDuration: 0.5, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.sendButton.frame = self.originalFrame
            self.sendButtonWidthConstraint.constant = self.originalWidth
            }, completion: { (true) in
                self.sendloader.stopAnimating()
                self.sendButton.setTitle("I Agree", for: UIControlState.normal)
        })
    }
    
    deinit {
        print("ForgotPassword ViewController is deallocated")
    }

}
