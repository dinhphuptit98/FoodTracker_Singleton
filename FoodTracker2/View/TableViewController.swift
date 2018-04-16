//
//  TableViewController.swift
//  FoodTracker2
//
//  Created by dinhphu98 on 4/9/18.
//  Copyright © 2018 dinhphu98. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController ,UISearchBarDelegate {

    
    var searchArr = [Meal]()
    
    @IBOutlet var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        searchBar.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return searchArr.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MealTableViewCell
        cell?.nameLabel.text = searchArr[indexPath.row].name
        cell?.photoImageView.image = searchArr[indexPath.row].photo
        cell?.ratingControll.rating = searchArr[indexPath.row].rating!
     
        // Configure the cell...

        return cell!
    }
    
    // nut search
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            searchArr = DataSerVice.shared.meals
        } else {
            searchArr = DataSerVice.shared.meals.filter({ mealSearch -> Bool in
                (mealSearch.name!.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil)
            })
        }
        tableView.reloadData()
    }
    
    // truyen du lieu di
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if (segue.identifier ?? "") == "edit" {
            
            let vc = segue.destination as? ViewController
            
            let selectedMealCell = sender as? MealTableViewCell
            
            if let indexpath = tableView.indexPath(for: selectedMealCell!) {
                  let selectedMeal = DataSerVice.shared.meals[indexpath.row]
                    vc?.meal = selectedMeal
            }
        }
    }

    //eit and add
    @IBAction func uwind (sender : UIStoryboardSegue) {
        if let vc = sender.source as? ViewController , let meal = vc.meal {
            if let index = tableView.indexPathForSelectedRow {
                DataSerVice.shared.meals[index.row] = meal
                tableView.reloadRows(at: [index], with: .none)
            }
            else {
                let newIndex = IndexPath(row: DataSerVice.shared.meals.count, section: 0)
                DataSerVice.shared.meals.append(meal)
                tableView.insertRows(at: [newIndex], with: .automatic)
            }
        }
    }
    
    // delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DataSerVice.shared.meals.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
}


