//
//  ViewController.swift
//  socialStart
//
//  Created by Thomas Hawing on 2/26/17.
//  Copyright © 2017 Thomas Hawing. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {

    @IBOutlet weak var emailField: FancyField!
    
    @IBOutlet weak var pwdField: FancyField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func facebookBtnTapped(_ sender: Any) {
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("THOMAS: Unable to authenticate with Facebook - \(error)")
            } else if result?.isCancelled == true {
                print("THOMAS: User cancelled Facebook Authentication")
            } else {
                print("THOMAS: Successfully authenticated with FB")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("THOMAS: Unable to authenticate with Firebase - \(error)")
            } else {
                print("THOMAS: Successfully authenticated with Firepase")
            }
        })
    }
    @IBAction func signInTapped(_ sender: Any) {
        //first we want to make sure that there is text within the emial and password
        if let email = emailField.text, let pwd = pwdField.text {
        
        //will be able to check in with email via firebase
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: { (user, error) in
                if error == nil {
                    print("THOMAS: User email was authenticated with Firebase")
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: { (user, error) in
                        if error != nil {
                            print("THOMAS: Unable to authenticate with Firebase using email")
                        } else {
                            print("THOMAS: Successfully authenticated with Firebase")
                        }
                    })
                }
            })
        }
        
        
    }

}

