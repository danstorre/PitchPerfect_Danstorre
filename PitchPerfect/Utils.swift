//
//  Alerts.swift
//  PitchPerfect
//
//  Created by Daniel Torres on 7/27/16.
//  Copyright © 2016 Danieltorres. All rights reserved.
//

import Foundation
import UIKit



struct Alerts {
    
        // MARK: - Alerts Buttons Strings
        static let DismissAlert = "Dismiss"
    
        // MARK: - Alerts Recording
        static let RecordingDisabledTitle = "Recording Disabled"
        static let RecordingDisabledMessage = "You've disabled this app from recording your microphone. Check Settings."
        static let RecordingFailedTitle = "Recording Failed"
        static let RecordingFailedMessage = "Something went wrong with your recording."
    
        // MARK: - Errors Strings
        static let AudioRecorderError = "Audio Recorder Error"
        static let AudioSessionError = "Audio Session Error"
        static let AudioRecordingError = "Audio Recording Error"
        static let AudioFileError = "Audio File Error"
        static let AudioEngineError = "Audio Engine Error"
    
        // MARK: - Alerts Methods
        static func showAlert(title: String, message: String, viewController: UIViewController) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: Alerts.DismissAlert, style: .Default, handler: nil))
            viewController.presentViewController(alert, animated: true, completion: nil)
        }
        
}

extension UIView {

    func changeImageViewModeOf(arrayButtons arrayButton: [UIButton], to mode: UIViewContentMode ){
        for button in arrayButton{
            if let imageView = button.imageView{
                imageView.contentMode = mode
            }
        }
    }
}






