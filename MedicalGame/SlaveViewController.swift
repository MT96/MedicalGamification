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

    @IBAction func AlternativeButtonPressed(_ sender: AnyObject) {
        
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
            countDownLabel.text = minutes + ":" + seconds
            count -= 1
            
            if seconds == "1" || seconds == "5" || seconds == "11" || seconds == "17" || seconds == "23" || seconds == "29" || seconds == "35" || seconds == "41" || seconds == "46" {
                
            self.view.backgroundColor = UIColor.yellow
                
            }
            
            if seconds == "2" || seconds == "6" || seconds == "12" || seconds == "18" || seconds == "24" || seconds == "30" || seconds == "36" || seconds == "42" || seconds == "47" {
                
                self.view.backgroundColor = UIColor.red
                
            }
            
            if seconds == "3" || seconds == "7" || seconds == "13" || seconds == "19" || seconds == "25" || seconds == "31" || seconds == "37" || seconds == "43" || seconds == "48" {
                
                self.view.backgroundColor = UIColor.green
                
            }
            
            if seconds == "4" || seconds == "8" || seconds == "14" || seconds == "20" || seconds == "26" || seconds == "32" || seconds == "38" || seconds == "44" || seconds == "49" {
                
                self.view.backgroundColor = UIColor.blue
                
            }
            
            if seconds == "5" || seconds == "9" || seconds == "15" || seconds == "21" || seconds == "27" || seconds == "33" || seconds == "39" || seconds == "45" || seconds == "48" {
                
                self.view.backgroundColor = UIColor.purple
                
            }
            
            if seconds == "6" || seconds == "10" || seconds == "16" || seconds == "22" || seconds == "28" || seconds == "34" || seconds == "40" || seconds == "46" || seconds == "49" {
                
                self.view.backgroundColor = UIColor.brown
                
            }
            
            if seconds == "0.1" || seconds == "0.2" || seconds == "0.3" || seconds == "0.4" || seconds == "0.5" || seconds == "0.6" || seconds == "0.7" || seconds == "0.8" || seconds == "0.9" {
                
                self.view.backgroundColor = UIColor.brown
                
            }
            
     
            
            /*
            if count == 39 {
                
                self.view.backgroundColor = UIColor.blue
                
            }
           
            */
            if count == 0 {
                
       performSegue(withIdentifier: "Summary", sender: Any?.self)
                
               
                
                
            }
        }
        
    }
 


}
