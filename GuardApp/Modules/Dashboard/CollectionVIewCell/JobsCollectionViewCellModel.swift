//
//  JobsCollectionViewCellModel.swift
//  GuardApp
//
//  Created by Akhlaq Hussain on 31/07/2024.
//

import Foundation

struct JobsCollectionViewCellModel: CollectionCellModel {
    var identifier = "JobsCollectionViewCell"
    var width: Double
    var height: Double
    var data: CellData
    var didSelect: ((CellData) -> Void)?
}

struct JobsCollectionViewCellItem {
    var jobTitle: String
    var jobLocation: String
    var jobTiming: String
}

extension JobsCollectionViewCellItem: CellData {}
