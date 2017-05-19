//
//  ExtensionFacebookViewController.swift
//  SocialNetworkShare
//
//  Created by Sierra 4 on 24/04/17.
//  Copyright © 2017 code.brew. All rights reserved.
//

import Foundation
import FBSDKShareKit
import FBSDKLoginKit
import FBSDKCoreKit
import Toast_Swift

extension FacebookViewController
{
    func facebookLogin()
    {
        if((FBSDKAccessToken.current()) != nil)
        {
            self.view.makeToast("You have already login", duration: 0.5, position: .bottom)
        }
        else
        {
            let login = FBSDKLoginManager()
            login.loginBehavior = FBSDKLoginBehavior.browser
            let permissions = ["public_profile", "email", "user_friends"]
            login.logIn(withReadPermissions:permissions, from: self, handler: {(result, error) -> Void in
                if error != nil
                {
                    print(error?.localizedDescription ?? "nil")
                }
                else if (result?.isCancelled)!
                {
                    
                }
                else
                {
                    self.view.makeToast("User is login successfully", duration: 1, position: .bottom)
                    print(result.debugDescription)
                }
            })
        }
    }
    func facbookShare()
    {
        if FBSDKAccessToken.current().hasGranted("publish_actions")
        {
            self.shareData()
        }
        else
        {
            let login: FBSDKLoginManager = FBSDKLoginManager()
            login.logOut()
            login.logIn(withPublishPermissions: ["publish_actions"], from: self, handler: { (result, error) in
                if (error != nil) {
                    print(error?.localizedDescription ?? "nil")
                } else if (result?.isCancelled)! {
                    
                } else if (result?.grantedPermissions.contains("publish_actions"))! {
                    self.shareData()
                }else{
                    print(error ?? "nnn");
//                    self.shareData()
                }
            })
            
        }
    }
    func shareData()
    {
        self.view.makeToast("graphPath :me/feed is using ..",duration:1, position:.center)
        FBSDKGraphRequest(graphPath: "me/feed", parameters: [
            "message": "Testing post ... please dont comment or like on this post Thank you !!" ], httpMethod: "POST").start(completionHandler: {(connection, result, error) -> Void in
            if error == nil {
                self.view.makeToast("Your post is shared successfully", duration:1, position: .bottom)
            }
            else if error != nil{
                self.view.makeToast("Something went wrong", duration: 0.5, position: .bottom)
                print(error ?? "nil")
            }
            else
            {
            print("Everything works fine !! ")
            }
        })
    }
    
    func getFbInfo()
    {
        let graphRequest:FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"first_name,email, picture.type(large)"])
        
        graphRequest.start(completionHandler: { (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                print("Error: \(error)")
            }
            else
            {
                let data:[String:AnyObject] = result as! [String : AnyObject]
                print("DATA:",data)
                self.getFbInfo()
            }
        })
    }

}


//Error Domain=com.facebook.sdk.core Code=8 "(null)" UserInfo={com.facebook.sdk:FBSDKGraphRequestErrorCategoryKey=0, com.facebook.sdk:FBSDKGraphRequestErrorHTTPStatusCodeKey=403, com.facebook.sdk:FBSDKErrorDeveloperMessageKey=(#200) The user hasn't authorized the application to perform this action, com.facebook.sdk:FBSDKGraphRequestErrorGraphErrorCode=200, com.facebook.sdk:FBSDKGraphRequestErrorParsedJSONResponseKey={
//    body =     {
//        error =         {
//            code = 200;
//            "fbtrace_id" = BIC2rGaiCyh;
//            message = "(#200) The user hasn't authorized the application to perform this action";
//            type = OAuthException;
//        };
//    };
//    code = 403;
//}}
