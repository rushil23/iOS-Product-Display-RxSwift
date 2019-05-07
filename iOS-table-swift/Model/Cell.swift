//
//  Cell.swift
//  iOS-table-swift
//
//  Created by Rushil on 1/17/19.
//  Copyright © 2019 Rushil. All rights reserved.
//

import UIKit

class Cell: Codable {

    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
    
    init(albumId: Int, id: Int, title: String, url: String, thumbnailUrl: String) {
        self.albumId = albumId
        self.id = id
        self.title = title
        self.url = url
        self.thumbnailUrl = thumbnailUrl
    }
    
    
}
