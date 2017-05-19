//
//  ExtensionTwitterViewController.swift
//  SocialNetworkShare
//
//  Created by Sierra 4 on 24/04/17.
//  Copyright © 2017 code.brew. All rights reserved.
//

import Foundation
import TwitterKit

extension TwitterViewController
{
    func twitterLogin(){
        Twitter.sharedInstance().logIn(withMethods: [.webBased]) { session, error in
            if let sessionid = session {
                print("user : \(sessionid.userName)")
                print("ID : \(sessionid.userID)")
                print("Token : \(sessionid.authToken)")
                Twitter.sharedInstance().sessionStore.logOutUserID(sessionid.userID)
            }
                
            else
            {
                print("Login error: \(error!.localizedDescription)")
            }
        }
    }
}
func twitterShare(VC : TwitterViewController, image : UIImage){
    
    var response : [String : AnyObject] = [String : AnyObject]()
    let composer = TWTRComposer()
    
    composer.setText("Testing post !! on Twitter   ggggg")
    
    composer.setImage(image)
    
    composer.show(from: VC) { result in
        
        if (result == TWTRComposerResult.cancelled) {
            print("Tweet composition cancelled")
            response["message"] = "Cancel" as AnyObject?
            // pbSocialDelegate.getTwitterShareResponse(userData : response)
        }
        else {
            response["message"] = "Success" as AnyObject?
            // pbSocialDelegate.getTwitterShareResponse(userData : response)
            print("Sending tweet!")
        }
    }

}
