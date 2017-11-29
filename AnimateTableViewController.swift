//
//  AnimateTableViewController.swift
//  AnimateTable
//
//  Created by Trần Vũ Hưng on 11/29/17.
//  Copyright © 2017 Tran Vu Hung. All rights reserved.
//

import UIKit

private struct Storyboard {
  static let CellIdentifier = "AnimateTableCell"
  static let SegueIdentifier = "ShowAnimateTableViewController"
}
class AnimateTableViewController: UITableViewController {
  var tableData = ["Người đua diều", "Trai nước nam làm gì", "Đúng việc", "Nhà giả kim", "Mùa thu của cây dương", "Khu vườn mùa hạ", "Ngàn mặt trời rực rỡ", "Totto chan bên cửa sổ", "Ông trăm tuổi trèo qua cửa sổ và biến mất", "Chiến binh cầu vồng", "Ngày mai", "That was easier than you thought? Right?"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    UIApplication.shared.isStatusBarHidden = true
    view.backgroundColor = UIColor.black
    tableView.separatorStyle = UITableViewCellSeparatorStyle.none
    tableView.tableFooterView = UIView(frame: CGRect.zero)
    tableView.register(AnimateTableViewCell.self, forCellReuseIdentifier: Storyboard.CellIdentifier)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    //super.viewWillAppear(animated)
    animateTable()
  }
  
  func animateTable(){
    tableView.reloadData()
    let cells = tableView.visibleCells
    let tableHeight = tableView.bounds.size.height
    
    for (index, cell) in cells.enumerated() {
      cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
      UIView.animate(withDuration: 1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0.0, options: [], animations: {
        cell.transform = CGAffineTransform(translationX: 0, y: 0)
      }, completion: nil)
    }
  }
  
  func colorForIndex(index: Int) -> UIColor {
    let itemCount = tableData.count - 1
    let color = CGFloat(index) / CGFloat(itemCount) * 0.6
    return UIColor(red: 1.0, green: color, blue: 0.0, alpha: 1.0)
  }
  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
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
  
  override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    cell.backgroundColor = colorForIndex(index: indexPath.row)
  }
}
