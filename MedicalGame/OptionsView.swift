//
//  OptionsView.swift
//  MedicalGame
//
//  Created by TIMMY KONNEUS on 08/04/17.
//  Copyright © 2017 StickyBit. All rights reserved.
//

import UIKit

@IBDesignable class OptionsView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        
        didSet{
            
            self.layer.cornerRadius = cornerRadius
        }
    }

}
