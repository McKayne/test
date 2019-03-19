//
//  ViewController.swift
//  Test
//
//  Created by для интернета on 16.03.19.
//  Copyright © 2019 Nikolay Taran. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sleep(3)
        flashlight()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func flashlight() {
        let avDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        
        // check if the device has torch
        if (avDevice?.hasTorch)! {
            // lock your device for configuration
            do {
                let abv = try avDevice?.lockForConfiguration()
            } catch {
                print("aaaa")
            }
            
            // check if your torchMode is on or off. If on turns it off otherwise turns it on
            if (avDevice?.isTorchActive)! {
                avDevice?.torchMode = AVCaptureTorchMode.off
            } else {
                // sets the torch intensity to 100%
                do {
                    let abv = try avDevice?.setTorchModeOnWithLevel(1.0)
                } catch {
                    print("bbb")
                }
                //    avDevice.setTorchModeOnWithLevel(1.0, error: nil)
            }
            // unlock your device
            avDevice?.unlockForConfiguration()
        }
    }
}

