//
//  FacebookViewController.swift
//  SocialNetworkShare
//
//  Created by Sierra 4 on 24/04/17.
//  Copyright © 2017 code.brew. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import Toast_Swift

class FacebookViewController: UIViewController {
    
    override func viewDidLoad()
    {
        self.view.makeToast("Here's the facebook platform for login and share !!", duration: 3, position: .center)
        super.viewDidLoad()
    }
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    @IBAction func btnFacebookShare(_ sender: UIButton)
    {
        if((FBSDKAccessToken.current()) != nil)
        {
        self.view.makeToast("Shared Process Started", duration: 0.5, position: .bottom)
        facbookShare()
        }
        else
        {
        self.view.makeToast("User is not login into the app", duration:1, position:.bottom)
        }

    }
    
    @IBAction func btnFacbookLogin(_ sender: UIButton)
    {
        self.view.makeToast("Login Process Started", duration: 0.5, position: .bottom)
        facebookLogin()
    }
    @IBAction func btnBackAction(_ sender: UIButton) {
      
        _ = self.navigationController?.popViewController(animated: true)
    }
    

}
