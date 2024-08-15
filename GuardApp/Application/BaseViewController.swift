//
//  ViewController.swift
//  GuardApp
//
//  Created by Akhlaq Hussain on 30/07/2024.
//

import UIKit

class BaseViewController: UIViewController {
    
    var orignalTitle: String?
    
    fileprivate lazy var transparentView: UIView = {
        let transparent = UIView(frame: UIScreen.main.bounds)
        transparent.backgroundColor = .clear
        transparent.tintColor = .clear
        return transparent
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        orignalTitle = self.title
        setupNavigationBarUI()
    }
    
    func blockUI() {
        if let window = UIApplication.shared.keyWindow {
            window.addSubview(transparentView)
        }
    }
    
    func unblockUI() {
        transparentView.removeFromSuperview()
    }
    
    func setupNavigationBar(leftButtons: [BadgedButton], rightButtons: [BadgedButton], titleImage: UIImage?) {
        let leftButtonsView = UIView(frame: CGRect(x: 0, y: 0, width: 40*leftButtons.count - 5 , height: 44))
        var xOffset = 0.0
        for button in leftButtons {
            button.frame = CGRect(x: xOffset, y: 4, width: 35, height: 35)
            leftButtonsView.addSubview(button)
            xOffset += 40
        }
        let leftButtonsItem = UIBarButtonItem(customView: leftButtonsView)
        self.navigationItem.leftBarButtonItem = leftButtonsItem
        
        let rightButtonsView = UIView(frame: CGRect(x: 0, y: 0, width: 40*rightButtons.count - 5 , height: 44))
        xOffset = 0.0
        for button in rightButtons {
            button.frame = CGRect(x: xOffset, y: 4, width: 35, height: 35)
            rightButtonsView.addSubview(button)
            xOffset += 40
        }
        let rightButtonsItem = UIBarButtonItem(customView: rightButtonsView)
        self.navigationItem.rightBarButtonItem = rightButtonsItem
        
        if let titleImage {
            let buttonsUsedWidth = leftButtonsView.frame.width + rightButtonsView.frame.width
            let remainingWidth = self.view.bounds.width - buttonsUsedWidth
            let titleImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: remainingWidth, height: 17))
            titleImageView.contentMode = .scaleAspectFit
            titleImageView.image = titleImage
            self.navigationItem.titleView = titleImageView
        }
    }
    
    fileprivate func setupNavigationBarUI() {
        let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithTransparentBackground()
            navigationBarAppearance.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor : UIColor.appTextColor,
                NSAttributedString.Key.font: UIFont.buttonFont
            ]
        let backButtonInsets = UIEdgeInsets(top: 0, left: 12, bottom: 3, right: 0)
        let backImage = UIImage(systemName: "arrow.backward")?.imageWithInsets(insets: backButtonInsets)
        navigationBarAppearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)
        let titleOffset = UIOffset(horizontal: -CGFloat.greatestFiniteMagnitude, vertical: 0)
        navigationBarAppearance.titlePositionAdjustment = titleOffset
        navigationBarAppearance.backgroundColor = UIColor.white
        UINavigationBar.appearance().tintColor = .appTextColor
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().compactAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }
    
    
    func showBottomBar() {
        tabBarController?.tabBar.isHidden = false
    }
    func setActivityIndicatorInNavigationBar(activityIndicator : UIActivityIndicatorView) {
//        activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.hidesWhenStopped = true
        // Create a UIBarButtonItem with the activity indicator as a custom view
        let barButtonItem = UIBarButtonItem(customView: activityIndicator)
        
        // Set the UIBarButtonItem to the right side of the navigation bar
        self.navigationItem.rightBarButtonItem = barButtonItem
    }
    func setRightButtonInNavigationBar(button: UIButton, image: String){
        let image = UIImage(named: image)
        button.setImage(image, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 35, height: 35)
        let rightBarButtonItem = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
    }
    
    func setLeftButtonInNavigationBar(button: UIButton, image: UIImage?) {
        button.setImage(image, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 17, height: 14)
        let leftBarButtonItem = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func presentInFullScreen(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)? = nil) {
        if let tabBarController {
            tabBarController.present(viewController, animated: animated, completion: completion)
        } else if let navigationController {
            navigationController.present(viewController, animated: animated, completion: completion)
        } else {
            self.present(viewController, animated: animated, completion: completion)
        }
    }
}

protocol ViewModelConfigurable {
    func setViewModel(_ viewModel: Any?)
}
