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

class ViewController: UIViewController {

    @IBOutlet weak var saveStuff: UITextField!
    @IBOutlet weak var loadStuff: UITextField!
    
    var ref: FIRDatabaseReference!
    var Dbref = FIRDatabase.database().reference()

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
      //  print("referensen till firebase är: ", ref)
        // Do any additional setup after loading the view, typically from a nib.
    }
   
    @IBAction func saveBtn(_ sender: Any) {

        self.Dbref.child("Test").setValue(["SavedString": saveStuff.text!])
    }
    
    @IBAction func LoadBtn(_ sender: Any) {
        retrievedata()
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func retrievedata()
    {
        print("running function RETRIEVEDATA")
        
        self.Dbref.child("Test").child("SavedString").observe(.value, with: { snapshot in

                if snapshot.exists(){
                
                self.loadStuff.text! = snapshot.value as! String

                print(snapshot)
                print("hejsanbamse")
            }
            
        })
    }



}

