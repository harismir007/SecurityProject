//
//  CustomButton.swift
//  GuardApp
//
//  Created by Akhlaq Hussain on 30/07/2024.
//

import UIKit

class CustomButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    private func setupButton() {
        backgroundColor = UIColor.appPrimaryColor
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = frame.height / 2
        layer.borderColor = UIColor.appPrimaryColor.cgColor
        clipsToBounds = true
    }
}
