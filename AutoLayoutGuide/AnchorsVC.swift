//
//  AnchorsVC.swift
//  AutoLayoutGuide
//
//  Created by Влад Енбаев on 17.01.2023.
//

import UIKit

extension UIView{
    func makeCircle(){
        self.layer.cornerRadius = self.bounds.height / 2
    }
}
class AnchorsVC : ParentViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }
}

