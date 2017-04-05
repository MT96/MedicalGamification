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
    var userRef = FIRAuth.auth()?.currentUser?.uid
    
 
    


    
    var userArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        FIRAuth.auth()?.signInAnonymously() { (user, error) in
            let userRef = user!.uid
                      // FIRAuth.auth()?.currentUser?.uid = userArray
            
            //userArray.append(FIRAuth.auth()?.currentUser?.uid!(),
            //userArray.append((FIRAuth.auth()?.currentUser)!) as! [String]
           // let isAnonymous = user!.isAnonymous  // true
            //let uid = user!.uid
            self.userArray.append(userRef)
            
            print("USER ID IS: ", userRef)
            print("hej")
            // ...
        }
       
      //  print("referensen till firebase är: ", ref)
        // Do any additional setup after loading the view, typically from a nib.
    }
   
    @IBAction func saveBtn(_ sender: Any) {

        
       let newref = self.Dbref.child("Test").childByAutoId()
        let key = newref.key
        newref.setValue(
            ["test1": saveStuff.text!,
             "ID": key,
             //  "TaskID":
            ])
        
         //let newref = FIRDatabase.database().reference().child("Tasks").child((FIRAuth.auth()?.currentUser?.uid)!).childByAutoId()

    
        self.Dbref.child("Test").child("SavedString").child("UID").setValue(["UID":userRef])
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

