//
//  WikiPediaPageModel.swift
//  WikiFillSumitApp
//
//  Created by Zappfresh on 02/01/20.
//  Copyright © 2020 demoApp. All rights reserved.
//

import UIKit
import Foundation

struct WikiPediaPageModel: Decodable {
    let batchcomplete: String
    let query: Query
    struct Query: Decodable {
        let pages: Pages
        struct Pages: Decodable {
            var randomId: RandomID?
            struct RandomID: Decodable {
                let pageid: Int64
                let ns: Int64
                let title: String
                let extract: String
            }
            init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                for key in container.allKeys {
                    randomId = try? container.decode(RandomID.self, forKey: key)
                }
                print(container.allKeys)
            }
            struct CodingKeys: CodingKey {
                var stringValue: String
                init?(stringValue: String) {
                    self.stringValue = stringValue
                }
                var intValue: Int?
                init?(intValue: Int) {
                    return nil
                }
            }
        }
    }
}
