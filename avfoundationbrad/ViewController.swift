//
//  ViewController.swift
//  avfoundationbrad
//
//  Created by Bradley Johnson on 8/3/14.
//  Copyright (c) 2014 learnswift. All rights reserved.
//

import UIKit
import AVFoundation
import CoreMedia
import CoreVideo
import ImageIO
import QuartzCore




class ViewController: UIViewController {
    
    var stillImageOutput = AVCaptureStillImageOutput()
                            
    @IBOutlet weak var imagePreview: UIImageView!
    @IBOutlet weak var cameraView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        var captureSession = AVCaptureSession()
    captureSession.sessionPreset = AVCaptureSessionPresetPhoto
        var layer = self.cameraView.layer
        var previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = self.cameraView.bounds
        self.cameraView.layer.addSublayer(previewLayer)
        
        var device = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        var error : NSError?
        var input = AVCaptureDeviceInput.deviceInputWithDevice(device, error: &error) as AVCaptureDeviceInput!
        if !input {
            println("bad!")
        }
        captureSession.addInput(input)
        var outputSettings = [AVVideoCodecKey : AVVideoCodecJPEG]
        self.stillImageOutput.outputSettings = outputSettings
        captureSession.addOutput(self.stillImageOutput)
        captureSession.startRunning()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func takePhoto(sender: AnyObject) {
        var videoConnection : AVCaptureConnection?
        for connection in self.stillImageOutput.connections {
            
            if let cameraConnection = connection as? AVCaptureConnection {
                for port in cameraConnection.inputPorts {
                    
                    if let videoPort = port as? AVCaptureInputPort {
                        
                        if videoPort.mediaType == AVMediaTypeVideo {
                            videoConnection = cameraConnection
                            break;
                        }
                    }
                }
            }
            if videoConnection != nil {
                break;
            }
        }
        self.stillImageOutput.captureStillImageAsynchronouslyFromConnection(videoConnection, completionHandler: {(buffer : CMSampleBuffer!, error : NSError!) -> Void in
            var data = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(buffer)
            var image = UIImage(data: data)
            self.imagePreview.image = image
            })
        
        
    }

}

