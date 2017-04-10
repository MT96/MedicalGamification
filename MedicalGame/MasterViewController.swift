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
    @IBOutlet weak var StartButtonConstraints: NSLayoutConstraint!
    @IBOutlet weak var ViewScoreButtonConstraints: NSLayoutConstraint!
    @IBOutlet weak var OptionButton: BounceButton!
    
    @IBOutlet weak var OptionButtonConstraint: NSLayoutConstraint!
    
    var ExtraCards = [String]()
    
    var Array = ["Karbapenem", "Kinolon", "Makrolid", "Glykopeptid", "Proteinsynteshämmare"]
    
    var Roundtimer = Int()
    var RandomIndex = Int()
    var CurrentScore = Int()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        StartButton.layer.cornerRadius = 5
        ViewScore.layer.cornerRadius = 5
        
        StartButtonConstraints.constant -= view.bounds.width
        ViewScoreButtonConstraints.constant -= view.bounds.width
        OptionButtonConstraint.constant -= view.bounds.width

        var MergedArray = Array + ExtraCards
        
        
    }
    
    var animationPerformedOnce = false
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !animationPerformedOnce {
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: { 
            self.StartButtonConstraints.constant += self.view.bounds.width
                self.view.layoutIfNeeded()
            }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.ViewScoreButtonConstraints.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)
            
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.OptionButtonConstraint.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
            }, completion: nil)
        
        animationPerformedOnce = true
    }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func StartStopButton(_ sender: AnyObject) {
        
        var MergedArray = Array+ExtraCards as Array!
        
        if StartButton.titleLabel?.text == "Starta" {
            
            var randomIndex = Int(arc4random_uniform(UInt32((MergedArray?.count)!)))
            
            RandomWord.text = MergedArray?[randomIndex]
            
            StartButton.setTitle("Stopp", for: .normal)
            
            
        } else if StartButton.titleLabel?.text == "Stopp" {
            
            RandomWord.text = ""
            StartButton.setTitle("Starta", for: .normal)
            
        }
        
      
        
        
    }
    
    @IBAction func InställningarPressed(_ sender: AnyObject) {
        let GoBack = sender as! UIButton
        let bounds = GoBack.bounds
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
            GoBack.bounds = CGRect(x: bounds.origin.x - 30, y: bounds.origin.y, width: bounds.size.width + 30, height: bounds.size.width)
        }) { (success:Bool) in
            GoBack.bounds = bounds
        
        
    }
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Skicka"{
            
             let destination = segue.destination as! SlaveViewController
            
            destination.RecievedAnswer = RandomWord.text!
            destination.scoreCounter = CurrentScore
            
            if Roundtimer != 0  {
                destination.count = Roundtimer
            }
         
            
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
