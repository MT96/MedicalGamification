//
//  ViewController.swift
//  MedicalGame
//
//  Created by Mattias Tengzelius on 2017-04-05.
//  Copyright © 2017 StickyBit. All rights reserved.
//

import UIKit
import Firebase
import CoreData
import FirebaseDatabase
import FirebaseAuth
import FirebaseStorage

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var saveStuff: UITextField!
    @IBOutlet weak var loadStuff: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var ref: FIRDatabaseReference?
    var databaseHandle:FIRDatabaseHandle?
    
    
    var cardArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate =  self
        tableView.dataSource = self
        
        
        //firebase reference
        ref = FIRDatabase.database().reference()
        
        //Retrieve the data and listen for changes
        databaseHandle = ref?.child("Cards").observe(.childAdded, with: { (snapshot) in
            
        //Code to execute when a child is added under "Cards"
        //Take the value from the snapshot and added it to the userArray array
        let card = snapshot.value as? String
            
        if let actualCard = card {
        
        //Append the data to our cardArray array
        self.cardArray.append(actualCard)
        
        //Reload the tableview
        self.tableView.reloadData()
            
            }
        })
    }
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int{
            
        return cardArray.count
            
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexpath : IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = cardArray[indexpath.row]
            
        return cell!
            
        }
   
    @IBAction func saveBtn(_ sender: Any) {


    ref?.child("Cards").childByAutoId().setValue(saveStuff.text)
    
        }
    
    @IBAction func LoadBtn(_ sender: Any) {
        retrievedata()
        tableView.reloadData()
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        }
    
    func retrievedata(){
        print("running function RETRIEVEDATA")
        
        self.ref?.child("Test").child("SavedString").observe(.value, with: { snapshot in

                if snapshot.exists(){
                
                self.loadStuff.text! = snapshot.value as! String

                print(snapshot)
                print("hejsanbamse")
            }
            
        })
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Dismiss the keyboard when the view is tapped on
        saveStuff.resignFirstResponder()
        loadStuff.resignFirstResponder()
    }
}

