//
//  ComposeViewController.swift
//  MedicalGame
//
//  Created by TIMMY KONNEUS on 05/04/17.
//  Copyright © 2017 StickyBit. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ComposeViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!

    var ref:FIRDatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = FIRDatabase.database().reference()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addCard(_ sender: AnyObject) {
        
        ref?.child("Cards").childByAutoId().setValue(textView.text)
        
        presentingViewController?.dismiss(animated: true, completion: nil)
        
    }
 
    @IBAction func trashCard(_ sender: AnyObject) {
        
        presentingViewController?.dismiss(animated: true, completion: nil)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Dismiss the keyboard when the view is tapped on
        textView.resignFirstResponder()
       
    }

}
