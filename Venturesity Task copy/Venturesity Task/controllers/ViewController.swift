import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
    
    
    
    //MARK: Outlets
    @IBOutlet weak var registrationNo: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var gender: UITextField!
    
    //MARK: Variables
    var ref : DatabaseReference?
    var secondClassRef = SecondViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ref = Database.database().reference()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    //MARK: Actions
    @IBAction func savebutton(_ sender: Any) {
        if registrationNo.text != ""{
            ref?.child("list").childByAutoId().setValue(registrationNo.text)
            ref?.child(registrationNo.text!).childByAutoId().setValue(name.text)
            ref?.child(registrationNo.text!).childByAutoId().setValue(height.text)
            ref?.child(registrationNo.text!).childByAutoId().setValue(gender.text)
            reset()
        }
        else{
            let alert = UIAlertController(title: "Alert", message: "Enter something", preferredStyle: .alert)
            let action = UIAlertAction(title: "Back", style: .default, handler: { (UIAlertAction) in
                self.reset()
            })
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
   
        
    }
    
    
    //MARK: Functions
    func reset(){
    
        registrationNo.text = ""
        name.text = ""
        height.text = ""
        gender.text = ""
    }
    

}

