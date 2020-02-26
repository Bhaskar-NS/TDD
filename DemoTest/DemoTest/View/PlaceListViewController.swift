//
//  PlaceListViewController.swift
//  DemoTest
//
//  Created by Bhaskar NS3 on 25/02/20.
//  Copyright © 2020 Bhaskar NS3. All rights reserved.
//

import UIKit

class PlaceListViewController: UIViewController {

    // Mark: - IBoutlets
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var placeTableView: UITableView!
    
    // Mark: - Properties
    
    let viewModel = PlaceListViewModel(dataFetcher: PlaceDataFetcher())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        viewModel.viewDidLoad()
        headerLabel.text = viewModel.title
        placeTableView.estimatedRowHeight = 100
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PlaceListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PlaceTableViewCell
        let cellDataModel = viewModel.tableCellDataModelForIndexPath(indexPath)
        cell.configureCell(model: cellDataModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
