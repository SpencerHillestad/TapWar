//
//  FirstViewController.swift
//  TapWar(final)
//
//  Created by shillestad on 12/8/15.
//  Copyright © 2015 shillestad. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate
{
    @IBOutlet weak var nameView1: UITextField!
    @IBOutlet weak var nameView2: UITextField!
    
    var name1 = ""
    var name2 = ""
    
    var score1 = 0
    var score2 = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        nameView1.text = name1
        nameView2.text = name2
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        nameView1.resignFirstResponder()
        nameView2.resignFirstResponder()
        
        return true
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "regularTapWar"
        {
            if (nameView1.text?.characters.count != 0 && nameView2.text?.characters.count != 0)
            {
            let nextvc = segue.destinationViewController as! ViewController
            nextvc.name1 = self.nameView1.text!
            nextvc.name2 = self.nameView2.text!
            nextvc.score1 = self.score1
            nextvc.score2 = self.score2
                //pass data ^
            }

        }
    }
    
}


