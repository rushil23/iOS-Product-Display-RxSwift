//
//  ViewController.swift
//  iOS-table-swift
//
//  Created by Rushil on 1/17/19.
//  Copyright © 2019 Rushil. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
var subCountCells = 0
class ViewController: UIViewController, UITableViewDataSource {

    //MARK: Attributes and Variable Initialization
    
    @IBOutlet var tableView: UITableView!
    let viewModel = cellViewModel()
    var imageVM = imageViewModel(0,"")
    let bag = DisposeBag()
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.tableView.rowHeight = 40
        print("First Message")
        viewModel.downloadJson() // Starts downloading JSON data as soon as view loads
        viewModel.cellsSubject.subscribe(onNext: { data in
            self.viewModel.cells = data
            subCountCells += 1
            print("Cell Subscription Count \(subCountCells)")
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }).disposed(by: bag)
    }
    
    // MARK: Table Data Populating Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? ListItems else { return UITableViewCell() }
        cell.CellLabel.text = self.viewModel.cells[indexPath.row].title
        // Getting image info
        print("Cell Info \(indexPath.row) and title = \(self.viewModel.cells[indexPath.row].title)")
        imageVM = imageViewModel(indexPath.row, self.viewModel.cells[indexPath.row].thumbnailUrl)
        imageVM.downloadImage() // Async Download
        imageVM.subject.subscribe(onNext: { data in
            print("Imaage Subscription : \(indexPath.row) : \(data)")
                let image = UIImage(data: data)
            DispatchQueue.main.async {
                cell.CellImage.image = image
            }
        }).disposed(by: bag)
        return cell
    }
}

