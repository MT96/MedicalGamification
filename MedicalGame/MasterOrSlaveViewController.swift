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
    
    @IBOutlet weak var UsernameTextfield: UITextField!
    
    @IBOutlet weak var PasswordTextfield: UITextField!
    
     var isSignIn:Bool = true
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SignInButton.layer.cornerRadius = 4
        
        
        MasterOrSlaveSegment.alpha = 0
        SignInButton.alpha = 0
        UsernameTextfield.alpha = 0
        PasswordTextfield.alpha = 0
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1, animations: {
            
        }) { (true) in
            self .funcShowAlphaObject()
        }
    }

    func funcShowAlphaObject() {
    
        UIView.animate(withDuration: 0.5, animations: {
            
            self.MasterOrSlaveSegment.alpha = 1
            
            
            }, completion: { (true) in
            
        self.showTextfields()
            
        })
    
    }
    func showTextfields(){
        
        UIView.animate(withDuration: 1, animations: {
            self.PasswordTextfield.alpha = 1
            self.UsernameTextfield.alpha = 1
     
        
        }) {(true) in
        
      self.button()
        }
    }
    
    func button(){
        
        UIView.animate(withDuration: 1, animations: {
      
            self.SignInButton.alpha = 1
            
        }) {(true) in
            
            
        }
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
