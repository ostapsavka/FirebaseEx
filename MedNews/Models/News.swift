//
//  News.swift
//  MedNews
//
//  Created by Sawka Ostap on 21.05.2020.
//  Copyright © 2020 SavkaOstap. All rights reserved.
//

import Foundation
import Firebase

struct News {
    
    let title: String
    let subTitle: String
    let newsText: String
    let imageName: String
    let ref: DatabaseReference?
    
    init(snapshot: DataSnapshot) {
        let snapshotValue = snapshot.value as! [String: Any]
        title = snapshotValue["nameLabel"] as! String
        subTitle = snapshotValue["subTitle"] as! String
        newsText = snapshotValue["newsText"] as! String
        imageName = snapshotValue["imageName"] as! String
        ref = snapshot.ref
    }
    
}
