//
//  TopTableViewController.swift
//  DetailDisplayWithScrollViewSample
//
//  Created by Morita Jun on 2018/01/27.
//  Copyright © 2018年 test. All rights reserved.
//

import UIKit

class TopTableViewController: UITableViewController {

    // MARK: - Properties
    
    private enum RowType: Int {
        case fullDisplay = 0
        case partmentDisplay
        
        static var count: Int { return RowType.partmentDisplay.rawValue + 1 }
    }
    
    // MARK: - LifeCycle Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RowType.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if indexPath.row == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath)
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "SecondCell", for: indexPath)
        }
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.isShownDetailSection = (indexPath.row == 1)
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
