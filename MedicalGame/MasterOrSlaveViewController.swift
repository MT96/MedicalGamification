//
//  MasterOrSlaveViewController.swift
//  MedicalGame
//
//  Created by TIMMY KONNEUS on 06/04/17.
//  Copyright © 2017 StickyBit. All rights reserved.
//

import UIKit

class MasterOrSlaveViewController: UIViewController {

    @IBOutlet weak var MasterOrSlaveSegment: UISegmentedControl!
    
    @IBOutlet weak var SignInButton: UIButton!
    
     var isSignIn:Bool = true
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SignInButton.layer.cornerRadius = 4
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func Choose(_ sender: AnyObject) {
        
        isSignIn = !isSignIn
        
    }

    @IBAction func SignInPressed(_ sender: AnyObject) {
        
        if isSignIn {
            
            self.performSegue(withIdentifier: "Slave", sender: Any?.self)
            
        } else {
            
            
            self.performSegue(withIdentifier: "Master", sender: Any?.self)
        }
        
        
        
    }
    

}
