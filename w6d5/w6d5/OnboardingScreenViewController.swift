import UIKit

class OnboardingScreenViewController: UIViewController {
  
  let segueMainScreen = "segueMainScreen"
  
  // MARK: - IBActions
  @IBAction func dismissButtonTapped(_ sender: UIButton) {
    performSegue(withIdentifier: segueMainScreen, sender: self)
  }
}

