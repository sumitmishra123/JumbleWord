//
//  LevelViewController.swift
//  WikiFillSumitApp
//
//  Created by Zappfresh on 02/01/20.
//  Copyright © 2020 demoApp. All rights reserved.
//

import UIKit

class LevelViewController: UIViewController {

    @IBOutlet var easyBtn: UIButton!
    @IBOutlet var mediumBtn: UIButton!
    @IBOutlet var hardBtn: UIButton!
    
    lazy var viewModel: LevelViewModel = {
        return LevelViewModel()
    }()
    var titleOfPage: String?
    var gameLevel: String?
    var randomPageTitle: [String] = ["lion","ios","paper","cow","company","life","honey","friends","star","toast"]
    override func viewDidLoad() {
        super.viewDidLoad()
        initVM()
        changeProperty()

    }
    
    func changeProperty(){
        easyBtn.layer.cornerRadius = 12.0
        mediumBtn.layer.cornerRadius = 12.0
        hardBtn.layer.cornerRadius = 12.0
    }
    
    
    func initVM(){
        viewModel.wikiPageRes = { success in
            self.gotoGamePage(info: success)
        }
    }
    
    func gotoGamePage(info: String){
        let nextView = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "GameViewController") as? GameViewController
        nextView?.randomPageData = info
        nextView?.level = gameLevel
        nextView?.titleOfPage = titleOfPage!
        self.navigationController?.pushViewController(nextView!, animated: true)
    }
    
    @IBAction func gotoGameBtn(_ sender: Any) {
        let randomPage:String = self.randomPageTitle.randomElement()!
        if((sender as AnyObject).tag == 0 ){
            gameLevel = "easy"
        }else if((sender as AnyObject).tag == 1){
            gameLevel = "medium"
        }else{
            gameLevel = "hard"
        }
        titleOfPage = randomPage
        viewModel.getWikiRandomPage(pageTitle: randomPage)
    }
    
}
