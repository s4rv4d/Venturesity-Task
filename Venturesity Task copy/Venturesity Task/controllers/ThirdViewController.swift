
import UIKit
import FirebaseDatabase
    var items:[String] = []

class ThirdViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var regLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    

    //MARK: Variables
    var no : String?
    var ref3 : DatabaseReference?
    var handle2 : DatabaseHandle?
    let mo = dataMo()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      ref3 = Database.database().reference()
        handle2 = ref3?.child(no!).observe(.childAdded, with: { (snapchat) in
            items.append(snapchat.value as! String)
            if items.count == 3{
                self.mo.registrationNumber = self.no!
                self.mo.nameLabelll = items[0]
                self.mo.genderLabell = items[2]
                self.mo.heightLabel = items[1]
                self.updateUI()
                items = []
            }
            }
        )
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //MARK: Functions
    func updateUI(){
        self.nameLabel.text = mo.nameLabelll
        self.regLabel.text = mo.registrationNumber
        self.heightLabel.text = mo.heightLabel
        self.genderLabel.text = mo.genderLabell
        
    }
    @IBAction func BACKbut(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
