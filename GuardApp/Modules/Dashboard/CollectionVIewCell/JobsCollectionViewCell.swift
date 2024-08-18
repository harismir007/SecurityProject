//
//  JobsCollectionViewCell.swift
//  GuardApp
//
//  Created by Akhlaq Hussain on 31/07/2024.
//

import UIKit

class JobsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var bgView: UIView!{
        didSet {
            bgView.layer.cornerRadius = 15
            bgView.clipsToBounds = true
        }
    }
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var jobDescriptionLabel: UILabel!
    @IBOutlet weak var jobTimingLabel: UILabel!
    
    
    @IBOutlet weak var viewJobButton: UIButton!{
        didSet {
            viewJobButton.layer.backgroundColor = UIColor.clear.cgColor
            viewJobButton.layer.borderColor = UIColor.gray.cgColor
        }
    }
    @IBOutlet weak var checkInButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

extension JobsCollectionViewCell: CellUpdating {
    func update(_ data: CellData) {
        let item = data as? JobsCollectionViewCellItem
        self.jobTitleLabel.text = item?.jobTitle
        self.jobDescriptionLabel.text = item?.jobLocation
        self.jobTimingLabel.text = item?.jobTiming
    }
}
