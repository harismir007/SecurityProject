//
//  SplashViewController.swift
//  GuardApp
//
//  Created by FaniMalik on 03/06/1403 AP.
//

import UIKit

class SplashViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    let viewControllerFactory = ViewControllerFactory()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBar.progress = 0.0
        
        // Start the progress bar animation
        startProgressBar()
    }
    
    func startProgressBar() {
        // Duration in seconds
        let duration: TimeInterval = 2.5
        let interval: TimeInterval = 0.1
        let step = Float(interval / duration)
        
        var currentProgress: Float = 0.0
        
        Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { timer in
            if currentProgress < 1.0 {
                currentProgress += step
                self.progressBar.setProgress(currentProgress, animated: true)
            } else {
                timer.invalidate() // Stop the timer when the progress reaches 1.0
                if let navigationController = self.navigationController {
                    let loginVC = self.viewControllerFactory.loginViewController(navigationController: navigationController)
                    navigationController.pushViewController(loginVC, animated: true)
                }

            }
        }
        
        
    }
    
}
