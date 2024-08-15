//
//  TableViewDelegate.swift
//  GuardApp
//
//  Created by Akhlaq Hussain on 31/07/2024.
//

import UIKit

class TableViewDelegate: NSObject, UITableViewDataSource {
    
    var tableView: UITableView
    
    init(tableView: UITableView) {
        self.tableView = tableView
    }
    
    var cellModels: [any TableCellModel] = [] {
        didSet {
            cellModels.forEach { model in
                tableView.register(UINib(nibName: model.identifier, bundle: nil), forCellReuseIdentifier: model.identifier)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellModels.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = cellModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.identifier, for: indexPath)
        let cellUpdating = cell as! CellUpdating
        cellUpdating.update(cellModel.data)
        cell.selectionStyle = .none
        return cell
    }
}

extension TableViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellModel = cellModels[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        cellModel.didSelect?(cellModel.data)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellModels[indexPath.row].height
    }
}
