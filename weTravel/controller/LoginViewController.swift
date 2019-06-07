//
//  LoginViewController.swift
//  weTravel
//
//  Created by Admin on 6/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    let userDefault = UserDefault()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: Any) {
        
        
        let   user = User(id: 0, name: "", email: emailField.text!, password: passwordField.text!, user_phone: "", city: "")
        
        APICallManager.instance.login(user: user ) { (response) in
            switch response{
            case.done(value: let result):
              print(result)
              self.userDefault.setUserId(userId: result.id)
                self.performSegue(withIdentifier: "HomeScreenSegue", sender: self)
                break
            case.failed(let message):
               print(message)
                break
            }
        }
      
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
