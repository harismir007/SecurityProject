//
//  ConsentedNextOfKinViewController.swift
//  GuardApp
//
//  Created by FaniMalik on 11/06/1403 AP.
//

import UIKit

class ConsentedNextOfKinViewController: UIViewController {
    
    let viewControllerFactory = ViewControllerFactory()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: false)
    }

    @IBAction func nextBtn(_ sender: Any) {
        if let navigationController = self.navigationController {
            let dashboardVC = self.viewControllerFactory.characterReferencesViewController(navigationController: navigationController)
            navigationController.pushViewController(dashboardVC, animated: false)
        }

    }
}
