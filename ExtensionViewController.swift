//
//  ExtensionViewController.swift
//  avfoundationbrad
//
//  Created by Bradley Johnson on 8/3/14.
//  Copyright (c) 2014 learnswift. All rights reserved.
//

import UIKit
import Photos
import PhotosUI

class ExtensionViewController: UIViewController, PHContentEditingController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startContentEditingWithInput(contentEditingInput: PHContentEditingInput!, placeholderImage: UIImage!) {
        
    }
    
    func finishContentEditingWithCompletionHandler(completionHandler: ((PHContentEditingOutput!) -> Void)!) {
        
    
    }
    
    func canHandleAdjustmentData(adjustmentData: PHAdjustmentData!) -> Bool  {
        return true
    }
    
    func cancelContentEditing()  {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
