//
//  ViewController.swift
//  circular-view
//
//  Created by Ravi Joshi on 1/21/18.
//  Copyright © 2018 Ravi Joshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let ccView = CircularView()
        ccView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(ccView)
        
        let slider = UIView()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.backgroundColor = .green
        slider.layer.cornerRadius = 10
        self.view.addSubview(slider)
        
        let viewsDictionary = ["ccView": ccView, "slider" : slider]
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[slider(==20)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-40-[slider(==20)]", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary))
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[ccView]-20-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-40-[ccView]-40-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary))
        
        self.view.backgroundColor = UIColor.purple
    }
}
