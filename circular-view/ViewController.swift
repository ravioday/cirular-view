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
        
        let viewsDictionary = ["ccView": ccView]
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-20-[ccView]-20-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-40-[ccView]-40-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: viewsDictionary))
        
        self.view.backgroundColor = UIColor.purple
    }
}
