//
//  SecondViewController.swift
//  Venturesity Task
//
//  Created by Sarvad shetty on 12/13/17.
//  Copyright © 2017 Sarvad shetty. All rights reserved.
//

import UIKit
import FirebaseDatabase

 var arr:[String] = []
var hi:[String]=[]

class SecondViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource{
   
    //MARK: Outlets
    @IBOutlet weak var myTableView: UITableView!
    
    
    //MARK: Variables
    var handle: DatabaseHandle?
    var ref2 : DatabaseReference?
    var namess : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Firebase stuff
        ref2 = Database.database().reference()
        handle = ref2?.child("list").observe(.childAdded, with: { (snapshot) in
            if let item = snapshot.value as? String{
                arr.append(item)
                hi = Array(Set(arr))
                self.myTableView.reloadData()
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    
    //MARK: Table view functions
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = hi[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        namess = hi[indexPath.row]
    
        performSegue(withIdentifier: "go", sender: Any?.self)
     
    }
    
    
    
    
    
    
    
    //MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "go"{
            let vc = segue.destination as? ThirdViewController
            vc?.no = namess
            
        }
    }
    
    //MARK: Actions
    @IBAction func BACK(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    

}
