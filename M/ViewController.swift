//
//  ViewController.swift
//  M
//
//  Created by Selvamurugan on 06/02/17.
//  Copyright © 2017 Bosco Soft. All rights reserved.
//

import UIKit

let kTotalItems = 3

class ViewController: UIViewController, PageDelegate {

    // MARK: - IBOutlet Variables
    
    @IBOutlet weak var welcomeView: UIView!
    @IBOutlet weak var signInView: UIView!
    @IBOutlet weak var signUpView: UIView!
    @IBOutlet weak var signInUsernameView: UIView!
    @IBOutlet weak var signInPasswordView: UIView!
    @IBOutlet weak var signUpUsernameView: UIView!
    @IBOutlet weak var signUpPasswordView: UIView!
    @IBOutlet weak var signUpEmailIdView: UIView!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    @IBOutlet weak var termsButton: UIButton!
    @IBOutlet weak var signInloader: UIActivityIndicatorView!
    @IBOutlet weak var signUploader: UIActivityIndicatorView!
    
    // MARK: - Local Variables
    
    var circularTransition: CircularTransition?
    let scaleTransition = ScaleTransition()
    
    var backgroundParallax: FFBackgroundParallax!
    var pageControl: UIPageControl!
    var signInFrame: CGRect!
    var signInState = 1
    var signUpFrame: CGRect!
    var signUpState = 1
    
    // MARK: - Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.signInloader.stopAnimating()
        self.signUploader.stopAnimating()
        
        configureBackgroundParallax()
        configurePageControl()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.backgroundParallax.contentScrollView.contentOffset.x = CGFloat(self.view.bounds.width)
    }
    
    override func viewDidLayoutSubviews() {
        configureViews()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Terms" {
            self.circularTransition = CircularTransition(animatedView: self.termsButton!, colorCode: 0xFFFFFF)
        }else{
            self.circularTransition = CircularTransition(animatedView: self.forgotPasswordButton!, colorCode: 0xFFFFFF)
        }
        let controller = segue.destination
        controller.modalPresentationStyle = .custom
        controller.transitioningDelegate = self.circularTransition
    }
    
    deinit {
        print("ViewController is deallocated")
    }
    
    // MARK: - Custom Methods
    
    func configurePageControl() {
        self.pageControl = UIPageControl(frame: CGRect(x: 20, y: self.view.bounds.height - 100, width: self.view.bounds.width - 40, height: 40))
        self.pageControl.numberOfPages = 3
        self.pageControl.currentPage = 1
        self.pageControl.tintColor = UIColor.red
        self.pageControl.pageIndicatorTintColor = UIColor.white
        self.pageControl.currentPageIndicatorTintColor = UIColor.red
        self.pageControl.isUserInteractionEnabled = false
        self.view.addSubview(pageControl)
    }
    
    func configureViews() {
        signInUsernameView.layer.cornerRadius = signInUsernameView.bounds.height / 2
        signInPasswordView.layer.cornerRadius = signInPasswordView.bounds.height / 2
        signUpUsernameView.layer.cornerRadius = signUpUsernameView.bounds.height / 2
        signUpPasswordView.layer.cornerRadius = signUpPasswordView.bounds.height / 2
        signUpEmailIdView.layer.cornerRadius = signUpEmailIdView.bounds.height / 2
        signInButton.layer.cornerRadius = signInButton.bounds.height / 2
        signUpButton.layer.cornerRadius = signUpButton.bounds.height / 2
        termsButton.layer.cornerRadius = termsButton.bounds.height / 2
    }

    func configureBackgroundParallax() {
        backgroundParallax = FFBackgroundParallax(frame: UIScreen.main.bounds)
        backgroundParallax.setImageBackground(UIImage(named: "WelcomeBackground.jpg"))
        var xOrigin: CGFloat = 0
        for i in 0..<kTotalItems {
            if i == 0 {
                signInView.frame = CGRect(x: xOrigin, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
                backgroundParallax.contentScrollView.addSubview(signInView)
            }
            if i == 1 {
                welcomeView.frame = CGRect(x: xOrigin, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
                backgroundParallax.contentScrollView.addSubview(welcomeView)
            }
            if i == 2 {
                signUpView.frame = CGRect(x: xOrigin, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
                backgroundParallax.contentScrollView.addSubview(signUpView)
            }
            xOrigin = xOrigin + self.view.bounds.width
        }
        backgroundParallax.delegate = self
        backgroundParallax.contentScrollView.contentSize = CGSize(width: CGFloat(backgroundParallax.frame.width * CGFloat(kTotalItems)), height: CGFloat(backgroundParallax.frame.height))
        self.view.addSubview(backgroundParallax)
    }
    
    func changeContent(xValue: CGFloat) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
                self.backgroundParallax.contentScrollView.contentOffset.x = xValue
                }, completion: nil)
        }
    }
    
    func changePage(_ pageNo: Int32) {
        pageControl.currentPage = Int(pageNo)
    }
    
    func goToDashboard() {
        let vc: DashboardViewController = self.storyboard?.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
        self.sideMenuViewController.setContentViewController(vc, animated: true)
        
//        vc.modalPresentationStyle = .custom
//        vc.transitioningDelegate = scaleTransition
//        self.present(vc, animated: true, completion: nil)
    }
    
    func loadSignInButton() {
        self.signInState = 2
        signInFrame = signInButton.frame
        self.signInloader.startAnimating()
        UIView.animate(withDuration: 0.5, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.signInButton.frame = CGRect(x: ((self.view.frame.size.width / 2) -  (self.signInButton.frame.size.height / 2)), y:  self.signInButton.frame.origin.y, width: self.signInButton.frame.size.height, height:  self.signInButton.frame.size.height)
            self.signInButton.setTitle("", for: UIControlState.normal)
            }, completion: { (true) in
                self.goToDashboard()
                self.unLoadSignInButton()
        })
    }
    
    func unLoadSignInButton() {
        self.signInState = 1
        UIView.animate(withDuration: 0.5, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.signInButton.frame = self.signInFrame
            }, completion: { (true) in
                self.signInloader.stopAnimating()
                self.signInButton.setTitle("Sign In", for: UIControlState.normal)
        })
    }
    
    func loadSignUpButton() {
        self.signUpState = 2
        signUpFrame = signUpButton.frame
        
        Utility.sharedInstance.loadButton(loader: signUploader, button: signUpButton, title: "", mainView: self.view) { (true) in
            self.goToDashboard()
            self.unLoadSignUpButton()
        }
        
//        self.signUploader.startAnimating()
//        UIView.animate(withDuration: 0.5, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
//            self.signUpButton.frame = CGRect(x: ((self.view.frame.size.width / 2) -  (self.signUpButton.frame.size.height / 2)), y:  self.signUpButton.frame.origin.y, width: self.signUpButton.frame.size.height, height:  self.signUpButton.frame.size.height)
//            self.signUpButton.setTitle("", for: UIControlState.normal)
//            }, completion: { (true) in
//                self.goToDashboard()
//                self.unLoadSignUpButton()
//        })
    }
    
    func unLoadSignUpButton() {
        self.signUpState = 1
        
        Utility.sharedInstance.unLoadButton(loader: signUploader, button: signUpButton, title: "Sign Up", frame: signUpFrame)
        
//        UIView.animate(withDuration: 0.5, delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: {
//            self.signUpButton.frame = self.signUpFrame
//            }, completion: { (true) in
//                self.signUploader.stopAnimating()
//                self.signUpButton.setTitle("Sign Up", for: UIControlState.normal)
//        })
    }
    
    // MARK: - IBOutlet Action Methods
    
    @IBAction func signIn(_ sender: UIButton) {
        if self.signInState == 1 {
            self.loadSignInButton()
        } else {
            self.unLoadSignInButton()
        }
    }
    
    @IBAction func signUp(_ sender: UIButton) {
        if self.signUpState == 1 {
            self.loadSignUpButton()
        } else {
            self.unLoadSignUpButton()
        }
    }
    
    @IBAction func goToSignIn(_ sender: UIButton) {
        changeContent(xValue: 0)
        pageControl.currentPage = 0
    }
    
    @IBAction func goToSignUp(_ sender: UIButton) {
        changeContent(xValue: self.backgroundParallax.contentScrollView.contentSize.width - self.view.bounds.width)
        pageControl.currentPage = 2
    }
    
}
