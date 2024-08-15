//
//  Fonts.swift
//  GuardApp
//
//  Created by Akhlaq Hussain on 30/07/2024.
//

import UIKit

fileprivate enum FontName: String {
    case InterBlack = "Inter-Black"
    case InterBold = "Inter-Bold"
    case InterExtraBold = "Inter-ExtraBold"
    case InterExtraLight = "Inter-ExtraLight"
    case InterLight = "Inter-Light"
    case InterMedium = "Inter-Medium"
    case InterRegular = "Inter-Regular"
    case InterSemiBold = "Inter-SemiBold"
    case InterThin = "Inter-Thin"
    case PoppinsMedium = "Poppins-Medium"
}

extension UIFont {
    static var welcomeTextFont: UIFont {
        return UIFont(name: FontName.InterSemiBold.rawValue, size: 24)!
    }
    
    static var textFieldFont: UIFont {
        return UIFont(name: FontName.InterRegular.rawValue, size: 14)!
    }
    
    static var buttonFont: UIFont {
        return UIFont(name: FontName.InterSemiBold.rawValue, size: 16)!
    }
}
