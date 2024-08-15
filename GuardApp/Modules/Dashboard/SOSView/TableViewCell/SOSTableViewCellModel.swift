//
//  SOSTableViewCellModel.swift
//  GuardApp
//
//  Created by Akhlaq Hussain on 04/08/2024.
//

import Foundation
import UIKit

struct SOSTableViewCellModel: TableCellModel {
    var didSelect: ((CellData) -> Void)?
    var identifier = "SOSTableViewCell"
    var height: CGFloat = UITableView.automaticDimension
    var data: CellData
}

struct SOSTableViewCellItem {
    var sosTitle: String
    var sosNumber: String
}

extension SOSTableViewCellItem: CellData {}
