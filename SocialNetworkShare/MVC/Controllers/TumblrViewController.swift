//
//  TumblrViewController.swift
//  SocialNetworkShare
//
//  Created by Sierra 4 on 24/04/17.
//  Copyright © 2017 code.brew. All rights reserved.
//

import UIKit
import TMTumblrSDK

class TumblrViewController: UIViewController {

   
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func btnBackAction(_ sender: UIButton) {
        
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnTumblrLogin(_ sender: UIButton) {
        TMAPIClient.sharedInstance().oAuthConsumerKey = "kdApRkbtXZoIq6jryXZhXIgeUPHNIDj3f6wB5gQV5d9auEwPlw"
        TMAPIClient.sharedInstance().oAuthConsumerSecret = "ssvjQYnuZbtrjZA87k9zL2S5g3kqQtsa0C3tP9b59gGUlB4TWP"
        TMAPIClient.sharedInstance().oAuthToken = "eva7ahL5m4ZbHRsa7TWXp9kNoNPxeEgEK6niZfB1cKv5idRxxN"
        TMAPIClient.sharedInstance().oAuthTokenSecret = "AZ2B6n8hWvQu4GwHEriUceotp8v0jbO0gZkrcfd6oxYOVEIzb6"
        
        //Make a request
        TMAPIClient.sharedInstance().userInfo({(_ result: Any, _ error: Error?) -> Void in
            if let err:Error = error{
                print(err.localizedDescription)
                }
            else
            {
              print("Result:",result)
            }
            
        })

        
    }
   
    @IBAction func btnTumblrShare(_ sender: UIButton) {
    }
   }
