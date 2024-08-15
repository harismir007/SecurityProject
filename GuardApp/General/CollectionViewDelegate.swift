//
//  CollectionViewDelegate.swift
//  GuardApp
//
//  Created by Akhlaq Hussain on 31/07/2024.
//

import UIKit

class CollectionViewDelegate: NSObject {
    let collectionView: UICollectionView
    let didScrollToPosition:  ((IndexPath) -> Void)?
    init(collectionView: UICollectionView, didScrollToPosition: ((IndexPath) -> Void)? = nil) {
        self.collectionView = collectionView
        self.didScrollToPosition = didScrollToPosition
    }
    
    var cellModels: [any CollectionCellModel] = [] {
        didSet {
            cellModels.forEach { model in
                collectionView.register(UINib(nibName: model.identifier, bundle: nil), forCellWithReuseIdentifier: model.identifier)
            }
        }
    }
}

extension CollectionViewDelegate: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellModel = cellModels[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellModel.identifier, for: indexPath)
        let cellUpdating = cell as! CellUpdating
        cellUpdating.update(cellModel.data)
        return cell
    }
}

extension CollectionViewDelegate: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellModel = cellModels[indexPath.row]
        return CGSize(width: cellModel.width, height: cellModel.height)
    }
}

extension CollectionViewDelegate: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cellModel = cellModels[indexPath.row]
        cellModel.didSelect?(cellModel.data)
    }
}

extension CollectionViewDelegate: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let didScrollToPosition = didScrollToPosition else { return }
        let minCell = collectionView.visibleCells.min { cell, nextCell in
            guard let row = collectionView.indexPath(for: cell)?.row else { return false }
            guard let nextRow = collectionView.indexPath(for: nextCell)?.row else { return false }
            
            return row < nextRow
        }
        if let minCell, let indexPath = collectionView.indexPath(for: minCell) {
            didScrollToPosition(indexPath)
        }
    }
}
