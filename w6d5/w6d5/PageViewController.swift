import UIKit

class PageViewController: UIPageViewController {
  
  // MARK: - Private properties
  var onboardingScreens: [UIViewController]!
}

// MARK: - UIViewController methods
extension PageViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Get onboarding view controllers from storyboard
    guard let onboardingScreen1 = storyboard?.instantiateViewController(withIdentifier: "OnboardingScreen1"), let onboardingScreen2 = storyboard?.instantiateViewController(withIdentifier: "OnboardingScreen2"), let onboardingScreen3 = storyboard?.instantiateViewController(withIdentifier: "OnboardingScreen3") else {
      assertionFailure("Unable to instantiate onboarding screens from storyboard.")
      return
    }
    
    // Populate onboarding screens array
    onboardingScreens = [onboardingScreen1, onboardingScreen2, onboardingScreen3]
    
    // Set ourselves us data source for UIPageViewController
    self.dataSource = self
    
    // Load up the first view controller for page view controller
    setViewControllers([onboardingScreen1], direction: .forward, animated: false, completion: nil)
    
  }
}

// MARK: - UIPageViewControllerDataSource methods
extension PageViewController: UIPageViewControllerDataSource {
  
  // Go Back
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    
    var previousViewController: UIViewController? = nil
    
    if let index = onboardingScreens.index(of: viewController), index > 0 {
      previousViewController = onboardingScreens[index-1]
    }
    
    return previousViewController
  }
  
  // Go Forward
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    
    var nextViewController: UIViewController? = nil
    
    if let index = onboardingScreens.index(of: viewController), index <= onboardingScreens.count - 2 {
      nextViewController = onboardingScreens[index+1]
    }
    
    return nextViewController
  }
}
