//
//  BookingViewController.swift
//  weTravel
//
//  Created by Admin on 6/11/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit

class BookingViewController: UIViewController {

    
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var p_name: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var travelfrom: UILabel!
    @IBOutlet weak var travelto: UILabel!
   
    
    
    @IBOutlet weak var avails: UILabel!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var noAdults: UILabel!
    @IBOutlet weak var noChild: UILabel!
    @IBOutlet weak var total_cost: UILabel!
    
    @IBOutlet weak var adults_stepper: UIStepper!
    
    @IBOutlet weak var child_stepper: UIStepper!
    
    var pkgDetails : CityPackage?
    override func viewDidLoad() {
        super.viewDidLoad()
 print(pkgDetails)
        price.text = "\(String(describing: pkgDetails?.price))"
        p_name.text = pkgDetails?.p_name
        travelto.text = pkgDetails?.travel_to
        travelfrom.text = pkgDetails?.travel_from
         avails.text = "\(pkgDetails?.avail_tickets)"
        price.text = "\( pkgDetails?.price) LE"
        rate.text = "rate : \(pkgDetails?.rate ?? 0)"
        date.text = pkgDetails?.date
        duration.text = "\(pkgDetails?.duration ?? 0) days"

        adults_stepper.maximumValue = Double((pkgDetails?.avail_tickets)!)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeAdultNo(_ sender: UIStepper) {
//        let adultString  = self.noAdults!.text
//        let adults = Double(adultString!)
//        let childs: Double = Double(self.noChild!.text!)!
//
//        if ( Int((adults! + childs)) <= (pkgDetails?.avail_tickets)!){
              self.noAdults.text = "\( sender.value)"
//        }
    }
    
    
    @IBAction func changeChildNo(_ sender: UIStepper) {
//        let adults : Int = Int(self.noAdults!.text!)!
//        let childs : Int = Int(self.noChild!.text!)!
//        if ( (adults + childs) < (pkgDetails?.avail_tickets)!){
            self.noChild.text = "\(sender.value)"
//        }
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
