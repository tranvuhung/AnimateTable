//
//  TableViewController.swift
//  AnimateTable
//
//  Created by Trần Vũ Hưng on 11/29/17.
//  Copyright © 2017 Tran Vu Hung. All rights reserved.
//

import UIKit

private struct Storyboard {
  static let CellIdentifier = "TableViewCell"
  static let SegueIdentifier = "ShowAnimateTableViewController"
}

class TableViewController: UITableViewController {
  var tableData = ["Personal Life", "Rimoka Nguyen", "Cukkoo Nguyen", "Hien Nguyen", "Ngoc Nguyen", "Thuy Nguyen", "Phieu Dieu" ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    UIApplication.shared.isStatusBarHidden = true
    view.backgroundColor = UIColor.black
    tableView.separatorStyle = UITableViewCellSeparatorStyle.none
    tableView.tableFooterView = UIView(frame: CGRect.zero)
    tableView.register(TableViewCell.self, forCellReuseIdentifier: Storyboard.CellIdentifier)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    //super.viewWillAppear(animated)
    animateTable()
  }
  
  func animateTable(){
    tableView.reloadData()
    let cells = tableView.visibleCells
    let tableHeight = tableView.bounds.size.height
    var index = 0
    for cell in cells {
      let cell: UITableViewCell = cell as UITableViewCell
      cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
      
      UIView.animate(withDuration: 1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0.0, options: [], animations: { 
        cell.transform = CGAffineTransform(translationX: 0, y: 0)
      }, completion: nil)
      
      index += 1
    }
  }
  
  func colorForIndex(index: Int) -> UIColor {
    let itemCount = tableData.count - 1
    let color = CGFloat(index) / CGFloat(itemCount) * 0.6
    return UIColor(red: color, green: 0.0, blue: 1.0, alpha: 1.0)
  }
  
  //MARK: - TableView Data source
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return tableData.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.CellIdentifier, for: indexPath)
    cell.textLabel?.text = tableData[indexPath.row]
    cell.textLabel?.textColor = UIColor.white
    cell.textLabel?.backgroundColor = UIColor.clear
    cell.textLabel?.font = UIFont(name: "Avenir Next", size: 18)
    cell.selectionStyle = UITableViewCellSelectionStyle.none
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: Storyboard.SegueIdentifier, sender: nil)
  }
  
  override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    cell.backgroundColor = colorForIndex(index: indexPath.row)
  }
}
