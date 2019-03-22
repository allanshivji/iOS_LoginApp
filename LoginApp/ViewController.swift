//
//  ViewController.swift
//  LoginApp
//
//  Created by Allan Shivji on 3/21/19.
//  Copyright © 2019 Allan Shivji. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    let mycontext:LAContext = LAContext()

    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if mycontext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            if mycontext.biometryType == .faceID {
                loginButton.setImage(UIImage(named: "faceID"), for: UIControl.State.normal)
            } else if mycontext.biometryType == .touchID {
                loginButton.setImage(UIImage(named: "fingerID"), for: UIControl.State.normal)
            }
        }
        
    }

    @IBAction func loginAction(_ sender: Any) {
    
        if mycontext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            
            mycontext.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Your Account") { (correct, nil) in
                
                if correct {
                    
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "SecondViewController", sender: self)
                    }
                    
                } else {
                    print("Invalid Password")
                }
            }
        } else {
            print("Does not support Biometric")
        }
        
    }
    
}

