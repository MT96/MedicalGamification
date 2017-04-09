//
//  OptionsUIViewController.swift
//  MedicalGame
//
//  Created by TIMMY KONNEUS on 08/04/17.
//  Copyright © 2017 StickyBit. All rights reserved.
//

import UIKit

class OptionsUIViewController: UIViewController {
    
    @IBOutlet weak var CancelButton: BounceButton!
    
    @IBOutlet weak var SaveButton: BounceButton!
    
    @IBAction func DismissCanel(_ sender: AnyObject) {
    }

    @IBAction func DissmissSave(_ sender: AnyObject) {
        
    }
    @IBAction func DissMissOutside(_ sender: AnyObject) {
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
    
    @IBOutlet weak var addcard: UITextField!
    
    @IBOutlet weak var SetTimer: UITextField!
    
    var CardArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func AddCard(_ sender: AnyObject) {
        
      CardArray.append(addcard.text!)
        print(CardArray)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddCard"{
            
            let destination = segue.destination as! MasterViewController
            
            destination.ExtraCards = CardArray
            destination.Roundtimer = Int(SetTimer.text!)!
            
        }
    



}
}
