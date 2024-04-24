//
//  ViewController.swift
//  StackView
//
//  Created by Karun Aggarwal on 23/04/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageviewTop: UIImageView!
    @IBOutlet weak var shadowView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageviewTop.layer.cornerRadius = 20
        imageviewTop.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        shadowView.clipsToBounds = true
        shadowView.layer.cornerRadius = 10
        shadowView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        let shadowLayer = CALayer()
        shadowLayer.frame = CGRect(x: 0, y: -1, width: shadowView.frame.width, height: 1)
        shadowLayer.backgroundColor = UIColor.lightGray.cgColor
        shadowLayer.shadowRadius = 3.0
        shadowLayer.shadowOpacity = 1
        shadowLayer.shadowOffset = CGSize(width: 0, height: -2.5)
        
        shadowView.layer.addSublayer(shadowLayer)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }

}

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        } set {
            self.layer.cornerRadius = newValue
        }
    }
}
