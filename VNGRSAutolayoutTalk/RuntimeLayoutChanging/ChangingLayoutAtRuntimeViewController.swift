//
//  ChangingLayoutAtRuntimeViewController.swift
//  VNGRSAutolayoutTalk
//
//  Created by Olgu Sırman on 12.07.2018.
//  Copyright © 2018 Olgu Sırman. All rights reserved.
//

import UIKit

final class ChangingLayoutAtRuntimeViewController: UIViewController {

    @IBOutlet private var warppingView: UIView!
    @IBOutlet private var edgeConstraint: NSLayoutConstraint! //Mana's label top constraint
    
    private var zeroHeightConstraint : NSLayoutConstraint!
    
    // Genel olarak yapılan view'in height ını sıƒırlarken view lerin içindeki hiyerarşi yüzünden layout hatası almamak istememiz.
    
    @IBAction func toggleDistanceControls(_ sender: Any) {
        
        // Set first constant value is 0
        if zeroHeightConstraint == nil {
            zeroHeightConstraint = warppingView.heightAnchor.constraint(equalToConstant: 0)
        }
        
        // And change the isActive property
        let shouldShow = !edgeConstraint.isActive
        
        if shouldShow {
            zeroHeightConstraint.isActive = false
            edgeConstraint.isActive = true
        }else{
            edgeConstraint.isActive = false
            zeroHeightConstraint.isActive = true
        }
        
        // Set layout again
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
    }
    
}
