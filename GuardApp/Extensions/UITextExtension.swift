//
//  UITextExtension.swift
//  GuardApp
//
//  Created by Akhlaq Hussain on 01/08/2024.
//

import Combine
import UIKit

extension UITextInput {
    var textPublisher: AnyPublisher<String?, Never> {
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self).map { Notification in
            let textField = Notification.object as! UITextField
            return textField.text
        }.eraseToAnyPublisher()
    }
    
    var didEndTextChangePublisher: AnyPublisher<String?, Never> {
        NotificationCenter.default.publisher(for: UITextField.textDidEndEditingNotification, object: self).map { Notification in
            let textField = Notification.object as! UITextField
            return textField.text
        }.eraseToAnyPublisher()
    }
    
    var didChangeTextPublisher: AnyPublisher<String?, Never> {
        NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self).map { Notification in
            let textField = Notification.object as! UITextField
            return textField.text
        }.eraseToAnyPublisher()
    }
}
