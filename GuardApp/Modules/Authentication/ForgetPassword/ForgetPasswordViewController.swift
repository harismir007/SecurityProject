//
//  ForgetPasswordViewController.swift
//  GuardApp
//
//  Created by Akhlaq Hussain on 01/08/2024.
//

import UIKit
import Combine

class ForgetPasswordViewController: UIViewController {
    //MARK: - Properties
    var viewModel: ForgetPasswordViewModel!
    let viewControllerFactory = ViewControllerFactory()
    private var subscribers: Set<AnyCancellable> = []
    
    
    
    //MARK: - View Call
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
    }
}
