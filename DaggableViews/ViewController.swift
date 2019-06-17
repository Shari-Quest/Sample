//
//  ViewController.swift
//  DaggableViews
//
//  Created by Sharvari H V on 14/06/19.
//  Copyright © 2019 Sharvari H V. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var vwFirstView: UIView!
    
    @IBOutlet weak var vwSecondView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        vwFirstView.roundedView()
        vwSecondView.roundedView()
        
        // adding pan gesture reconginzer to the views
        let panGestureRecognizer1 = UIPanGestureRecognizer(target: self, action: #selector(viewDragged))
        vwFirstView.addGestureRecognizer(panGestureRecognizer1)
        
        let panGestureRecognizer2 = UIPanGestureRecognizer(target: self, action: #selector(viewDragged))
        vwSecondView.addGestureRecognizer(panGestureRecognizer2)
     
    }
    
    
    // Mark : Updating view
    @objc func viewDragged(_ sender: UIPanGestureRecognizer){
        let translation = sender.translation(in: self.view)
        if let viewDragged = sender.view{
            viewDragged.center = CGPoint(x: viewDragged.center.x + translation.x, y: viewDragged.center.y + translation.y)
            sender.setTranslation(CGPoint(x: 0, y: 0), in: viewDragged)
            let distance = didTouch()

            if distance < 100{
                vwFirstView.removeFromSuperview() // removing first view when it comes in contact with the second
            }
        }
    }
    
    // Mark : Calculating distance between the view's center
    
    func didTouch() -> CGFloat{
        if let firstView = vwFirstView , let secondView = vwSecondView{
            let xPoint = firstView.center.x - secondView.center.x
            let yPoint = firstView.center.y - secondView.center.y
            return sqrt((xPoint) * (xPoint) + (yPoint) * (yPoint))
        }
        
        return 100
    }
    
}

