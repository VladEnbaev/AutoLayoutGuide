//
//  StackViewVC.swift
//  AutoLayoutGuide
//
//  Created by Влад Енбаев on 17.01.2023.
//

import UIKit

class StackViewVC : UIViewController{
    
    var stackView : UIStackView!
    
    var (blackView, redView, yellowView, greenView) = (UIView(), UIView(), UIView(), UIView())
    
    var blackViewHeight : CGFloat!
    var blackViewWidth : CGFloat!
    var otherViewsHeight : CGFloat!
    var otherViewsSeparator : CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        blackViewHeight = max(self.view.bounds.height, self.view.bounds.width) * 2/4
        blackViewWidth =  min(self.view.bounds.height, self.view.bounds.width) * 2/4
        
        otherViewsSeparator = 20
        otherViewsHeight = (blackViewHeight/3 - 2*otherViewsSeparator)
        
        stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = otherViewsSeparator
        
        createViews()
        
        layoutBlackView()
        layoutStackView()
        layoutGreenView()
        layoutRedView()
        layoutYellowView()
        
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
            myView.layer.cornerRadius = otherViewsHeight / 2
            stackView.addArrangedSubview(myView)
            
        }
        blackView.backgroundColor = .black
        blackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        blackView.layer.cornerRadius = 40
        blackView.addSubview(stackView)
        self.view.addSubview(blackView)
    }
    
    func layoutBlackView() {
        blackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        blackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        blackView.heightAnchor.constraint(equalToConstant: blackViewHeight).isActive = true
        blackView.widthAnchor.constraint(equalToConstant: blackViewWidth).isActive = true
    }
    
    func layoutStackView(){
        stackView.centerXAnchor.constraint(equalTo: blackView.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: blackView.centerYAnchor).isActive = true
    }
    
    func layoutRedView() {
        redView.heightAnchor.constraint(equalToConstant: otherViewsHeight).isActive = true
    }
    
    func layoutGreenView() {
        greenView.heightAnchor.constraint(equalToConstant: otherViewsHeight).isActive = true
    }
    
    func layoutYellowView() {
        yellowView.heightAnchor.constraint(equalToConstant: otherViewsHeight).isActive = true
        yellowView.widthAnchor.constraint(equalToConstant: otherViewsHeight).isActive = true
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
