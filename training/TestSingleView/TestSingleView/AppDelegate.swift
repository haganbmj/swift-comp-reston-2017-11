import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func applicationDidFinishLaunching(_ application: UIApplication) {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.magenta
        window?.makeKeyAndVisible()

        window?.rootViewController = CoolViewController()

//        let controller = CoolViewController()
//        if let backgroundView = controller.view {
//            window?.addSubview(backgroundView)
//        }
    }

}
