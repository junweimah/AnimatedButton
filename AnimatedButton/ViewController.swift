//
//  ViewController.swift
//  AnimatedButton
//
//  Created by Tandem on 31/05/2018.
//  Copyright © 2018 Tandem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customButton: EMSpinnerButton!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var button2: CustomButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.layer.borderWidth = 1
        button.layer.borderColor = self.view.tintColor.cgColor
        button.setTitleColor(self.view.tintColor, for: .normal)
        button.layer.cornerRadius = button.frame.height / 2
        
        button2.layer.borderWidth = 1
        button2.layer.borderColor = self.view.tintColor.cgColor
        button2.setTitleColor(self.view.tintColor, for: .normal)
        button2.layer.cornerRadius = button.frame.height / 2
        
        customButton.gradientColors = [UIColor.cyan.cgColor, UIColor.emLightBlue.cgColor]
    }

    @IBAction func btnClicked(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5) {
            sender.setTitle("", for: .normal)
            let animaton = CABasicAnimation(keyPath: "bounds.size.width")
            animaton.fromValue = self.button.frame.width
            animaton.toValue =  self.button.frame.height
            animaton.duration = 0.3
            animaton.fillMode = kCAFillModeForwards
            animaton.isRemovedOnCompletion = false
            
            sender.layer.add(animaton, forKey: animaton.keyPath)
        }
    }
    
    @IBAction func btn2Clicked(_ sender: CustomButton) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            sender.showLoading()
        }) { (completion) in
//            UIView.animate(withDuration: 0.5, delay: 2, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
//                sender.hideLoading()
//                sender.setTitle("Done", for: .normal)
//            }) { (completion) in
//
//            }
        }
    }
    
    @IBAction func customButtonClicked(_ sender: EMSpinnerButton) {
        sender.animationDuration = 0.3
        sender.animate(animation: .collapse)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            print("back to defaults")
            sender.backToDefaults()
        }
        
    }
    
}

