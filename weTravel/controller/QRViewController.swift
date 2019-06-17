//
//  QRViewController.swift
//  weTravel
//
//  Created by Admin on 6/11/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit

class QRViewController: UIViewController {

    @IBOutlet weak var qrImage: UIImageView!
    
    @IBOutlet weak var travelTo: UILabel!
   
    @IBOutlet weak var travelFrom: UILabel!
    @IBOutlet weak var package_date: UILabel!
    
    
    @IBOutlet weak var adults: UILabel!
    
    @IBOutlet weak var childs: UILabel!
    
    @IBOutlet weak var total_cost: UILabel!
    var pkgDetails : CityPackage?
    
    var pkgBooked : BookPackage?
    override func viewDidLoad() {
        super.viewDidLoad()
        
         print(pkgDetails)
       
        travelTo.text = pkgDetails?.travel_to
        travelFrom.text = pkgDetails?.travel_from
         package_date.text = pkgDetails?.date
         adults.text = "\(pkgBooked?.adults) X adults"
         childs.text = "\(pkgBooked?.children)  X adults"
        // total_cost.text = "\(pkgBooked?.totalCost )  LE"
        
        
        
        
        
        
        let myString = "https://pennlabs.org"
        // Get data from the string
        let data = myString.data(using: String.Encoding.ascii)
        // Get a QR CIFilter
        guard let qrFilter = CIFilter(name: "CIQRCodeGenerator") else { return }
        // Input the data
        qrFilter.setValue(data, forKey: "inputMessage")
        // Get the output image
        guard let qrImage = qrFilter.outputImage else { return }
        // Scale the image
        let transform = CGAffineTransform(scaleX: 10, y: 10)
        let scaledQrImage = qrImage.transformed(by: transform)
        // Do some processing to get the UIImage
        let context = CIContext()
        guard let cgImage = context.createCGImage(scaledQrImage, from: scaledQrImage.extent) else { return }
      //  let processedImage = UIImage(cgImage: cgImage)
         self.qrImage.image = UIImage(cgImage: cgImage)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToHome(_ sender: Any) {
//        var  pkgdetails = BookingViewController()
//        pkgdetails = self.storyboard!.instantiateViewController(withIdentifier: "bookingvc") as! BookingViewController
//        pkgdetails.pkgDetails = pkgDetails
//        
//        self.navigationController?.pushViewController(pkgdetails, animated: true)
//        
    
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
