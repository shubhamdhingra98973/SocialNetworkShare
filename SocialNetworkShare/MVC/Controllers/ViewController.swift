//
//  ViewController.swift
//  SocialNetworkShare
//
//  Created by Sierra 4 on 21/04/17.
//  Copyright © 2017 code.brew. All rights reserved.
//

import UIKit
import FBSDKShareKit
import FBSDKLoginKit
import FBSDKCoreKit
import Toast_Swift
class ViewController: UIViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    @IBOutlet weak var imgPost: UIImageView!
    let storybord = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        }
    
    
    @IBAction func btnFacebookAction(_ sender: UIButton)
    {
        let vc = storybord.instantiateViewController(withIdentifier: "FacebookViewController") as! FacebookViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnTwitterAction(_ sender: UIButton) {
        let vc = storybord.instantiateViewController(withIdentifier: "TwitterViewController") as! TwitterViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
   
    @IBAction func btnPinterestAction(_ sender: UIButton)
    {
        let vc = storybord.instantiateViewController(withIdentifier: "PinterstViewController") as! PinterstViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func funcTumblrAction(_ sender: UIButton)
    {
        let vc = storybord.instantiateViewController(withIdentifier: "TumblrViewController") as! TumblrViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension ViewController{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        dismiss(animated:true, completion: nil)
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            return
            // No image selected.
        }
        
        let imageUrl = (info[UIImagePickerControllerReferenceURL]  as! URL)
        print("URL of Image Is",imageUrl)
        imgPost.image = image
    }
    
    func imgSend(obj : UIButton)
    {
        let imgPicker = UIImagePickerController()
        imgPicker.sourceType = .photoLibrary
        imgPicker.delegate = self
        imgPicker.allowsEditing = true
        self.present(imgPicker, animated: true, completion: nil)
        
}
}

//    @IBAction func btnLoginAct(_ sender: UIButton) {
//       // TwitterLogin()
//        FacebookLogin()
//    }
//
//
//    @IBAction func btnSharePhotoAct(_ sender: UIButton)
//    {
//        TwitterShare(VC : self, image : UIImage(named : "Image")!)
//        //self.imgSend(obj:sender)
//    }
//


