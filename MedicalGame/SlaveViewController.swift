//
//  SlaveViewController.swift
//  MedicalGame
//
//  Created by TIMMY KONNEUS on 06/04/17.
//  Copyright © 2017 StickyBit. All rights reserved.
//

import UIKit


class SlaveViewController: UIViewController {

    @IBOutlet weak var AlternativeButton5: UIButton!
    
    @IBOutlet weak var AlternativeButton: UIButton!

    
    @IBOutlet weak var AlternativeButton2: UIButton!
   
    
    @IBOutlet weak var AlternativeButton4: UIButton!
    
    @IBOutlet weak var AlternativeButton3: UIButton!

    
    @IBOutlet weak var wrongMessage: UILabel!
    
    @IBOutlet weak var countDownLabel: UILabel!
    
   
    @IBOutlet weak var TestView: UIView!
    
    var RecievedAnswer = String()
    var scoreCounter = Int()
    var count = 59
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(UIMenuController.update), userInfo: nil, repeats: true)
        
        wrongMessage.isHidden = true
        
        AlternativeButton.layer.cornerRadius = 4
        AlternativeButton2.layer.cornerRadius = 4
        AlternativeButton3.layer.cornerRadius = 4
        AlternativeButton4.layer.cornerRadius = 4
        AlternativeButton5.layer.cornerRadius = 4
     
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Summary"{
            
            let destination = segue.destination as! SummaryViewController
            
            destination.RecieveScore = scoreCounter
            destination.RecieveMessage = "Correct!"
            
            if count == 0 {
                destination.RecieveMessage = "Game Over"            }
            
        }
        
     
    }

    @IBAction func AlternativeButtonPressed(_ sender: UIButton) {
        
        if AlternativeButton.titleLabel?.text == RecievedAnswer {
              scoreCounter += 1
            performSegue(withIdentifier: "Summary", sender: Any?.self)
            
            
        } else {
            
            wrongMessage.isHidden = false
            
        
        }
    }
    
    @IBAction func Alt2Pressed(_ sender: UIButton) {
        
        if AlternativeButton2.titleLabel?.text == RecievedAnswer {
             scoreCounter += 1
            performSegue(withIdentifier: "Summary", sender: Any?.self)
           
        }else {
            
            wrongMessage.isHidden = false
            
            
        }
    }
    
    
    @IBAction func Alt3Pressed(_ sender: AnyObject) {
        
        if AlternativeButton3.titleLabel?.text == RecievedAnswer {
             scoreCounter += 1
            performSegue(withIdentifier: "Summary", sender: Any?.self)
           
        }else {
            
            wrongMessage.isHidden = false
            
        }

    }

    @IBAction func Alt4Pressed(_ sender: AnyObject) {
        
        if AlternativeButton4.titleLabel?.text == RecievedAnswer {
             scoreCounter += 1
            performSegue(withIdentifier: "Summary", sender: Any?.self)
            
        }else {
            
            wrongMessage.isHidden = false
            
            
        
    }
    }
    
    @IBAction func Alt5Pressed(_ sender: AnyObject) {
        if AlternativeButton5.titleLabel?.text == RecievedAnswer {
             scoreCounter += 1
            performSegue(withIdentifier: "Summary", sender: Any?.self)
           
        }else {
            
            wrongMessage.isHidden = false
            
  
            
        }
    }
    
    func update() {
        
       if(count > 0){
            let minutes = String(count / 60)
            let seconds = String(count % 60)
            countDownLabel.text = seconds
            count -= 1
        
                
            }
            if count == 0 {
                
       performSegue(withIdentifier: "Summary", sender: Any?.self)
            
            
            count = -1
                
                
            }
        }
        
    }
 



