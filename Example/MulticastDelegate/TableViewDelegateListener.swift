//
//  TableViewDelegateListener.swift
//  Multidelegate
//
//  Created by Alex Kisel on 8/27/18.
//  Copyright © 2018 BRANDER. All rights reserved.
//

import UIKit

class TableViewDelegateListener: NSObject {
  
}

extension TableViewDelegateListener: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    print("TableViewDelegateListener: (tableView: heightForRowAt:)")
    return 1200 // returned value ignores because TableViewDelegateListener doesn't returns selector string description (tableView: heightForRowAt:) in responsableForSelectors() method of MulticastableDelegate protocol.
  }
}
