//
//  CustomTextField.swift
//  GuardApp
//
//  Created by Akhlaq Hussain on 30/07/2024.
//

import Foundation
import UIKit

open class CustomTextField: UITextField {
    private lazy var inputFormatter: InputFormatter = {
        return InputFormatter()
    }()
    
    private lazy var sideView: SideView = {
        return SideView()
    }()
    
    open override func awakeFromNib() {
        NotificationCenter.default.addObserver(self, selector: #selector(textDidBeginEditing), name: UITextField.textDidBeginEditingNotification, object: self)
        
        NotificationCenter.default.addObserver(self, selector: #selector(textDidEndEditing), name: UITextField.textDidEndEditingNotification, object: self)
        //Set left and righ padding
        self.leftViewMode = .always
        self.rightViewMode = .always
        self.leftView = leftView ?? createDefaultSideView()
        self.rightView = rightView ?? createDefaultSideView()
        self.font = UIFont.textFieldFont
        //self.tintColor = .appPrimaryColor
        self.tintColor = .appTextColor
        self.borderWidth = 1
        isActive ? setActive() : setInactive()
        if backgroundColor == nil || backgroundColor == .clear {
            self.backgroundColor = UIColor.white
        }
        adjustPlaceholderColor()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        self.borderStyle = .none
//        layer.shadowColor = UIColor.darkGray.cgColor
//        layer.shadowRadius = 3
//        layer.shadowOpacity = 1
//        layer.shadowOffset = CGSize(width: 3, height: 3)
        clipsToBounds = false
        layer.masksToBounds = false
        superview?.layer.masksToBounds = false
    }
    
    private func adjustPlaceholderColor() {
        guard let placeholder else { return }
        let attributedPlaceholder = NSMutableAttributedString(string: placeholder)
        attributedPlaceholder.addAttribute(.foregroundColor, value: UIColor.appTextFieldPlaceholderColor, range: NSRange(location: 0, length: placeholder.count))
        self.attributedPlaceholder = attributedPlaceholder
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}

extension CustomTextField {
    private struct TextFieldState {
        static var active: Bool = false
    }
    
    @IBInspectable var activeByDefault: Bool {
        set {
            isActive = newValue
        } get {
            isActive
        }
    }
    
    @objc enum TextFieldFocus: Int {
        case active
        case inactive
    }
    
    @IBInspectable var defaultStatus: TextFieldFocus {
        set {
            TextFieldState.active = newValue == .active ? true : false
        } get {
            TextFieldState.active ? .active : .inactive
        }
    }
    
    var isActive: Bool {
        set {
            TextFieldState.active = newValue
            newValue ? setActive() : setInactive()
        } get {
            TextFieldState.active
        }
    }
    
    @objc private func textDidBeginEditing(_ sender: Notification) {
        setActive()
    }
    
    @objc private func textDidEndEditing(_ sender: Notification) {
        setInactive()
    }
    
    func setActive() {
        layer.borderColor = UIColor.appPrimaryColor.cgColor
    }
    
    func setInactive() {
        layer.borderColor = UIColor.gray.cgColor
    }
}

// AccessoryView
extension CustomTextField {
    @objc private func defaultSideViewTapped() {
        becomeFirstResponder()
    }
    
    private struct SideViewConstants {
        static var defaultPadding: CGFloat = 15
        static var sideViewHeight: CGFloat = 20
        static var sideViewWidth: CGFloat = 20
    }
    
    private struct SideView {
        var leftViewAction: ((UIImageView) -> ())?
        var rightViewAction: ((UIImageView) -> ())?
        
        var leftImage: UIImage?
        var rightImage: UIImage?
    }
    
    var onLeftViewTap: ((UIImageView) -> ())? {
        set {
            sideView.leftViewAction = newValue
        } get {
            return sideView.leftViewAction
        }
    }
    
    var onRightViewTap: ((UIImageView) -> ())? {
        set {
            sideView.rightViewAction = newValue
        } get {
            return sideView.rightViewAction
        }
    }
    
    @IBInspectable var leftViewImage: UIImage? {
        set {
            sideView.leftImage = newValue
            let imageView = createSideView(withImage: newValue)
            imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onLeftViewTap(_:))))
            setLeftView(imageView, padding: SideViewConstants.defaultPadding)
        } get {
            return sideView.leftImage
        }
    }
    
    @IBInspectable var rightViewImage: UIImage? {
        set {
            sideView.rightImage = newValue
            let imageView = createSideView(withImage: newValue)
            imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onRightViewTap(_:))))
            setRightView(imageView, padding: SideViewConstants.defaultPadding)
        } get {
            return sideView.rightImage
        }
    }
    
    @objc private func onLeftViewTap(_ sender: UIImageView) {
        onLeftViewTap?(sender)
    }
    
    @objc private func onRightViewTap(_ sender: UIImageView) {
        onRightViewTap?(sender)
    }
    
    private func createSideView(withImage image: UIImage?) -> UIImageView {
        let imageView = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: SideViewConstants.sideViewWidth, height: SideViewConstants.sideViewHeight)))
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.isUserInteractionEnabled = true
        return imageView
    }
    
    private func createDefaultSideView() -> UIView {
        let emptyView = UIView(frame: CGRect(x: 0, y: 0, width: SideViewConstants.defaultPadding, height: frame.height))
        emptyView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(defaultSideViewTapped)))
        return emptyView
    }
}

//MARK: Masking
extension CustomTextField {
    private struct InputFormatter {
        var format: String?
        
        func format(_ textField: UITextField) {
            guard let format else { return }
            textField.text = textField.text?.formatted(with: format)
        }
    }
    
    @IBInspectable var inputFormat: String? {
        set {
            inputFormatter.format = newValue
            self.addTarget(self, action: #selector(onTextChange), for: .editingChanged)
        } get {
            return inputFormatter.format
        }
    }
    
    @objc private func onTextChange() {
        guard inputFormatter.format != nil else { return }
        inputFormatter.format(self)
    }
}

extension UITextField {
    func setLeftView(_ view: UIView, padding: CGFloat) {
        view.translatesAutoresizingMaskIntoConstraints = true
        
        let outerView = UIView()
        outerView.translatesAutoresizingMaskIntoConstraints = false
        outerView.addSubview(view)
        
        outerView.frame = CGRect(
            origin: .zero,
            size: CGSize(
                width: view.frame.size.width + (padding * 2),
                height: view.frame.size.height
            )
        )
        
        view.center = outerView.center
        
        leftView = outerView
    }
    
    func setRightView(_ view: UIView, padding: CGFloat) {
        view.translatesAutoresizingMaskIntoConstraints = true
        
        let outerView = UIView()
        outerView.translatesAutoresizingMaskIntoConstraints = false
        outerView.addSubview(view)
        
        outerView.frame = CGRect(
            origin: .zero,
            size: CGSize(
                width: view.frame.width + (padding * 2),
                height: view.frame.height
            )
        )
        
        view.center = outerView.center
        
        rightView = outerView
    }
}

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    func setRoundedBorder(cornerRadius: Double = 6, color: UIColor, borderWidth: Double = 1) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = borderWidth
//        self.layer.masksToBounds = true
    }
}

extension String {
    
    var isNotEmpty: Bool {
        !isEmpty
    }
    
    private struct Mask {
        static let allowedFormats = [
            "X": "[^0-9]",                      // Digits Only
            "C": "[^a-zA-Z]",                   // Characters Only
            "A": "[^0-9a-zA-Z]",                // Alphanumeric
            "E": "[^A-Z0-9a-z@._-]",            // Input format for Email
            "S": "[^a-zA-Z' -]",                // Alphabets with space,' and -
            "N": "[^a-zA-Z ]",                  // Alphabets with space, use for name input
            "*": "^(?=.*[a-zA-Z])[^a-zA-Z]+$"   // Any input
        ]
        
        static func getCurrentFormat(_ format: String) -> (isValid: Bool, regex: String?) {
            var isValid = true
            var regex: String?
            if let allowedFormat = allowedFormats.first(where: { element in
                element.key == "\(format.first(where: { allowedFormats.keys.contains("\($0)") }) ?? "0")"
            }) {
                regex = allowedFormat.value
                for disallowedFormat in allowedFormats.filter({ $0 != allowedFormat }) {
                    if format.contains(disallowedFormat.key) {
                        isValid = false
                    }
                }
            } else {
                isValid = false
            }
            return (isValid, regex)
        }
    }
    
    func formatted(with format: String) -> String? {
        guard format.isNotEmpty else { return nil }
        let currentFormat = Mask.getCurrentFormat(format)
        guard currentFormat.isValid else {
            debugPrint("Invalid input format \(format)")
            return nil
        }
        let stringToMonitor = replacingOccurrences(of: currentFormat.regex ?? "", with: "", options: .regularExpression)
        var result = ""
        var index = stringToMonitor.startIndex
        for ch in format where index < stringToMonitor.endIndex {
            if Mask.allowedFormats.keys.contains(ch.uppercased()) {
                result.append(stringToMonitor[index])
                index = stringToMonitor.index(after: index)
            } else {
                result.append(ch)
            }
        }
        return result
    }
}

extension UILabel {
    func addAttributes(on text: String, attributes: [NSAttributedString.Key: Any]) {
        guard let selfText = self.text else {
            self.attributedText = nil
            return
        }
        let attributedString = NSMutableAttributedString(attributedString: attributedText ?? NSAttributedString(string: selfText))
        let range = (selfText as NSString).range(of: text)
        attributedString.addAttributes(attributes, range: range)
        self.attributedText = attributedString
    }
}
