//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Daniel Torres on 7/13/16.
//  Copyright © 2016 Danieltorres. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var labelTapToRecord: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    var audioRecorder:AVAudioRecorder!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        toggleButtonForRecording(on: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "stopRecording") {
            let playSoundsVC = segue.destinationViewController as! PlaySoundsViewController
            let recordedAudioURL = sender as! NSURL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func toggleButtonForRecording(on on: Bool){
        recordButton.enabled = !on
        stopRecordingButton.enabled = on
        labelTapToRecord.text = on ? "Recording in progress" : "Tap to record"
    }
    
    @IBAction func recordAudio(sender: AnyObject) {
        
        print("record button pressed")
        
        toggleButtonForRecording(on: true)
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }

    @IBAction func stopRecording(sender: AnyObject) {
        
        print("stop record button pressed")
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        print("AVAudioRecorder finished saving recording")
        if (flag){
            performSegueWithIdentifier("stopRecording", sender: audioRecorder.url)
        }else {
            print("Saving of recording failed")
            Alerts.showAlert(Alerts.RecordingFailedTitle, message: Alerts.RecordingFailedMessage, viewController: self)
        }
    }
    
}

