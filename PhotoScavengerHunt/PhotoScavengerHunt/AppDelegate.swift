
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UITableViewCell.appearance().tintColor = UIColor(hue: 0.1222, saturation: 1, brightness: 1, alpha: 1.0)
        UIButton.appearance().tintColor = UIColor(hue: 0.2722, saturation: 0.47, brightness: 0.67, alpha: 1.0)
        UIButton.appearance().setTitleColor(.black, for: .normal)
        UITableView.appearance().backgroundColor = UIColor(hue: 0.1667, saturation: 0.05, brightness: 1, alpha: 1.0)
        
        UILabel.appearance().font = UIFont(name: "Thonburi-Light", size: 15)
        let attrs = [
//            NSAttributedString.Key.foregroundColor: UIColor.red,
            NSAttributedString.Key.font: UIFont(name: "Thonburi-Light", size: 24)!
        ]

        UINavigationBar.appearance().titleTextAttributes = attrs
        UIBarButtonItem.appearance().setTitleTextAttributes(attrs, for: .normal)
       
       
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

