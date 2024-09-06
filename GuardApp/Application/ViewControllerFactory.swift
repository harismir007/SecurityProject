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
    
    static var splash: UIStoryboard = UIStoryboard(name: "SplashScreen", bundle: Bundle.main)
    static var form: UIStoryboard = UIStoryboard(name: "FormStoryboard", bundle: Bundle.main)


}

protocol ViewControllerFactoryProtocol {
    //MARK: - Authentication
    func signUpViewController(navigationController: UINavigationController) -> SignUpViewController
    func loginViewController(navigationController: UINavigationController) -> LoginViewController
    func forgetPasswordViewController(navigationController: UINavigationController) -> ForgetPasswordViewController
    func otpViewController(navigationController: UINavigationController) -> OTPViewController
    
    //MARK: - Dashboard
    func tabBarViewController(navigationController: UINavigationController) -> TabBarViewController 
    func dashboardViewController(navigationController: UINavigationController) -> DashboardViewController
    func jobsViewController(navigationController: UINavigationController) -> JobsViewController
    func assignJobsViewController(navigationController: UINavigationController) -> AssignJobsViewController
    func sosViewController(navigationController: UINavigationController) -> SOSViewController
    func jobsDetailViewController(navigationController: UINavigationController) -> JobsDetailViewController
    
}

class ViewControllerFactory: ViewControllerFactoryProtocol {
    
    //MARK: - SplashScreen
    func splashViewController(navigationController: UINavigationController) -> SplashViewController {
        let viewController = Storyboard.splash.instantiateViewController(identifier: SplashViewController.storyboardIdentifier) as! SplashViewController
        viewController.title = "Splash"
        return viewController
    }

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
    
    func otpViewController(navigationController: UINavigationController) -> OTPViewController {
        let viewController = Storyboard.authentication.instantiateViewController(identifier: OTPViewController.storyboardIdentifier) as! OTPViewController
        //viewController.viewModel = ForgetPasswordViewModel()
        viewController.title = "OTP"
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
    
//MARK: - Forms
    
    func positionDetailViewController(navigationController: UINavigationController) -> PositionDetailViewController {
        let viewController = Storyboard.form.instantiateViewController(identifier: PositionDetailViewController.storyboardIdentifier) as! PositionDetailViewController
        return viewController
    }
    
    func personalInformationViewController(navigationController: UINavigationController) -> PersonalInformationViewController {
        let viewController = Storyboard.form.instantiateViewController(identifier: PersonalInformationViewController.storyboardIdentifier) as! PersonalInformationViewController
        return viewController
    }

    func addressHistoryViewController(navigationController: UINavigationController) -> AddressHistoryViewController {
        let viewController = Storyboard.form.instantiateViewController(identifier: AddressHistoryViewController.storyboardIdentifier) as! AddressHistoryViewController
        return viewController
    }
    
    func rightToWorkViewController(navigationController: UINavigationController) -> RightToWorkViewController {
        let viewController = Storyboard.form.instantiateViewController(identifier: RightToWorkViewController.storyboardIdentifier) as! RightToWorkViewController
        return viewController
    }
    
    func nextofKinViewController(navigationController: UINavigationController) -> ConsentedNextOfKinViewController {
        let viewController = Storyboard.form.instantiateViewController(identifier: ConsentedNextOfKinViewController.storyboardIdentifier) as! ConsentedNextOfKinViewController
        return viewController
    }

    func characterReferencesViewController(navigationController: UINavigationController) -> CharacterReferencesViewController {
        let viewController = Storyboard.form.instantiateViewController(identifier: CharacterReferencesViewController.storyboardIdentifier) as! CharacterReferencesViewController
        return viewController
    }
    
    func employmentHistoryViewController(navigationController: UINavigationController) -> EmploymentHistoryViewController {
        let viewController = Storyboard.form.instantiateViewController(identifier: EmploymentHistoryViewController.storyboardIdentifier) as! EmploymentHistoryViewController
        return viewController
    }
    
    func eductionViewController(navigationController: UINavigationController) -> AddEductionViewController {
        let viewController = Storyboard.form.instantiateViewController(identifier: AddEductionViewController.storyboardIdentifier) as! AddEductionViewController
        return viewController
    }

    func otherQualificationViewController(navigationController: UINavigationController) -> OthersQualificationsViewController {
        let viewController = Storyboard.form.instantiateViewController(identifier: OthersQualificationsViewController.storyboardIdentifier) as! OthersQualificationsViewController
        return viewController
    }

    func siaLicenceInformationViewController(navigationController: UINavigationController) -> SIALicenceInformationViewController {
        let viewController = Storyboard.form.instantiateViewController(identifier: SIALicenceInformationViewController.storyboardIdentifier) as! SIALicenceInformationViewController
        return viewController
    }

    func languageSkillsViewController(navigationController: UINavigationController) -> LanguageSkillsViewController {
        let viewController = Storyboard.form.instantiateViewController(identifier: LanguageSkillsViewController.storyboardIdentifier) as! LanguageSkillsViewController
        return viewController
    }
    func additionalInformationViewController(navigationController: UINavigationController) -> AdditionalInformationViewController {
        let viewController = Storyboard.form.instantiateViewController(identifier: AdditionalInformationViewController.storyboardIdentifier) as! AdditionalInformationViewController
        return viewController
    }
    func drivingViewController(navigationController: UINavigationController) -> DrivingViewController {
        let viewController = Storyboard.form.instantiateViewController(identifier: DrivingViewController.storyboardIdentifier) as! DrivingViewController
        return viewController
    }

    func medicalInformationViewController(navigationController: UINavigationController) -> MedicalInformationViewController {
        let viewController = Storyboard.form.instantiateViewController(identifier: MedicalInformationViewController.storyboardIdentifier) as! MedicalInformationViewController
        return viewController
    }

    func criminalRecordViewController(navigationController: UINavigationController) -> CriminalRecordViewController {
        let viewController = Storyboard.form.instantiateViewController(identifier: CriminalRecordViewController.storyboardIdentifier) as! CriminalRecordViewController
        return viewController
    }
    func declarationsViewController(navigationController: UINavigationController) -> DeclarationsViewController {
        let viewController = Storyboard.form.instantiateViewController(identifier: DeclarationsViewController.storyboardIdentifier) as! DeclarationsViewController
        return viewController
    }



}
