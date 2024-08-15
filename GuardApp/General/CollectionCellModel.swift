//
//  CollectionCellModel.swift
//  GuardApp
//
//  Created by Akhlaq Hussain on 31/07/2024.
//

import Foundation

protocol CollectionCellModel {
    var identifier: String { get }
    var width: Double { get }
    var height: Double { get }
    var data: CellData { get }
    var didSelect: ((CellData) -> Void)? { get }
}
