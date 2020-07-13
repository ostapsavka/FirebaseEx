//
//  NewsTableViewController.swift
//  MedNews
//
//  Created by Sawka Ostap on 14.04.2020.
//  Copyright © 2020 SavkaOstap. All rights reserved.
//

import UIKit
import Firebase

class NewsTableViewController: UITableViewController {
    
    var news = Array<News>()
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ref.observe(.value, with: { [weak self] (snapshot) in
            var _news = Array<News>()
            for i in snapshot.children {
                let news = News(snapshot: i as! DataSnapshot)
                _news.append(news)
            }
            self?.news = _news
            self?.tableView.reloadData()
        })
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return news.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as? NewsTableViewCell {

            cell.imageOfNews.layer.cornerRadius = cell.imageOfNews.frame.size.height / 8
            
            let newsTitle = news[indexPath.row].title
            let newsSubTitle = news[indexPath.row].subTitle
            let imageName = news[indexPath.row].imageName
            let storageRef = Storage.storage().reference(withPath: "newsPhoto/\(imageName).JPG")
            
            storageRef.getData(maxSize: 10 * 1024 * 1024) { (data, error) in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    return
                }
                if let data = data {
                    cell.imageOfNews.image = UIImage(data: data)
                }
            }
            
            cell.nameLabel.text = newsTitle
            cell.descriptionLabel.text = newsSubTitle
                
            return cell
        }
        
        return UITableViewCell()
    }
            
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let _news = news[indexPath.row]
            let navVC = segue.destination as! UINavigationController
            let detailVC = navVC.viewControllers.first as! DetailNewsTableViewController //DetailViewController
            navVC.modalPresentationStyle = .fullScreen
            detailVC.currentNews = _news
        }
    }
    
    @IBAction func returnAction(_ segue: UIStoryboardSegue) {} 
}
