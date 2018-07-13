import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  let wasLaunchedKey = "wasLaunched"
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow()
    let wasLaunched = UserDefaults.standard.bool(forKey: wasLaunchedKey)
    if wasLaunched {
      loadMainApp()
    } else {
      loadOnboarding()
    }
    window?.makeKeyAndVisible()
    return true
  }
  
  private func loadMainApp() {
    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let nav = mainStoryboard.instantiateInitialViewController() as! UINavigationController
    window?.rootViewController = nav
  }
  
  private func loadOnboarding() {
    UserDefaults.standard.set(true, forKey: wasLaunchedKey)
    let mainStoryboard = UIStoryboard(name: "Page", bundle: nil)
    let page = mainStoryboard.instantiateInitialViewController() as! PageViewController
    window?.rootViewController = page
  }
}

