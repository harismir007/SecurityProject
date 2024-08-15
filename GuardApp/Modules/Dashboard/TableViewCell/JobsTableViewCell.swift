//
//  JobsTableViewCell.swift
//  GuardApp
//
//  Created by Akhlaq Hussain on 31/07/2024.
//

import UIKit

class JobsTableViewCell: UITableViewCell {
    //MARK: - Outlets
    @IBOutlet weak var bgView: UIView!{
        didSet {
            bgView.layer.borderColor = UIColor.gray.cgColor
            bgView.layer.cornerRadius = 15
            bgView.clipsToBounds = true
        }
    }
    ///Labels
    @IBOutlet weak var jobTitleLabel: UILabel!
    @IBOutlet weak var jobLocationLabel: UILabel!
    @IBOutlet weak var jobTimingLabel: UILabel!

    ///ImageViews
    @IBOutlet weak var locationIcon: UIImageView!
    @IBOutlet weak var clockIcon: UIImageView!
    
    ///Buttons
    @IBOutlet weak var viewJobButton: UIButton!{
        didSet {
            viewJobButton.layer.cornerRadius = viewJobButton.frame.height/2
        }
    }
    
    @IBOutlet weak var checkInButton: CustomButton!{
        didSet {
            checkInButton.layer.cornerRadius = checkInButton.frame.height/2
            checkInButton.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var timingStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension JobsTableViewCell: CellUpdating {
    func update(_ data: CellData) {
        let item = data as? JobsTableViewCellItem
        self.jobTitleLabel.text = item?.jobTitle
        self.jobLocationLabel.text = item?.jobLocation
        self.checkInButton.isHidden = item?.hideCheckInButton ?? false
        self.locationIcon.isHidden = item?.hideIcons ?? false
        self.clockIcon.isHidden = item?.hideIcons ?? false
        self.timingStackView.isHidden = item?.hideTimingStack ?? false
    }
}
