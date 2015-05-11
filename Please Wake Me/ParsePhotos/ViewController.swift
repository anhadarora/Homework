import UIKit

class ViewController: UIViewController {

    @IBAction func getStarted(sender: AnyObject) {
        let settings = NSUserDefaults.standardUserDefaults()
        
        
        if let token = settings.stringForKey("fbToken") {
            println("Token: \(token)")
//            performSegueWithIdentifier("login", sender: nil)
            self.dismissViewControllerAnimated(true, completion: nil)
        } else {
            PFFacebookUtils.logInInBackgroundWithReadPermissions(["public_profile"], block: { (user, error) -> Void in
                if let user = user {
                    let token = FBSDKAccessToken.currentAccessToken().tokenString
                    println(token)
                    settings.setObject(token, forKey: "fbToken")
//                    self.performSegueWithIdentifier("login", sender: nil)
                    self.dismissViewControllerAnimated(true, completion: nil)
                } else {
                    println("user cancelled; didn't get a token")
                }
            })
        }
    }
}