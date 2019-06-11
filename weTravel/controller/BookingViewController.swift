//
//  BookingViewController.swift
//  weTravel
//
//  Created by Admin on 6/11/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit

class BookingViewController: UIViewController {

    
    var pkgDetails : CityPackage?
    override func viewDidLoad() {
        super.viewDidLoad()
 print(pkgDetails)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func bookPackage(_ sender: Any) {
   
        var  pkgdetails = QRViewController()
        pkgdetails = self.storyboard!.instantiateViewController(withIdentifier: "qrvc") as! QRViewController
        pkgdetails.pkgDetails = pkgDetails
        
        self.navigationController?.pushViewController(pkgdetails, animated: true)
        
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
