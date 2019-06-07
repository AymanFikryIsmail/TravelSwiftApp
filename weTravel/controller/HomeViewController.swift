//
//  HomeViewController.swift
//  weTravel
//
//  Created by Admin on 6/5/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {
  
    @IBOutlet weak var cityName: UILabel!
    
    @IBOutlet weak var cityImage: UIImageView!
    func SetImage(url:String){
        //paralel process
        let catPictureURL = URL(string: "http://172.16.5.220:3000/3.jpg")!
        let session = URLSession(configuration: .default)
        
        // Define a download task. The download task will download the contents of the URL as a Data object and then you can do what you wish with that data.
        let downloadPicTask = session.dataTask(with: catPictureURL) { (data, response, error) in
            // The download has finished.
            if let e = error {
                print("Error downloading cat picture: \(e)")
            } else {
                // No errors found.
                // It would be weird if we didn't have a response, so check for that too.
                if let res = response as? HTTPURLResponse {
                    //  print("Downloaded cat picture with response code \(res.statusCode)")
                    if let imageData = data {
                        // Finally convert that Data into an image and do what you wish with it.
                       self.cityImage.image = UIImage(data: imageData)
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
        
        
        
        
        
        
        
//
//
//        DispatchQueue.global().async {
//
//            do{
//                // load json server
//                let AppURL=URL(string: "http:172.16.5.220:3000/"+url)!
//                let data=try Data(contentsOf: AppURL)
//
//                // access to UI
//                DispatchQueue.global().sync {
//                    self.cityImage.image = UIImage(data: data)
//                }
//
//            }
//            catch {
//                print("cannot load from server")
//            }
//
//        }
    }
    
}
class HomeViewController: UIViewController  , UITableViewDelegate , UITableViewDataSource{

    @IBOutlet weak var cityTable: UITableView!
    var cities : [City] = [City]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        APICallManager.instance.callAPIGetCity(onSuccess: {(cities) in
            print(cities)
           self.cities=cities
            self.cityTable.reloadData()
        }
            ,onFailure: { (errorMessage) in
                print(errorMessage)
        })
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "citycell", for: indexPath) as! CityTableViewCell
        let data = self.cities[indexPath.row]
        cell.cityName.text = data.city_name
        cell.SetImage(url: data.city_photo)
        

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = self.cities[indexPath.row]
        var  cityDetail  = CityPackageViewController()
        cityDetail = self.storyboard?.instantiateViewController(withIdentifier: "citypackage") as! CityPackageViewController
      
         cityDetail.city = city
        
     
       cityDetail.hidesBottomBarWhenPushed = true;
    
       self.navigationController?.pushViewController(cityDetail, animated: true)
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
