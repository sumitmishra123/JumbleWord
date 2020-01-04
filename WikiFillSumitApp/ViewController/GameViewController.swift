//
//  GameViewController.swift
//  WikiFillSumitApp
//
//  Created by Zappfresh on 02/01/20.
//  Copyright © 2020 demoApp. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet var paraCollectionView: UICollectionView!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var submitBtn: UIButton!
    @IBOutlet var fillInBlanksCollectionView: UICollectionView!
    @IBOutlet var topStack: UIStackView!
    @IBOutlet var hor2staack: UIStackView!
    @IBOutlet var hor1stack: UIStackView!
    
    var randomPageData: String?
    var arrayForData: [String]? = []
    var arrayForFillInBlankCollectionView: [String] = []
    var level: String? = "easy"
    var titleOfPage: String = ""
    var elementForStacks:[String] = []
    var labels = [UILabel]()
    var resultedArray: [String]? = []
    var correctAnswer: Int! = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        submitBtn.layer.cornerRadius = 12.0
        timeLabel.text = titleOfPage.uppercased()
        getDataForParagraph()
        registerNib()
        view.addInteraction(UIDropInteraction(delegate: self))
        refresh()
    }
    
    func getDataForParagraph(){
        arrayForData = randomPageData!.split{$0 == " "}.map(String.init)
        for index in 0..<35{
            arrayForFillInBlankCollectionView.insert(arrayForData![index], at: index)
        }
        
        switch level{
        case "easy":
            for i in 0..<19{
                if(i%5 == 0){
                    elementForStacks.append(arrayForFillInBlankCollectionView[i])
                    arrayForFillInBlankCollectionView[i] = ""
                }
                print(arrayForFillInBlankCollectionView[i])
            }
            break
        case "medium":
            for i in 0..<15{
                if(i%3 == 0){
                    elementForStacks.append(arrayForFillInBlankCollectionView[i])
                    arrayForFillInBlankCollectionView[i] = ""
                }
            }
            break
        case "hard":
            for i in 0..<16{
                if(i%2 == 0){
                    elementForStacks.append(arrayForFillInBlankCollectionView[i])
                    arrayForFillInBlankCollectionView[i] = ""
                }
            }
            break
        default:
            break
        }
    }
    
    func registerNib(){
        let nib = UINib(nibName: "WikiFillInBlanksCollectionViewCell", bundle: nil)
        paraCollectionView?.register(nib, forCellWithReuseIdentifier: "WikiFillInBlanksCollectionViewCell")
    }
    
    @IBAction func submitBtnClicked(_ sender: Any) {
            let nextView = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController
            nextView?.totalQue = elementForStacks.count
            nextView?.getResult = correctAnswer
            self.navigationController?.pushViewController(nextView!, animated: true)
    }
    
    
    //function to populate and check validated answer
    
      func shuffle() -> [String] {
        
        return elementForStacks.shuffled()
      }
      
      func cleanViews() {
        labels.removeAll()
        hor1stack.clean()
        hor2staack.clean()
      }

      @IBAction func refresh() {
        cleanViews()
        
        let shuffled = shuffle()
        for item in shuffled {
          let lbl = emojiLabel(item)
          lbl.isUserInteractionEnabled = true
          let dragInteraction = UIDragInteraction(delegate: self)
          dragInteraction.isEnabled = true
          lbl.addInteraction(dragInteraction)
          labels.append(lbl)
          
          let stack = shuffled.index(of: item)! % 2 == 0 ? hor1stack : hor2staack
          stack!.addArrangedSubview(lbl)
        }
      }
      
      func validate() {
        for i in 0..<resultedArray!.count {
            if(elementForStacks[i] == resultedArray![i]){
                correctAnswer += 1
            }
        }
        print(correctAnswer!)
      }
}
extension GameViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 0{
                return arrayForData!.count
        }else{
            return arrayForFillInBlankCollectionView.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView.tag {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WikiFillInBlanksCollectionViewCell", for: indexPath) as! WikiFillInBlanksCollectionViewCell
            cell.textLabel.text = arrayForData![indexPath.row]
            return cell
           
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FillCell", for: indexPath) as! FillCell
            if(arrayForFillInBlankCollectionView[indexPath.row] == ""){
                cell.backgroundColor = .red
                cell.text.text = "               "
                cell.contentView.tag = 1
                
            }else{
                let str = arrayForFillInBlankCollectionView[indexPath.row]
                cell.text.text = str
            }
            
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WikiFillInBlanksCollectionViewCell", for: indexPath) as! WikiFillInBlanksCollectionViewCell
            return cell
            
        }
    }
}

class FillCell: UICollectionViewCell{
    
    @IBOutlet var text: UILabel!
}


func emojiLabel(_ emoji: String) -> UILabel {
  let label = UILabel()
  label.font = label.font.withSize(35)
  label.text = emoji
  label.textAlignment = .center
  return label
}

extension UIView {
  func clean() {
    for view in subviews {
      view.removeFromSuperview()
    }
}
    
}
