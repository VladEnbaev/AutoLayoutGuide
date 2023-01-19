//
//  AnchorsVC.swift
//  AutoLayoutGuide
//
//  Created by Влад Енбаев on 17.01.2023.
//

import UIKit


class AnchorsVC : ParentViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func layoutBlackView() {
        blackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        blackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        blackView.heightAnchor.constraint(equalToConstant: blackViewHeight).isActive = true
        blackView.widthAnchor.constraint(equalToConstant: blackViewWidth).isActive = true
    }
    
    override func layoutYellowView() {
        yellowView.centerXAnchor.constraint(equalTo: blackView.centerXAnchor).isActive = true
        yellowView.centerYAnchor.constraint(equalTo: blackView.centerYAnchor).isActive = true
        yellowView.heightAnchor.constraint(equalToConstant: otherViewsHeight).isActive = true
        yellowView.widthAnchor.constraint(equalToConstant: otherViewsHeight).isActive = true
    }
    
    override func layoutRedView() {
        redView.centerXAnchor.constraint(equalTo: yellowView.centerXAnchor).isActive = true
        redView.bottomAnchor.constraint(equalTo: yellowView.topAnchor, constant: -otherViewsSeparator).isActive = true
        redView.heightAnchor.constraint(equalToConstant: otherViewsHeight).isActive = true
        redView.widthAnchor.constraint(equalToConstant: otherViewsHeight).isActive = true
    }
    
    override func layoutGreenView() {
        greenView.centerXAnchor.constraint(equalTo: yellowView.centerXAnchor).isActive = true
        greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: otherViewsSeparator).isActive = true
        greenView.heightAnchor.constraint(equalToConstant: otherViewsHeight).isActive = true
        greenView.widthAnchor.constraint(equalToConstant: otherViewsHeight).isActive = true
    }
}

