//
//  TwitterViewController.swift
//  SocialNetworkShare
//
//  Created by Sierra 4 on 24/04/17.
//  Copyright © 2017 code.brew. All rights reserved.
//

import UIKit
import TwitterKit

class TwitterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnBackAction(_ sender: UIButton)
    {
        _ = self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnTwitterShare(_ sender: UIButton)
    {
        twitterShare(VC : self, image : UIImage(named : "Image")!)
        
    }

    @IBAction func btnTwitterLogin(_ sender: UIButton)
    {
        twitterLogin()
        
    }
   }
