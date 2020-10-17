//
//  BaseViewController.swift
//  TheMovie
//
//  Created by Erlanda mansaku on 11.10.20.
//  Copyright © 2020 Erlanda mansaku. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = ColorDesign.darkGrayColor
        self.navigationController?.navigationBar.barStyle = .black
        
    }
}
