//
//  ProtocolsTableViewController.swift
//  MedNews
//
//  Created by Sawka Ostap on 14.04.2020.
//  Copyright © 2020 SavkaOstap. All rights reserved.
//

import UIKit

class ProtocolsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "protocolCell", for: indexPath) as! ProtocolsTableViewCell

        return cell
    }

   
    @IBAction func backAction(_ segue: UIStoryboardSegue) {}

}
