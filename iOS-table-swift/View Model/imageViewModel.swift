//
//  imageViewModel.swift
//  rxswift-ios
//
//  Created by Rushil on 1/19/19.
//  Copyright © 2019 Rushil. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class imageViewModel{
    
    //MARK: Attributes
    var ind: Int
    var imageUrl: String
    var subject = PublishSubject<Data>()
    
    //MARK: Initializer
    init(_ ind: Int, _ imageUrl: String){
        self.ind = ind
        self.imageUrl = imageUrl
    }
    
    //MARK: Async Function to download the cell image/thumbnail
    func downloadImage(){
        if let imageURL = URL(string: self.imageUrl) {
            DispatchQueue.global().async { // Async session on a global thread
                let data = try? Data(contentsOf: imageURL) //
                if let data = data { // if data ! = nil
                    self.subject.onNext(data) // Send the new image data over to subscribers
                }
            }
        }
    }
    
    
}
