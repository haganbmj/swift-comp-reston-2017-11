//
// Copyright (C) 2016 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import UIKit


class PersonsTableViewController: UITableViewController
{
    @IBOutlet var dataSource: PersonDataSource?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailController = segue.destination as? PersonDetailTableViewController,
            let indexPath = tableView?.indexPathForSelectedRow else { return }
        
        detailController.person = dataSource?.person(at: indexPath)
    }
}
