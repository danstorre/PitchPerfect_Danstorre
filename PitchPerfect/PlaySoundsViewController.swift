//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Daniel Torres on 7/14/16.
//  Copyright © 2016 Danieltorres. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    @IBOutlet weak var rabbitButton : UIButton!
    @IBOutlet weak var snailButton : UIButton!
    @IBOutlet weak var chipmunkButton : UIButton!
    @IBOutlet weak var darthVaderButton : UIButton!
    @IBOutlet weak var carrotButton : UIButton!
    @IBOutlet weak var echoButton : UIButton!
    @IBOutlet weak var stopButton : UIButton!
    
    var recordedAudioURL: NSURL!
    var audioFile : AVAudioFile!
    var audioEngine : AVAudioEngine!
    var audioPlayerNode : AVAudioPlayerNode!
    var stopTimer : NSTimer!
    
    enum ButtonType : Int { case Slow = 0, Fast, Chipmunk, Vader, Echo, Reverb }
    
    enum RateType: Float {
        case Slow = 0.5
        case Fast = 1.5
    }

    enum PitchType: Float {
        case Chipmunk = 1000
        case Vader = -1000
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("PlaySoundsViewController loaded")
        setupAudio()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        configureUI(.NotPlaying)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func playSounds(sender: UIButton){
        
        switch (ButtonType(rawValue: sender.tag)!){
        case .Slow:
            playSound(rate: RateType.Slow.rawValue)
        case .Fast:
            playSound(rate: RateType.Fast.rawValue)
        case .Chipmunk:
            playSound(pitch: PitchType.Chipmunk.rawValue)
        case .Vader:
            playSound(pitch: PitchType.Vader.rawValue)
        case .Echo:
            playSound(echo:true)
        case .Reverb:
            playSound(reverb:true)
        
        }
        
        configureUI(.Playing)
        
    }
    
    @IBAction func stopSound(sender: UIButton){
        stopAudio()
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
