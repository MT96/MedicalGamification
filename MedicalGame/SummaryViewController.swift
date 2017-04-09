//
//  SummaryViewController.swift
//  MedicalGame
//
//  Created by TIMMY KONNEUS on 06/04/17.
//  Copyright © 2017 StickyBit. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {

    @IBOutlet weak var scoreCount: UILabel!
    
    @IBOutlet weak var CorrectOrGameOver: UILabel!
    @IBOutlet weak var GoBack: UIButton!
    var RecieveScore = Int()
    var RecieveMessage = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CorrectOrGameOver.text = RecieveMessage
        scoreCount.text = String(RecieveScore)
        
        GoBack.layer.cornerRadius = 4
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func GobackPressed(_ sender: AnyObject) {
        
     
        
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "GoBack"{
            
            let destination = segue.destination as! MasterViewController
            
            destination.CurrentScore = RecieveScore
            
        }
    }
    @IBAction func Master(_ sender: AnyObject) {
        
     
        
       self.performSegue(withIdentifier: "GoBack", sender: Any?.self)
    }
}
