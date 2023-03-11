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
    var pinkPuPuLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blackViewHeight = max(self.view.bounds.height, self.view.bounds.width) * 1/2
        blackViewWidth =  min(self.view.bounds.height, self.view.bounds.width) * 1/2
        
        otherViewsSeparator = 20
        otherViewsHeight = (blackViewHeight/3 - 2*otherViewsSeparator)
        
        createViews()
        layoutGreenView()
        layoutRedView()
        layoutYellowView()
        layoutBlackView()
        orientationCheck()
        
        pinkPuPuLabel = createPuPuLabel()
        self.view.addSubview(pinkPuPuLabel)
        pinkPuPuLabel.translatesAutoresizingMaskIntoConstraints = false
        pinkPuPuLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        pinkPuPuLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        pinkPuPuLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        pinkPuPuLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
    }
    
    override func viewDidLayoutSubviews() {
        orientationCheck()
    }
    
    
    //MARK: -Funcs
    func createViews(){
        let viewsArray = [redView, yellowView, greenView]
        let colorsArray : [UIColor] = [.systemRed, .systemYellow, .systemGreen]
        
        for (index, myView) in viewsArray.enumerated(){
            myView.translatesAutoresizingMaskIntoConstraints = false
            myView.backgroundColor = colorsArray[index]
            myView.layer.cornerRadius = otherViewsHeight / 2
            blackView.addSubview(myView)
        }
        blackView.backgroundColor = .black
        blackView.translatesAutoresizingMaskIntoConstraints = false
        blackView.layer.cornerRadius = 40
        //add gesture
        redView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        redView.addGestureRecognizer(tap)
        self.view.addSubview(blackView)
        
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        pinkPuPuLabel.isHidden = !pinkPuPuLabel.isHidden
    }
    
    func layoutBlackView(){
    }
    
    func layoutRedView(){
    }
    
    func layoutYellowView(){
    }
    
    func layoutGreenView(){
    }
    
    func createPuPuLabel() -> UILabel{
//        let label = UILabel()
//        label.text = "пупупу блин"
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textColor = .white
//        label.font = UIFont.systemFont(ofSize: 20)
//        label.textAlignment = .center
//        label.numberOfLines = 0
//        yellowView.addSubview(label)
//        label.centerXAnchor.constraint(equalTo: yellowView.centerXAnchor).isActive = true
//        label.centerYAnchor.constraint(equalTo: yellowView.centerYAnchor).isActive = true
//        label.widthAnchor.constraint(equalToConstant: otherViewsHeight - 10).isActive = true
//        label.heightAnchor.constraint(equalToConstant: otherViewsHeight - 10).isActive = true
        
        let pinkPuPuLabel = UILabel()
        pinkPuPuLabel.backgroundColor = .systemPink
        pinkPuPuLabel.textColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        pinkPuPuLabel.text = "пу пу пу \n блин"
        pinkPuPuLabel.font = UIFont.systemFont(ofSize: 70)
        pinkPuPuLabel.textAlignment = .center
        pinkPuPuLabel.numberOfLines = 0
        pinkPuPuLabel.isHidden = true
        //autolayout
        
        //add gesture
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.pupuTapped(label:)))
        pinkPuPuLabel.addGestureRecognizer(tap)
        tap.view?.translatesAutoresizingMaskIntoConstraints = false
        tap.view?.leftAnchor.constraint(equalTo: pinkPuPuLabel.leftAnchor).isActive = true
        tap.view?.rightAnchor.constraint(equalTo: pinkPuPuLabel.rightAnchor).isActive = true
        tap.view?.topAnchor.constraint(equalTo: pinkPuPuLabel.topAnchor).isActive = true
        tap.view?.bottomAnchor.constraint(equalTo: pinkPuPuLabel.topAnchor).isActive = true
        
        
        return pinkPuPuLabel
    }
    
    @objc func pupuTapped(label: UILabel?){
        pinkPuPuLabel.isHidden = !pinkPuPuLabel.isHidden
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
