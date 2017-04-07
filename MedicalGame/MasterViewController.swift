//
//  MasterViewController.swift
//  MedicalGame
//
//  Created by TIMMY KONNEUS on 06/04/17.
//  Copyright © 2017 StickyBit. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {
    
    @IBOutlet weak var RandomWord: UILabel!
    
    @IBOutlet weak var ViewScore: UIButton!
    @IBOutlet weak var StartButton: UIButton!
    
    let Array = ["Karbapenem", "Kinolon", "Makrolid", "Glykopeptid", "Proteinsynteshämmare"]
    var RandomIndex = Int()
    var CurrentScore = Int()
   

    override func viewDidLoad() {
        super.viewDidLoad()

        StartButton.layer.cornerRadius = 4
        ViewScore.layer.cornerRadius = 4
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func StartStopButton(_ sender: AnyObject) {
        
       
        
        if StartButton.titleLabel?.text == "Starta" {
        
            var randomIndex = Int(arc4random_uniform(UInt32(Array.count)))
            
            RandomWord.text = self.Array[randomIndex]
            StartButton.setTitle("Stopp", for: .normal)
            
        
            
            
        } else if StartButton.titleLabel?.text == "Stopp" {
            
            RandomWord.text = ""
            StartButton.setTitle("Starta", for: .normal)
            
        }
        
      
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Skicka"{
            
             let destination = segue.destination as! SlaveViewController
            
            destination.RecievedAnswer = RandomWord.text!
            destination.scoreCounter = CurrentScore
            
        }
        
        if segue.identifier == "ViewScore"{
            
              let destination = segue.destination as! SummaryViewController
            
            destination.RecieveScore = CurrentScore
            
        }
    }
 
    @IBAction func GoToSlave(_ sender: AnyObject) {
        
        
      self.performSegue(withIdentifier: "Skicka", sender: Any?.self)
        
        
        
        
    }
}
