//
//  ViewController.swift
//  TapWar(final)
//
//  Created by shillestad on 12/1/15.
//  Copyright © 2015 shillestad. All rights reserved.
//


//hold option for 2 taps
import UIKit

class ViewController: UIViewController
{
    @IBOutlet var blueGesture: UITapGestureRecognizer!
    @IBOutlet var redGesture: UITapGestureRecognizer!
    
    @IBOutlet weak var greyLbl: UILabel?
    @IBOutlet weak var blueLbl: UILabel!
    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet weak var nameLblBlue: UILabel!
    @IBOutlet weak var nameLblRed: UILabel!
    
    @IBOutlet weak var menuButton: UIButton!//button that comes up when you hit 50
    
    var score1 = 0
    var score2 = 0
    var count = 3
    var scoreRedTap = 0
    var scoreBlueTap = 0
    
    var name1 = String()
    var name2 = String()
    
    var goTrue = true
    var blueHeld = false
    var gameOver = true

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        scoreBlueTap = 0
        greyLbl!.text = "\(scoreRedTap)"
        blueLbl!.text = "\(scoreBlueTap)"
        nameLblBlue.text = "\(name1) \(score1)"
        nameLblRed.text = "\(name2) \(score2)"
        
        blueLbl.transform = CGAffineTransformMakeRotation(3.14)//rotates label 180 degrees
        nameLblBlue.transform = CGAffineTransformMakeRotation(3.14)//rotates label 180 degrees
        
    }
    
    @IBAction func blueTap(sender: AnyObject)
    {
        scoreBlueTap++ //moves score up by 1
        
        greyLbl!.text = "\(scoreRedTap)"
        blueLbl.text = "\(scoreBlueTap)"
        
        testScore()
    }
    
    @IBAction func redTap(sender: AnyObject)
    {
        scoreRedTap++ //moves score up by 1
        
        greyLbl!.text = "\(scoreRedTap)" //updates the labels to # every tap
        blueLbl.text = "\(scoreBlueTap)"
        
        testScore()
        
    }
    func testScore()
    {
        if scoreBlueTap == 50//score is 50
        {
            score1++ //moves score up by 1
            
            nameLblBlue.text = "\(name1) \(score1)"
            presentWinningAlert("¡NOM Ǝ∩˥q")
        }
        else if scoreRedTap == 50//score is 50
        {
            score2++
            
            nameLblRed.text = "\(name2) \(score2)"
            presentWinningAlert("RED WON!")
        }
    }
    @IBAction func BlueLong(sender: AnyObject)//hold for long time
    {
      blueHeld = true
    }
    
    func tapEnabled()//After go you are able to tap on the views
    {
        blueGesture.enabled = true
        redGesture.enabled = true
    }

    @IBAction func RedLong(sender: AnyObject)//hold for long time
    {
        if blueHeld //when held the timer gets executed
        {
            timerLbl.text = "Get Ready!"
            NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("update"),userInfo: nil, repeats: true)
            blueHeld = false
        }
        
    }
    
    func update() //Updates the time and makes the time go down by one
{
    if(count > 0)
    {
        timerLbl.text = String(self.count--)
    }
    else
    {
        timerLbl.text = "GO!"
        tapEnabled()
        
    }
}
    
 //*****************************************************************Alert************************************************************************
    func presentWinningAlert(winner:String)//alert settings
    {
        let alert = UIAlertController(title: winner, message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        let alertAtion = UIAlertAction(title: "Menu!", style: UIAlertActionStyle.Default, handler: {sender in
            
            self.performSegueWithIdentifier("backToMenu", sender: self.menuButton)
        })
            alert.addAction(alertAtion)
            self.presentViewController(alert, animated: true, completion: nil)
        }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let nextVC = segue.destinationViewController as! FirstViewController
    
        nextVC.name1 = name1
        nextVC.name2 = name2
        nextVC.score1 = self.score1
        nextVC.score2 = self.score2
        //^alows you to keep name and score when you hit menu^ also passes data
    }
    
}

