//
//  AddressHistoryViewController.swift
//  GuardApp
//
//  Created by FaniMalik on 11/06/1403 AP.
//

import UIKit

class AddressHistoryViewController: UIViewController {
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
            let dashboardVC = self.viewControllerFactory.rightToWorkViewController(navigationController: navigationController)
            navigationController.pushViewController(dashboardVC, animated: false)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
