import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        Parse.setApplicationId("oV8t4RX0Csjlyg4XlbFKYIWWs5FdYTdg9nLEDlEJ", clientKey: "pKxoFzJMssXXKHOMeUf42zgpArdTBBg4hBZCcyTZ")
        
        PFFacebookUtils.initializeFacebookWithApplicationLaunchOptions(launchOptions ?? [NSObject: AnyObject]())

        
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        let containerViewController = ContainerViewController()
        
        window!.rootViewController = containerViewController
        window!.makeKeyAndVisible()
        
        PFFacebookUtils.initializeFacebookWithApplicationLaunchOptions(launchOptions ?? [NSObject: AnyObject]())
        
        return true
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
    }
    
}

