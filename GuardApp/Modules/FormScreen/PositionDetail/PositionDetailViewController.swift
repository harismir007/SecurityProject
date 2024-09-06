//
//  PositionDetailViewController.swift
//  GuardApp
//
//  Created by FaniMalik on 11/06/1403 AP.
//

import UIKit

class PositionDetailViewController: UIViewController {
    let viewControllerFactory = ViewControllerFactory()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        if let navigationController = self.navigationController {
            let dashboardVC = self.viewControllerFactory.personalInformationViewController(navigationController: navigationController)
            navigationController.pushViewController(dashboardVC, animated:false)
        }
    }
    
    

}
