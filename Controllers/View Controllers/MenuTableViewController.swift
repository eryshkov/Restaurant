//
//  MenuTableViewController.swift
//  Restaurant
//
//  Created by Evgeniy Ryshkov on 19/11/2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit


class MenuTableViewController: UITableViewController {
    
    let rowHeight: CGFloat = 60
    let menuController = MenuController()
    var categorySelected: String?
    var menuItems: [MenuItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let category = categorySelected else { fatalError("Category not found at \(#function) \(#file) line \(#line)") }
        
        menuController.fetchMenuItems(forCategory: category) { [unowned self] (serverMenuItems) in
            if let menuItems = serverMenuItems {
                self.updateUI(with: menuItems)
            }
        }
    }
    
    func layoutSetup() {
        tableView.tableFooterView = UIView()
        
        navigationItem.title = categorySelected?.capitalized
    }
    
    func updateUI(with menuItems: [MenuItem]) {
        self.menuItems = menuItems
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return menuItems?.count ?? 0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as? MenuTableViewCell else {
            fatalError("Cannot cast MenuTableViewCell at \(#function) \(#file) line \(#line)")
        }
        
        cell.update(with: menuItems![indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueID = segue.identifier else {
            fatalError("Undefined segue ID at \(#function) \(#file) line \(#line)")
        }
        
        switch segueID {
        case "ItemDetailSegue":
            guard let dvc = segue.destination as? ItemDetailViewController else {
                fatalError("Cannot cast DVC at \(#function) \(#file) line \(#line)")
            }
            
            guard let indexSelection = tableView.indexPathForSelectedRow?.row else {
                fatalError("Cannot find indexPathForSelectedRow at \(#function) \(#file) line \(#line)")
            }
            
            dvc.itemSelected = menuItems?[indexSelection]
        default:
            fatalError("default segue ID at \(#function) \(#file) line \(#line)")
        }
     }
     
    
}
