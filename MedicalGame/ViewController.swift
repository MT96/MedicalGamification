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

    
    override func viewDidLoad() {
        super.viewDidLoad()

      //  print("referensen till firebase är: ", ref)
        // Do any additional setup after loading the view, typically from a nib.
    }
   
    @IBAction func saveBtn(_ sender: Any) {
                ref = FIRDatabase.database().reference()
        self.ref.child("Test").setValue(["SavedString": saveStuff.text!])
    }
    
    @IBAction func LoadBtn(_ sender: Any) {
        ref.child("Test").observeSingleEvent(of: .value, with: { (snapshot) in
            //self.loadStuff.text! = snapshot.value as! String
            let values = snapshot.value as! NSDictionary
            
            print("snapshot value is: ", snapshot)
            self.loadStuff.text! = snapshot.value as! String
        }) { (error) in
            print(error.localizedDescription)

    }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

