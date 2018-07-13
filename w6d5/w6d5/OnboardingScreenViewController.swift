import UIKit

class OnboardingScreenViewController: UIViewController {
  
  let segueMainScreen = "segueMainScreen"
  
  // MARK: - IBActions
  @IBAction func dismissButtonTapped(_ sender: UIButton) {
    
    let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
    let nav = mainStoryBoard.instantiateInitialViewController() as! UINavigationController
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    UIView.transition(with: appDelegate.window!, duration: 1.0, options: .transitionCrossDissolve, animations: {
      appDelegate.window?.rootViewController = nav
    }, completion: nil)
  }
}

