//
//  MediaPageController.swift
//  DemoProject
//
//  Created by Bullough, Amber on 10/18/17.
//  Copyright © 2017 CTEC. All rights reserved./Users/abul1887/Desktop/SwiftProjectsApps/DemoProject/DemoProject/DemoProject/Controller/MediaPageController.swift
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
    public override func viewDidLoad() -> Void
    {
        super.viewDidLoad()
        view.backgroundColor = color.createColor()
        loadAudioFile()
    }
//    public override func didRecieveMemoryWarning()
//    {
//        super.didRecieveMemoryWarning()
//    }
    
    @IBAction func soundPlay() -> Void
    {
        playMusicFile()
    }
    private func playMusicFile() -> Void
    {
        if let isPlaying = soundPlayer?.isPlaying
        {
            if(isPlaying)
            {
                soundPlayer?.pause()
            }
            else
            {
                soundPlayer?.play()
            }
        }
    }
    private func  loadAudioFile() -> Void
    {
        if let soundURL = NSDataAsset(name: "Rockleetist x Ashe - Bad Apple (English)")
        {
            do
            {
                try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
                try! AVAudioSession.sharedInstance().setActive(true)
                
                try soundPlayer = AVAudioPlayer(data: soundURL.data, fileTypeHint: AVFileType.mp3.rawValue)
                soundSlider.maximumValue = Float ((soundPlayer?.duration)!)
                Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: (#selector(self.updateSlider)),userInfo:nil, repeats: true)
            }
            catch
            {
                print("Audio File Load Error")
            }
            
        }
    }
    @objc private func updateSlider() -> Void
    {
        soundSlider.value = Float ((soundPlayer?.currentTime)!)
    }
}
