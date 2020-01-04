//
//  LevelViewModel.swift
//  WikiFillSumitApp
//
//  Created by Zappfresh on 02/01/20.
//  Copyright © 2020 demoApp. All rights reserved.
//

import UIKit

class LevelViewModel: NSObject {
    
    var wikiPageRes:((String)->())?

    func getWikiRandomPage(pageTitle: String){
        ApiCall.getPageTitle(pageTitle,success: {
            data in
            let wikiPageModel = DataParser.parseWikiPageData(data!)
            let value:String = (wikiPageModel?.query.pages.randomId!.extract)!
            self.wikiPageRes!((value))
            print("Success")
        }) { (error, data, code)  in
            print("failure")
        }
    }
}

class DataParser{
    static func parseWikiPageData(_ data: Data) -> WikiPediaPageModel? {
      do {
        let wikiPediaPageModel = try JSONDecoder().decode(WikiPediaPageModel.self, from: data)
        print(wikiPediaPageModel)
        return wikiPediaPageModel
      } catch {
        print(error)
      }
      return nil
    }
}
