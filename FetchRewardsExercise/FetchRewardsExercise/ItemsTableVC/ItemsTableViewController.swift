//
//  ItemsTableViewController.swift
//  FetchRewardsExercise
//
//  Created by Luqmaan Khan on 10/28/20.
//

import UIKit

class ItemsTableViewController: UITableViewController {
        
    let dataLoader = DataLoader()
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        return cell
    }
}
