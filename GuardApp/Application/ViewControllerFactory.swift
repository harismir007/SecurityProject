//
//  ViewControllerFactory.swift
//  GuardApp
//
//  Created by Akhlaq Hussain on 30/07/2024.
//

import UIKit

struct Storyboard {
    static var authentication: UIStoryboard = UIStoryboard(name: "Authentication", bundle: Bundle.main)
    static var dashboard = UIStoryboard(name: "Dashboard", bundle: Bundle.main)
}

protocol ViewControllerFactoryProtocol {
    //MARK: - Authentication
    func signUpViewController(navigationController: UINavigationController) -> SignUpViewController
    func loginViewController(navigationController: UINavigationController) -> LoginViewController
    func forgetPasswordViewController(navigationController: UINavigationController) -> ForgetPasswordViewController
    //MARK: - Dashboard
    func tabBarViewController(navigationController: UINavigationController) -> TabBarViewController 
    func dashboardViewController(navigationController: UINavigationController) -> DashboardViewController
    func jobsViewController(navigationController: UINavigationController) -> JobsViewController
    func assignJobsViewController(navigationController: UINavigationController) -> AssignJobsViewController
    func sosViewController(navigationController: UINavigationController) -> SOSViewController
    func jobsDetailViewController(navigationController: UINavigationController) -> JobsDetailViewController
    
}

class ViewControllerFactory: ViewControllerFactoryProtocol {
    
    //MARK: - Authentication
    func signUpViewController(navigationController: UINavigationController) -> SignUpViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: SignUpViewController.storyboardIdentifier) as! SignUpViewController
        viewController.viewModel = SignUpViewModel()
        viewController.title = "Create Account"
        return viewController
    }
    
    func loginViewController(navigationController: UINavigationController) -> LoginViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: LoginViewController.storyboardIdentifier) as! LoginViewController
        viewController.viewModel = LoginViewModel()
        viewController.title = "Login Account"
        return viewController
    }
    
    func forgetPasswordViewController(navigationController: UINavigationController) -> ForgetPasswordViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: ForgetPasswordViewController.storyboardIdentifier) as! ForgetPasswordViewController
        viewController.viewModel = ForgetPasswordViewModel()
        viewController.title = "Forget Password"
        return viewController
    }
    
    //MARK: - Dashboard
    
    func tabBarViewController(navigationController: UINavigationController) -> TabBarViewController {
        let viewController = Storyboard.dashboard.instantiateViewController(identifier: TabBarViewController.storyboardIdentifier) as! TabBarViewController
        return viewController
    }
    
    func dashboardViewController(navigationController: UINavigationController) -> DashboardViewController {
        let viewController = Storyboard.dashboard.instantiateViewController(identifier: DashboardViewController.storyboardIdentifier) as! DashboardViewController
        viewController.viewModel = DashboardViewModel()
        //        viewController.title = "Login Account"
        return viewController
    }
    
    func jobsViewController(navigationController: UINavigationController) -> JobsViewController {
        let viewController = Storyboard.dashboard.instantiateViewController(identifier: JobsViewController.storyboardIdentifier) as! JobsViewController
        viewController.viewModel = JobsViewModel()
        viewController.title = "All Jobs"
        return viewController
    }
    
    func assignJobsViewController(navigationController: UINavigationController) -> AssignJobsViewController {
        let viewController = Storyboard.dashboard.instantiateViewController(identifier: AssignJobsViewController.storyboardIdentifier) as! AssignJobsViewController
        viewController.viewModel = AssignJobsViewModel()
        viewController.title = "Assign Jobs"
        return viewController
    }
    
    func sosViewController(navigationController: UINavigationController) -> SOSViewController {
        let viewController = Storyboard.dashboard.instantiateViewController(identifier: SOSViewController.storyboardIdentifier) as! SOSViewController
        viewController.viewModel = SOSViewModel()
        viewController.title = "SOS"
        return viewController
    }
    
    func jobsDetailViewController(navigationController: UINavigationController) -> JobsDetailViewController {
        let viewController = Storyboard.dashboard.instantiateViewController(identifier: JobsDetailViewController.storyboardIdentifier) as! JobsDetailViewController
        viewController.viewModel = JobsDetailViewModel()
        viewController.title = "Jobs Details"
        return viewController
    }
}
