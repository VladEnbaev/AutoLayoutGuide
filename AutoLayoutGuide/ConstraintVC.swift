//
//  ViewController.swift
//  AutoLayoutGuide
//
//  Created by Влад Енбаев on 17.01.2023.
//

import UIKit

class ConstraintVC: ParentViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        blackView.layer.cornerRadius = 40
        greenView.layer.cornerRadius = otherViewsHeight / 2
        redView.layer.cornerRadius = otherViewsHeight / 2
        yellowView.layer.cornerRadius = otherViewsHeight / 2
    }
    
    override func layoutBlackView() {
        NSLayoutConstraint(item: blackView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: blackView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerY,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: blackView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: blackViewHeight).isActive = true
        NSLayoutConstraint(item: blackView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: blackViewWidth).isActive = true
    }
    
    override func layoutRedView() {
        NSLayoutConstraint(item: redView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: blackView,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: redView,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .top,
                           multiplier: 1,
                           constant: -otherViewsSeparator).isActive = true
        NSLayoutConstraint(item: redView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: otherViewsHeight).isActive = true
        NSLayoutConstraint(item: redView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: otherViewsHeight).isActive = true
    }
    
    override func layoutYellowView() {
        NSLayoutConstraint(item: yellowView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: blackView,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: yellowView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: blackView,
                           attribute: .centerY,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: yellowView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: otherViewsHeight).isActive = true
        NSLayoutConstraint(item: yellowView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: otherViewsHeight).isActive = true
    }
    
    override func layoutGreenView() {
        NSLayoutConstraint(item: greenView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: blackView,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: greenView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: yellowView,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: otherViewsSeparator).isActive = true
        NSLayoutConstraint(item: greenView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: otherViewsHeight).isActive = true
        NSLayoutConstraint(item: greenView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1,
                           constant: otherViewsHeight).isActive = true
        
        
        
    }

}

