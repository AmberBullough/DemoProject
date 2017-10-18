//
//  MediaPageController.swift
//  DemoProject
//
//  Created by Bullough, Amber on 10/18/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit
import AVFoundation

public class MediaPageController: UIViewController
{
    private var soundPlayer : AVAudioPlayer?
    private var imageCounter : Int = 0
    private lazy var color : ColorTools = ColorTools()
 
    @IBOutlet weak var imageFrame: UIImageView!
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var soundButton: UIButton!
    @IBOutlet weak var soundSlider: UISlider!
    
    @IBAction func changePicture() -> Void
    {
        switchImage()
    }
    
    private func switchImage() -> Void
    {
        if(imageCounter > 2)
        {
            imageCounter = 0
            
        }
        if(imageCounter == 0)
        {
            imageFrame.image = UIImage(named: "Coran")
        }
        else if (imageCounter == 1)
        {
            imageFrame.image = UIImage(named: "Pidge")
        }
        else
        {
            imageFrame.image = UIImage(named: "TFP")
        }
        imageCounter += 1
        
    }
 @IBAction func musicPlay() -> Void
{
    var soundOn = false
   if(soundOn == true)
  {
        
   }
}

}
