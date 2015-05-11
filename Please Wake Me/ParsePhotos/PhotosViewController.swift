import UIKit
import Parse

class PhotosViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UICollectionViewDataSource {
    
    var userName = "Unknown"
    var photos = [PFObject]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showWelcomeMessage()
        loadPhotos()
    }
    
    @IBOutlet weak var welcomeMessage: UILabel!
    
    func showWelcomeMessage() {
        let token = NSUserDefaults.standardUserDefaults().stringForKey("fbToken")!
        
        let request = FBSDKGraphRequest(graphPath: "me", parameters: nil, tokenString: token, version: nil, HTTPMethod: nil)
        request.startWithCompletionHandler { (_, result, error) -> Void in
            if error == nil {
                let userName = result.valueForKey("name") as! String
                let gender = result.valueForKey("gender") as! String
                self.userName = userName
                self.welcomeMessage.text = "Welcome \(userName)!"
            }
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        
        let imageData = UIImageJPEGRepresentation(image, 0.55)
        
        let imageFile = PFFile(name:"image.jpeg", data:imageData)
        
        var userPhoto = PFObject(className:"UserPhoto")
        userPhoto["userName"] = self.userName
        userPhoto["imageFile"] = imageFile
        userPhoto.saveInBackgroundWithBlock { (_, error) -> Void in
            if error == nil {
                self.loadPhotos()
            }
        }
    }
    
    @IBAction func addPhoto(sender: AnyObject) {
        var imagePicker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        }
        
        imagePicker.delegate = self
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func loadPhotosButtonClickd(sender: AnyObject) {
        loadPhotos()
    }
    
    func loadPhotos() {
        var query = PFQuery(className: "UserPhoto")
        query.orderByDescending("createdAt")
        
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            
            if error == nil {
                if let objects = objects as? [PFObject] {
                    self.photos = objects
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("photoCell", forIndexPath: indexPath) as! PFCollectionViewCell
        
        cell.imageView.file = photos[indexPath.row]["imageFile"] as? PFFile
        cell.imageView.loadInBackground { (_, _) -> Void in
            cell.setNeedsLayout()
        }
        
        cell.textLabel.text = photos[indexPath.row]["userName"] as? String
        
        return cell
    }
    
    
}





