//
//  SignUpViewController.swift
//  Spot-A-Cop2.0
//
//  Created by Marco Cruz on 5/14/19.
//  Copyright © 2019 Marco Cruz. All rights reserved.
//

import UIKit
import Parse


class SignUpViewController: UIViewController {
    @IBOutlet weak var FIrstNameTextField: UITextField!
    @IBOutlet weak var LastNameTextField: UITextField!
    @IBOutlet weak var UserNameTextField: UITextField!
    @IBOutlet weak var PassWordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignUpButton(_ sender: Any) {
        let user = PFUser()
        user.username = UserNameTextField.text
        user.password = PassWordTextField.text
        user["FirstName"] = FIrstNameTextField.text
        user["LastName"] = LastNameTextField.text
        
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "SignUpSegue", sender: nil)
            }
            else{
                print ("Error: \(error?.localizedDescription)")
            }
        }
        
    }
    func hideKeyboard(){
        
        UserNameTextField.resignFirstResponder()
        PassWordTextField.resignFirstResponder()
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
