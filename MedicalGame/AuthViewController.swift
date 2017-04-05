//
//  AuthViewController.swift
//  MedicalGame
//
//  Created by TIMMY KONNEUS on 05/04/17.
//  Copyright © 2017 StickyBit. All rights reserved.
//

import UIKit
import FirebaseAuth


class AuthViewController: UIViewController {

    @IBOutlet weak var signInSelector: UISegmentedControl!
    
    @IBOutlet weak var signInLabel: UILabel!
    
    @IBOutlet weak var emailTextfield: UITextField!

    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    
    var isSignIn:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    
    @IBAction func SignInSelectorChanged(_ sender: UISegmentedControl) {
        
        // Flip bool of Segmented Control
        isSignIn = !isSignIn
        
        //Switch strings accordingly
        if isSignIn {
            signInLabel.text = "Sign in"
            signInButton.setTitle("Sign in", for: .normal)
        } else {
            
            signInLabel.text = "Register"
            signInButton.setTitle("Register", for: .normal)
        }
        
    }
    @IBAction func SignInButtonTapped(_ sender: UIButton) {
        
        //TODO: Validate email/password input
        
        if let email = emailTextfield.text, let pass = passwordTextfield.text {
        
        
        if isSignIn {
            
            FIRAuth.auth()?.signIn(withEmail: email, password: pass, completion: { (user, error) in
                
                if let u = user {
                    
                self.performSegue(withIdentifier: "GoToHome", sender: self)
                    
                } else {
                    
                    //error msg
                }
            })
            
        } else {
            
            FIRAuth.auth()?.createUser(withEmail: email, password: pass, completion: { (user, error) in
                
                if let u = user {
                
                    self.performSegue(withIdentifier: "GoToHome", sender: self)

                    
                } else {
                    
                    //error msg
                }
                
            })
            
        }
        
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Dismiss the keyboard when the view is tapped on
        emailTextfield.resignFirstResponder()
        passwordTextfield.resignFirstResponder()
    }

}
