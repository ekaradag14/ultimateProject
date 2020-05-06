//
//  TicketMasterViewController.swift
//  ultimateProject
//
//  Created by Erencan Karadağ on 3.05.2020.
//  Copyright © 2020 Erencan Karadağ. All rights reserved.
//

import UIKit
import Alamofire
class PhotosViewController: UIViewController {

    @IBOutlet weak var downloadedImage: UIImageView!
    @IBOutlet weak var photoTable: UITableView!
    var photos:[PhotoCell] = [
        PhotoCell(photographer: "Jack Nicholson"),
        PhotoCell(photographer: "Jack Nicholsonson"),
        PhotoCell(photographer: "Jack Nicholsonsonson")
]
var tableViewCell = TableViewCell()
    downloadedImage.image = #imageLiteral(resourceName: "")
    override func viewDidLoad() {
        super.viewDidLoad()
        photoTable.dataSource = self
        photoTable.delegate = self
  
        photoTable.register(UINib(nibName: K.cellNibName , bundle: nil), forCellReuseIdentifier: K.photoCellIdentifier)
            
        
        // Do any additional setup after loading the view.
        self.fetchPhotos()
    }
    
    //
    
    func fetchPhotos() {
        // 1
        
        AF.request("https://api.unsplash.com/photos/?client_id=\(K.unsplashAPIKey)").responseDecodable(of: Unsplash.self){ (response) in
            guard let photos = response.value else { return }
            let remoteURL =  photos[0].urls.small
            
            AF.request(remoteURL).responseData { (response) in
                if response.error == nil {
                    print(response.result)
                    
                    // Show the downloaded image:
                    if let data = response.data {
                        self.downloadedImage.image = UIImage(data: data)

//                        self.tableViewCell.photo.image =
                      
                    }
                }
            }
            
            
        }
    }
}

extension PhotosViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = photoTable.dequeueReusableCell(withIdentifier: K.photoCellIdentifier, for: indexPath) as! TableViewCell
        cell.label.text = photos[indexPath.row].photographer
        cell.photo.image = self.downloadedImage.image
        return cell
    }
    
    
}

extension PhotosViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
      
    }
 
}
