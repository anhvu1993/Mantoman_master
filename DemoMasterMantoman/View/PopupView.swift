//
//  PopupView.swift
//  DemoMasterMantoman
//
//  Created by Anh vũ on 5/14/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit

class PopupView: UIView {
    
    weak var selectbutton: Button?
    @IBOutlet weak var neckView: UIView!
    
    @IBOutlet weak var coverButton: UIButton!
    
    @IBAction func clickCoverButton(_ sender: Any) {
       isOpen = false
        
    }
    var isOpen: Bool! = false {
        didSet {
            coverButton.alpha = isOpen ? 0.6 : 0
            if !isOpen {
                self.removeFromSuperview()
                selectbutton?.isSelected = false
            }
        }
    }
    
    func layoutNeckView(_ button: Button) {
        isOpen = true
        neckView.frame = CGRect(x: button.frame.minX + 4, y: 0, width: button.frame.width, height: 20)
        selectbutton =  button
        
    }
    
}
