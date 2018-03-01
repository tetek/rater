//
//  ViewController.swift
//  rater
//
//  Created by Wojciech Mandrysz on 02/09/15.
//  Copyright © 2015 Binarka. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var captureSession: AVCaptureSession?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?

    @IBOutlet var previewView: UIView!
    @IBOutlet var raterView: RaterView!
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rater = self.raterView!
        var settings = rater.settings
        settings.separator = 14.0
        rater.settings = settings
        self.label.alpha = 0
        rater.completition = { (val) in
            self.label.text = "\(val)"
//            self.label.isHidden = false
            self.label.alpha = 0
            UIView.animate(withDuration: 0.5, animations: {
                self.label.alpha = 1
            })
            UIView.animate(withDuration: 0.5, animations: {
                self.label.alpha = 1
            }, completion: { (completion) in
                UIView.animate(withDuration: 0.5, animations: {
                    self.label.alpha = 0
                })
            })
        }

        let captureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            captureSession = AVCaptureSession()
            captureSession?.addInput(input)
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
            videoPreviewLayer?.frame = view.layer.bounds
            previewView.layer.addSublayer(videoPreviewLayer!)
            captureSession?.startRunning()
        } catch {
            print(error)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

