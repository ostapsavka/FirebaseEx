//
//  DetailViewController.swift
//  MedNews
//
//  Created by Sawka Ostap on 29.05.2020.
//  Copyright © 2020 SavkaOstap. All rights reserved.
//

import UIKit
import Firebase

class DetailViewController: UIViewController {
    
    var currentNews: News?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailNews()
    }
    
    private func detailNews() {
        if currentNews != nil {
            titleLabel.text = currentNews?.title
            subtitleLabel.text = currentNews?.subTitle
            textLabel.text = currentNews?.newsText
            let imageNameDat = currentNews!.imageName
            let storageRef = Storage.storage().reference(withPath: "newsPhoto/\(imageNameDat).JPG")
            storageRef.getData(maxSize: 10 * 1024 * 1024) { [weak self] (data, error) in
                    if let error = error {
                        print("Error: \(error.localizedDescription)")
                        return
                    }
                    if let data = data {
                        self?.image.image = UIImage(data: data)
                    }
                }
        }
    }
}
