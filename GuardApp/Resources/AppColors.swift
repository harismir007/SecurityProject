//
//  AppColors.swift
//  GuardApp
//
//  Created by Akhlaq Hussain on 30/07/2024.
//

import Foundation
import UIKit

fileprivate enum AppColor: String {
    case appPrimaryColor = "AppPrimaryColor"
    case appTextColor = "AppTextColor"
    case appTextFieldPlaceholderColor = "AppTextFieldPlaceholderColor"
    case appBorderColor = "AppBorderColor"
}

extension UIColor {
    static var appPrimaryColor: UIColor {
        return UIColor(named: AppColor.appPrimaryColor.rawValue)!
    }
    static var appTextColor: UIColor {
        return UIColor(named: AppColor.appTextColor.rawValue)!
    }
    static var appTextFieldPlaceholderColor: UIColor {
        return UIColor(named: AppColor.appTextFieldPlaceholderColor.rawValue)!
    }
    static var appBorderColor: UIColor {
        return UIColor(named: AppColor.appBorderColor.rawValue)!
    }
}

extension UIColor {
    public convenience init?(rgbaHex: String) {
        let r, g, b, a: CGFloat
        if rgbaHex.hasPrefix("#") {
            let start = rgbaHex.index(rgbaHex.startIndex, offsetBy: 1)
            var hexColor = String(rgbaHex[start...])
            if hexColor.count == 6 {
                hexColor = "\(hexColor)FF"
            }
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        return nil
    }
    
    func hexString() -> String {
        let components = self.cgColor.components
        let r: CGFloat = components?[0] ?? 0.0
        let g: CGFloat = components?[1] ?? 0.0
        let b: CGFloat = components?[2] ?? 0.0

        let hexString = String.init(format: "#%02lX%02lX%02lX", lroundf(Float(r * 255)), lroundf(Float(g * 255)), lroundf(Float(b * 255)))
        return hexString
     }
}
