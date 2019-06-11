//
//  CityPackageViewController.swift
//  weTravel
//
//  Created by Admin on 6/7/19.
//  Copyright © 2019 ITI. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"


class PackageViewCell: UICollectionViewCell {
    
    

    @IBOutlet weak var packageName: UILabel!
    
    @IBOutlet weak var packageImage: UIImageView!
    func SetImage(url:String){
        //paralel process
        let catPictureURL = URL(string: "http://172.16.5.220:3000/\(url)")!
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
                        self.packageImage.image = UIImage(data: imageData)
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
}
class CityPackageViewController: UIViewController  , UICollectionViewDataSource , UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.packages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "citypackagecell", for: indexPath) as! PackageViewCell
        let data = self.packages[indexPath.row]
        cell.packageName.text = data.p_name
        cell.SetImage(url: data.paths[0])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //pkgdetails
        let pkg = self.packages[indexPath.row]
        let storyBoard : UIStoryboard = UIStoryboard(name: "DetailsStoryboard", bundle:nil)
       var  pkgdetails = DetailsViewController()
         pkgdetails = storyBoard.instantiateViewController(withIdentifier: "pkgDetails") as! DetailsViewController
          pkgdetails.pkgDetails = pkg
      //  self.present(pkgdetails, animated:true, completion:nil)
         self.navigationController?.pushViewController(pkgdetails, animated: true)
    
      
    }
    

    @IBOutlet weak var collectionview: UICollectionView!
    var city : City?
    var packages : [CityPackage] = [CityPackage]()
    override func viewDidLoad() {
        super.viewDidLoad()

        APICallManager.instance.getCityPackages(city: (city?.city_name)!) { (response) in
            switch response{
            case.done(value: let result):
                print(result)
                self.packages = result
                self.collectionview.reloadData()
             
                break
            case.failed(let message):
                print(message)
                break
            }
        }
  
        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

//    override func numberOfSections(in collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of items
//        return 0
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
//
//        // Configure the cell
//
//        return cell
//    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
