//
//  ViewController.swift
//  CustomViewsTutorial
//
//  Created by James Rochabrun on 5/3/17.
//  Copyright © 2017 James Rochabrun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var riddleImageView: UIImageView = {
        let iv = UIImageView(frame: CGRect(x: (self.view.frame.size.width - 300) / 2, y: (self.view.frame.size.height - 300) / 2, width: 300, height: 300))
        iv.image = #imageLiteral(resourceName: "car")
        iv.isUserInteractionEnabled = true
        return iv
    }()
    
    lazy var targetView: TargetView = {
        let iv = TargetView(frame: CGRect(x: 0, y: 0, width: self.riddleImageView.frame.size.width, height: self.riddleImageView.frame.size.height))
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpViews()
    }
    
    private func setUpViews() {
        view.addSubview(riddleImageView)
        riddleImageView.addSubview(targetView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}











