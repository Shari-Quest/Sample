//
//  UIView+Extension.swift
//  DaggableViews
//
//  Created by Sharvari H V on 14/06/19.
//  Copyright © 2019 Sharvari H V. All rights reserved.
//

import UIKit

extension UIView{
    
    func roundedView(){
        self.layer.cornerRadius = self.bounds.width / 2
        self.clipsToBounds = true
    }
    
}
