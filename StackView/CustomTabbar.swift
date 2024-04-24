//
//  CustomTabbar.swift
//  StackView
//
//  Created by Karun Aggarwal on 24/04/24.
//

import UIKit

class CustomTabBar: UITabBar {
    
    // MARK: - Variables
    public var didTapButton: (() -> ())?

    public lazy var middleView: UIControl! = {
       let control = UIControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.backgroundColor = UIColor(named: "lightBlue")
        control.cornerRadius = 35
        addSubview(control)
        
        control.widthAnchor.constraint(equalToConstant: 70).isActive = true
        control.heightAnchor.constraint(equalTo: control.widthAnchor).isActive = true
        
        
        let imageview = UIImageView(image: UIImage(named: "new_order"))
        imageview.translatesAutoresizingMaskIntoConstraints = false
        
        control.addSubview(imageview)
        
        imageview.centerYAnchor.constraint(equalTo: control.centerYAnchor).isActive = true
        imageview.centerXAnchor.constraint(equalTo: control.centerXAnchor).isActive = true
        
        let label = UILabel()
        label.text = "New Order"
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 9)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        control.addSubview(label)
        
        label.centerXAnchor.constraint(equalTo: imageview.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: imageview.bottomAnchor).isActive = true
        
        control.addTarget(self, action: #selector(self.middleButtonAction), for: .touchUpInside)
        
        return control
    }()
    
    // MARK: - View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 0.4
        self.layer.masksToBounds = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        middleView.center = CGPoint(x: frame.width / 2, y: 10)
    }
    
    // MARK: - Actions
    @objc func middleButtonAction(sender: UIButton) {
        didTapButton?()
    }
    
    // MARK: - HitTest
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard !clipsToBounds && !isHidden && alpha > 0 else { return nil }
        return self.middleView.frame.contains(point) ? self.middleView : super.hitTest(point, with: event)
    }
}
