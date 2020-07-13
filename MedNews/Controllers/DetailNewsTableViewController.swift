//
//  DetailNewsTableViewController.swift
//  MedNews
//
//  Created by Sawka Ostap on 29.05.2020.
//  Copyright © 2020 SavkaOstap. All rights reserved.
//

import UIKit
import Firebase

class DetailNewsTableViewController: UITableViewController {
    
    var currentNews: News?
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath) as! TitleTableViewCell
            cell.titleLabel.text = currentNews?.title
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "subtitleCell", for: indexPath) as! SubtitleTableViewCell
            cell.subtitleLabel.text = currentNews?.subTitle
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "imageViewCell", for: indexPath) as! ImageTableViewCell
            let imageName = currentNews?.imageName
            let storageRef = Storage.storage().reference(withPath: "newsPhoto/\(imageName!).JPG")

            storageRef.getData(maxSize: 10 * 1024 * 1024) { (data, error) in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    return
                }
                if let data = data {
                    cell.newsImage.image = UIImage(data: data)
                }
            }
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "textCell", for: indexPath) as! NewsTextTableViewCell
            cell.newsTextLabel.text = currentNews?.newsText
            default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
}
