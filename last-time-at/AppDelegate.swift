import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        if let w = window {
            let mainVC = EntryListViewController()
            let navController = UINavigationController(rootViewController: mainVC)
            w.rootViewController = navController

            let entryStore = EntryStore()
            mainVC.entryStore = entryStore

            w.makeKeyAndVisible()
        }

        return true
    }
}
