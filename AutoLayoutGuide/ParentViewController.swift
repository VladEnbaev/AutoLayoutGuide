//
//  ParentViewController.swift
//  AutoLayoutGuide
//
//  Created by Влад Енбаев on 17.01.2023.
//

import UIKit

class ParentViewController: UIViewController {
    
    var (blackView, redView, yellowView, greenView) = (UIView(), UIView(), UIView(), UIView())
    
    var blackViewHeight : CGFloat!
    var blackViewWidth : CGFloat!
    var otherViewsHeight : CGFloat!
    var otherViewsSeparator : CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blackViewHeight = max(self.view.bounds.height, self.view.bounds.width) * 2/4
        blackViewWidth =  min(self.view.bounds.height, self.view.bounds.width) * 2/4
        
        otherViewsSeparator = 20
        
        otherViewsHeight = (blackViewHeight/3 - 2*otherViewsSeparator)
        
        createViews()
        layoutGreenView()
        layoutRedView()
        layoutYellowView()
        layoutBlackView()
        orientationCheck()
    }
    
    override func viewDidLayoutSubviews() {
        orientationCheck()
    }
    
    func createViews(){
        let viewsArray = [redView, yellowView, greenView]
        let colorsArray : [UIColor] = [.systemRed, .systemYellow, .systemGreen]
        
        for (index, myView) in viewsArray.enumerated(){
            myView.translatesAutoresizingMaskIntoConstraints = false
            myView.backgroundColor = colorsArray[index]
            blackView.addSubview(myView)
        }
        blackView.backgroundColor = .black
        blackView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(blackView)
    }
    
    func layoutBlackView(){
    }
    
    func layoutRedView(){
    }
    
    func layoutYellowView(){
    }
    
    func layoutGreenView(){
    }
    
    func orientationCheck(){
        if UIDevice.current.orientation.isLandscape{
            view.backgroundColor = blackView.backgroundColor
            tabBarController?.tabBar.isHidden = true
        } else {
            view.backgroundColor = .white
            tabBarController?.tabBar.isHidden = false
        }
    }
}
