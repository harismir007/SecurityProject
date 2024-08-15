//
//  SOSTableViewCell.swift
//  GuardApp
//
//  Created by Akhlaq Hussain on 04/08/2024.
//

import UIKit

class SOSTableViewCell: UITableViewCell {
    @IBOutlet weak var bgView: UIView!{
        didSet {
            bgView.layer.borderColor = UIColor.gray.cgColor
            bgView.layer.cornerRadius = 15
            bgView.clipsToBounds = true
        }
    }
    ///Labels
    @IBOutlet weak var sosTitleLabel: UILabel!
    @IBOutlet weak var sosNumberLabel: UILabel!
    ///Button
    @IBOutlet weak var callButton: UIButton!{
        didSet {
            callButton.layer.cornerRadius = callButton.frame.height/2
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
extension SOSTableViewCell: CellUpdating {
    func update(_ data: CellData) {
        let item = data as? SOSTableViewCellItem
        self.sosTitleLabel.text = item?.sosTitle
        self.sosNumberLabel.text = item?.sosNumber
    }
}
