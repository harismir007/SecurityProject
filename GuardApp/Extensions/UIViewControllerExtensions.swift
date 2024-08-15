//
//  UIViewControllerExtensions.swift
//  GuardApp
//
//  Created by Akhlaq Hussain on 03/08/2024.
//

import UIKit

extension UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    func screen() -> UIScreen? {
        var parent = self.parent
        var lastParent = parent
        while parent != nil {
            lastParent = parent
            parent = parent!.parent
        }
        return lastParent?.view.window?.windowScene?.screen
    }
}
