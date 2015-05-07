import UIKit

class ArrayViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    var rows = [String]() //array that stores the data entered
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    //function for using return key to enter data
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        addName()
        return true
    }
    
    func addName () {
        rows.append(textField.text) //adds the text from the textField to the Table
        tableView.reloadData()
        textField.text = ""
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("mycell") as! UITableViewCell
        cell.textLabel!.text = rows[indexPath.row]
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.becomeFirstResponder()
    }
}

