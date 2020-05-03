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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
                    }
                }
            }
            
            
        }
    }
}
