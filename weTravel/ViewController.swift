//
//  ViewController.swift
//  weTravel
//
//  Created by Admin on 6/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

let userDefault = UserDefault()
override func viewDidLoad() {
        super.viewDidLoad()
   
        // Do any additional setup after loading the view, typically from a nib.
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
         //  if (self.userDefault.getWalkThroughVisibilty() == true){
                 if (self.userDefault.getUserID() == 0){
                  self.performSegue(withIdentifier: "loginsegue", sender: self)
            }else{
//                    let storyBoard: UIStoryboard = UIStoryboard(name: "HomeStoryboard", bundle: nil)
//                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "home") as! HomeViewController
//                    self.present(newViewController, animated: true, completion: nil)
self.performSegue(withIdentifier: "home", sender: self)            }
            
        })
    }


}

