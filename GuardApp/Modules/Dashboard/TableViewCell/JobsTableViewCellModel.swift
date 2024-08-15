//
//  JobsTableViewCellModel.swift
//  GuardApp
//
//  Created by Akhlaq Hussain on 31/07/2024.
//

import UIKit

struct JobsTableViewCellModel: TableCellModel {
    var didSelect: ((CellData) -> Void)?
    var identifier = "JobsTableViewCell"
    var height: CGFloat = UITableView.automaticDimension
    var data: CellData
}

struct JobsTableViewCellItem {
    var jobTitle: String
    var jobLocation: String
    var hideIcons: Bool
    var hideCheckInButton: Bool
    var hideTimingStack: Bool
}

extension JobsTableViewCellItem: CellData {}
