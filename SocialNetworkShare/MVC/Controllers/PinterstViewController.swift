//
//  PinterstViewController.swift
//  SocialNetworkShare
//
//  Created by Sierra 4 on 22/04/17.
//  Copyright © 2017 code.brew. All rights reserved.
//

import UIKit
import PinterestSDK
import SwiftyJSON

class PinterstViewController: UIViewController {

    //MARK:- Outlets -
    @IBOutlet weak var btnLogin: UIButton!
    
    //MARK:- Properties -
    var user = PDKUser()
    var accessToken = ""
   
    //MARK:- LifeCycles Methods -
    override func viewDidLoad() {
        super.viewDidLoad()
 }
    //MARK: - Button Actions -
    @IBAction func btnLoginAct(_ sender: UIButton) {
        self.view.isUserInteractionEnabled = false
        //MARK: - Authenticating user, this will get the auth token... but to get the user profile, see MARK: Getting User Profile
        PDKClient.sharedInstance().authenticate(withPermissions: [PDKClientReadPublicPermissions,PDKClientWritePublicPermissions,PDKClientReadRelationshipsPermissions,PDKClientWriteRelationshipsPermissions], withSuccess: { (PDKResponseObject) in
            
            self.accessToken = PDKClient.sharedInstance().oauthToken
           
            //MARK: - Getting User Profile, use "/v1/me" to get user data in the Response object -
            
            let parameters : [String:String] =
                [
                    
                    "fields":  "first_name,id,last_name,url,image,username,bio,counts,created_at,account_type" //these fields will be fetched for the loggd in user
            ]
            
            PDKClient.sharedInstance().getPath("/v1/me/", parameters: parameters, withSuccess: {
                
                (PDKResponseObject) in
                self.view.isUserInteractionEnabled = true
                self.user = (PDKResponseObject?.user())!
                                
            }) {
                (Error) in
                if let error = Error
                {
                    print(error.localizedDescription )
                }
                self.view.isUserInteractionEnabled = true
            }
            
        }) {
            (Error) in
            self.view.isUserInteractionEnabled = true
            
    }
    }

       @IBAction func btnCreateBoardAction(_ sender: UIButton)
      {
        self.view.isUserInteractionEnabled = false
        PDKClient.sharedInstance().createBoard("shubham",boardDescription:" This is board description", withSuccess: { (responseObject) in
            _ = self.navigationController?.popViewController(animated: true)
            print("board is shared successfully !!")
        }, andFailure: { (error) in
            print(error?.localizedDescription ?? "error")
            self.view.isUserInteractionEnabled = true
        })
    }

    @IBAction func btnSavePinAction(_ sender: UIButton)
    {
    }
    @IBAction func btnBackAction(_ sender: UIButton) {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)

    }
  
}
