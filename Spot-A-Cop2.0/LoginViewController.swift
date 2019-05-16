//
//  LoginViewController.swift
//  Spot-A-Cop2.0
//
//  Created by Marco Cruz on 5/14/19.
//  Copyright © 2019 Marco Cruz. All rights reserved.
//

import UIKit
import Parse



class LoginViewController: UIViewController {
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignInButton(_ sender: Any) {
        let username = userNameTextField.text!
        let password = passwordTextField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "LoginSegue", sender: nil)
                
            }
            else{
                print ("Error: \(error?.localizedDescription)")
                
            }
        }
    }
    func hideKeyboard(){
        
        userNameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    func textFieldShouldReturn(_textField: UITextField)-> Bool{
        hideKeyboard()
        return true
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
