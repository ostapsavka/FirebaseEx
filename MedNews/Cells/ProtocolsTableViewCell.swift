//
//  ProtocolsTableViewCell.swift
//  MedNews
//
//  Created by Sawka Ostap on 14.04.2020.
//  Copyright © 2020 SavkaOstap. All rights reserved.
//

import UIKit

class ProtocolsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
}
