//
//  jsonViewModel.swift
//  rxswift-ios
//
//  Created by Rushil on 1/19/19.
//  Copyright © 2019 Rushil. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class cellViewModel{
    
    //MARK: Data Attributes
    let url = URL(string: "https://jsonplaceholder.typicode.com/albums/1/photos")
    var cells = [Cell]() // The Model
    var cellsSubject = PublishSubject<[Cell]>() // Notifies when cellData is loaded from JSON URL session
    
    init() {
        self.cells = []
    }
    
    // Function to download and decode the JSON information from URL
    func downloadJson(){

        guard let downloadURL = url else { return } //guard needed because URL link may fail / =nil
        URLSession.shared.dataTask(with: downloadURL) { data, response, error in
            guard let data = data, error==nil, response != nil else{
                print("Download Failed")
                return
            }
            print("Downloaded Json")
            // Decode Data!
            do{
                // Decoding JSON data fetched from URL
                let decoder = JSONDecoder()
                self.cells = try decoder.decode([Cell].self, from: data)
                self.cellsSubject.onNext(self.cells)
            } catch {
                print("Decoding Error")
            }
        }.resume()
    }
}
