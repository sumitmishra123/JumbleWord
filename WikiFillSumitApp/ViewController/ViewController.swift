//
//  ViewController.swift
//  WikiFillSumitApp
//
//  Created by Zappfresh on 30/12/19.
//  Copyright © 2019 demoApp. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    
    @IBOutlet var playbtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.isUserInteractionEnabled = false
    }
    @IBAction func onClickPlayBtn(_ sender: Any) {
    }
}

