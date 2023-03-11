//
//  VisualFormatLanguageVC.swift
//  AutoLayoutGuide
//
//  Created by Влад Енбаев on 17.01.2023.
//

import UIKit

class VisualFormatLanguageVC : ParentViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func layoutBlackView() {
        let vflViews : [String : UIView] = ["blackView" : blackView, "superview" : view]
        let vflMetrics : [String: Any] = ["verticalSpacing"     : view.bounds.height * 1/4,
                                          "horisontalSpacing"   : view.bounds.width * 1/4,
                                          "height"              : blackViewHeight!,
                                          "width"               : blackViewWidth!]
        
        let vflConstraintsVertical    = "V:|-(verticalSpacing@999)-[blackView(height)]-(verticalSpacing@999)-|"
        let vflConstraintsHorisontal  = "H:|-(horisontalSpacing@999)-[blackView(width)]-(horisontalSpacing@999)-|"
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: vflConstraintsVertical,
                                                           metrics: vflMetrics,
                                                           views: vflViews))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: vflConstraintsHorisontal,
                                                           metrics: vflMetrics,
                                                           views: vflViews))
        NSLayoutConstraint(item: blackView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerY,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: blackView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: view,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        
    }
    
    override func layoutYellowView() {
        let vflViews : [String : UIView] = ["redView" : redView, "greenView" : greenView, "yellowView" : yellowView]
        let vflMetrics = ["spacing" : otherViewsSeparator, "H" : otherViewsHeight]
        
        let vflConstraintsVertical = "V:|-(>=0)-[redView(H)]-(spacing)-[yellowView(H)]-(spacing)-[greenView(H)]-(>=0)-|"
//        strange code with vfl trying to center x
//        let vflYellowConstraintsHorisontal = "H:|-(>=0)-[yellowView(H)]-(>=0)-|"
//        let vflGreenConstraintsHorisontal  = "H:|-(>=0)-[greenView(H)]-(>=0)-|"
//        let vflRedConstraintsHorisontal    = "H:|-(>=0)-[redView(H)]-(>=0)-|"
        
        NSLayoutConstraint(item: yellowView,
                           attribute: .centerY,
                           relatedBy: .equal,
                           toItem: blackView,
                           attribute: .centerY,
                           multiplier: 1,
                           constant: 0).isActive = true
        NSLayoutConstraint(item: yellowView,
                           attribute: .centerX,
                           relatedBy: .equal,
                           toItem: blackView,
                           attribute: .centerX,
                           multiplier: 1,
                           constant: 0).isActive = true
        //right code with anchors
        //center x
        greenView.centerXAnchor.constraint(equalTo: blackView.centerXAnchor).isActive = true
        redView.centerXAnchor.constraint(equalTo: blackView.centerXAnchor).isActive = true
        //width
        redView.widthAnchor.constraint(equalToConstant:otherViewsHeight).isActive = true
        greenView.widthAnchor.constraint(equalToConstant: otherViewsHeight).isActive = true
        yellowView.widthAnchor.constraint(equalToConstant: otherViewsHeight).isActive = true
        
        
        blackView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: vflConstraintsVertical,
                                                                metrics: vflMetrics as [String : Any],
                                                                views: vflViews))
//        blackView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: vflRedConstraintsHorisontal,
//                                                                metrics: vflMetrics as [String : Any],
//                                                                views: vflViews))
//        blackView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: vflGreenConstraintsHorisontal,
//                                                                metrics: vflMetrics as [String : Any],
//                                                                views: vflViews))
//        blackView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: vflYellowConstraintsHorisontal,
//                                                                metrics: vflMetrics as [String : Any],
//                                                                views: vflViews))
    }
    
}
