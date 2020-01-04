//
//  ResultViewController.swift
//  WikiFillSumitApp
//
//  Created by Zappfresh on 04/01/20.
//  Copyright © 2020 demoApp. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var playAgain: UIButton!
    @IBOutlet var resultLabel: UILabel!
    
    var getResult: Int!
    var totalQue: Int!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Result"
        playAgain.layer.cornerRadius = 12.0
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.isUserInteractionEnabled = false
        calculateResult()
    }
    func calculateResult(){
        var totalPer = (getResult*100)/totalQue
        resultLabel.text = "\(totalPer)" + " %"
    }
}
