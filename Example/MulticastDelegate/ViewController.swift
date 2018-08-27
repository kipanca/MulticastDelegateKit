//
//  ViewController.swift
//  MulticastDelegate
//
//  Created by Alex Kisel on 08/27/2018.
//  Copyright (c) 2018 Alex Kisel. All rights reserved.
//

import UIKit
import MulticastDelegate

class ViewController: UIViewController {
  @IBOutlet weak var tableView: MultidelegateTableView!
  let tableViewDelegateListener = TableViewDelegateListener()
  
  // MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.multiDelegate.add(delegate: tableViewDelegateListener)
    tableView.multiDelegate.add(delegate: self)
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    print("ViewController: (tableView: heightForRowAt:)")
    return 90 // returned value will be used as row height because ViewController implements responsableForSelectors() method
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = String(indexPath.row)
    return cell
  }
}

extension ViewController: MulticastableDelegate {
  func responsableForSelectors() -> [String]? {
    return [#selector(tableView(_:heightForRowAt:)).description]
  }
}
