//
//  CellModel.swift
//  GuardApp
//
//  Created by Akhlaq Hussain on 31/07/2024.
//

import Foundation
protocol TableCellModel {
    var identifier: String { get }
    var height: CGFloat { get }
    var data: CellData { get }
    var didSelect: ((CellData) -> Void)? { get }
}

protocol CellData {
    
}

protocol CellUpdating {
    func update(_ data: CellData)
}
