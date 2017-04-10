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
     var int = Int()
    

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
        
         int += 1
        //declare parameter as a dictionary which contains string as key and value combination. considering inputs are valid
        
        let parameters = ["Channel": UsernameTextfield.text!, "Nickname": PasswordTextfield.text!] as Dictionary<String, String>
        
        //create the url with URL
        let url = URL(string: "https://thawing-coast-61754.herokuapp.com/register/\(int)")! //change the url
        
        //create the session object
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "PUT" //set http method as POST
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
          
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error -> Void in
            print("Response: \(response)")
            print(error.debugDescription)
            if(error != nil)
            {
                return
            }
            let strData = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("Body: \(strData)")
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as? NSDictionary
                
                print(json)
                
                json!.object(forKey: parameters)
                
            } catch {
                print("ERROR call")
            
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
      
    }
    
}
  /*  if isSignIn {
            
            self.performSegue(withIdentifier: "Slave", sender: Any?.self)
        
            
        } else {
            
            
            self.performSegue(withIdentifier: "Master", sender: Any?.self)
        }
    
    */


