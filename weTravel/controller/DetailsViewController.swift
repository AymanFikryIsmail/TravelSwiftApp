//
//  DetailsViewController.swift
//  weTravel
//
//  Created by Admin on 6/9/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var pkgImage: UIImageView!
    @IBOutlet weak var arrivalCity: UILabel!
    
    @IBOutlet weak var departureCity: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var days: UILabel!
    @IBOutlet weak var departCity2: UILabel!

    @IBOutlet weak var arrivalCity2: UILabel!
   
    
    var pkgDetails : CityPackage?
    override func viewDidLoad() {
        super.viewDidLoad()
        print(pkgDetails)
//        price.text = "\(String(describing: pkgDetails?.price))"
//        arrivalCity.text = pkgDetails?.travel_to
//        arrivalCity2.text = pkgDetails?.travel_to
//        departCity2.text = pkgDetails?.travel_from
//        departureCity.text = pkgDetails?.travel_from
//        rate.text = "\(pkgDetails?.rate ?? 0)"
//        date.text = pkgDetails?.date
//        days.text = "\(pkgDetails?.duration ?? 0)"
//
//        SetImage(url : "");
        // Do any additional setup after loading the view.
    }
    func SetImage(url:String){
        //paralel process
        let catPictureURL = URL(string: "http://172.16.5.220:3000/\(pkgDetails?.paths[0] ?? "")")!
        let session = URLSession(configuration: .default)
        
        // Define a download task. The download task will download the contents of the URL as a Data object and then you can do what you wish with that data.
        let downloadPicTask = session.dataTask(with: catPictureURL) { (data, response, error) in
            // The download has finished.
            if let e = error {
                print("Error downloading cat picture: \(e)")
            } else {
                // No errors found.
                // It would be weird if we didn't have a response, so check for that too.
                if (response as? HTTPURLResponse) != nil {
                    //  print("Downloaded cat picture with response code \(res.statusCode)")
                    if let imageData = data {
                        // Finally convert that Data into an image and do what you wish with it.
                        self.pkgImage.image = UIImage(data: imageData)
                        // myimage.image = UIImage(named: movieList[indexPath.row].image!)
                        // Do something with your image.
                        
                    } else {
                        print("Couldn't get image: Image is nil")
                    }
                } else {
                    print("Couldn't get response code for some reason")
                }
            }
        }
        
        downloadPicTask.resume()
    }
    @IBAction func gotoBooking(_ sender: Any) {
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
