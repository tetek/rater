//
//  ViewController.swift
//  rater
//
//  Created by Wojciech Mandrysz on 02/09/15.
//  Copyright © 2015 Binarka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rater = self.view as! RaterView
        var settings = rater.settings
        settings.separator = 14.0
        rater.settings = settings
        rater.completition = { print($0) }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

