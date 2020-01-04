//
//  DragInteraction.swift
//  Drag and Drop Example
//
//  Created by Agnieszka Patalas on 10.06.2017.
//  Copyright © 2017 Agnieszka Patalas. All rights reserved.
//

import UIKit

extension GameViewController: UIDragInteractionDelegate {
  
  func dragInteraction(_ interaction: UIDragInteraction, itemsForBeginning session: UIDragSession) -> [UIDragItem] {
    let location = session.location(in: view)
    guard let labelView = view.hitTest(location, with: nil) as? UILabel,
      let text = labelView.text as NSString? else { return [] }
    
    let itemProvider = NSItemProvider(object: text)
    let item = UIDragItem(itemProvider: itemProvider)
    item.localObject = labelView
    return [ item ]
  }
  
}
