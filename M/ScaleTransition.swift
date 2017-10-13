//
//  CircularTransition.swift
//  CircularTransition
//
//  Created by Selvamurugan on 06/02/17.
//  Copyright © 2017 Bosco Soft. All rights reserved.
//

import UIKit

open class ScaleTransition: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    @objc public enum ScaleTransitionMode: Int {
        case present, dismiss
    }
    open var transitionDuration : TimeInterval = 0.3
    open var transitionMode: ScaleTransitionMode = .present
    
    convenience public init(startFrame: CGRect) {
        self.init()
    }
    
    //MARK - UIViewControllerAnimatedTransitioning
    
    open func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.transitionDuration
    }
    
    open func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC: UIViewController = transitionContext.viewController(forKey: .from)!
        let toVC: UIViewController = transitionContext.viewController(forKey: .to)!
        let containerView: UIView = transitionContext.containerView
        
        if self.transitionMode == .present {
            containerView.addSubview((toVC.view)!)
            toVC.view?.alpha = 0
            let xForm: CGAffineTransform? = toVC.view?.transform
            toVC.view?.transform = (xForm?.scaledBy(x: 0.9, y: 0.9))!
            UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {() -> Void in
                toVC.view?.alpha = 1
                toVC.view?.transform = (xForm?.scaledBy(x: 1.0, y: 1.0))!
                fromVC.view?.transform = (fromVC.view?.transform.scaledBy(x: 1.0, y: 1.0))!
                }, completion: {(_ finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            })
        } else {
            //            containerView.addSubview(toVC.view)
            containerView.addSubview(fromVC.view)
            let xForm: CGAffineTransform = toVC.view.transform
            toVC.view.transform = toVC.view.transform.scaledBy(x: 1.1, y: 1.1)
            UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {() -> Void in
                fromVC.view.alpha = 0
                fromVC.view.transform = xForm.scaledBy(x: 1.0, y: 1.0)
                toVC.view.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
                }, completion: {(_ finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            })
        }
    }
    
    // MARK: UIViewControllerTransitioningDelegate
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.transitionMode = .present
        return self
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.transitionMode = .dismiss
        return self
    }
}
