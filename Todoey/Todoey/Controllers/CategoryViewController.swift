//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Aaryan Garg on 15/01/19.
//  Copyright © 2019 Robin Garg. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var arrCategories = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        reloadData()
    }
    
    func reloadData(with request: NSFetchRequest<Category> = Category.fetchRequest()) {
        do {
            arrCategories = try context.fetch(request)
        } catch {
            print("Error while fetching categories")
        }
        tableView.reloadData()
    }
    
    func saveCategory(_ categoryName: String) -> Void {
        let category = Category(context: context)
        category.name = categoryName
        
        do {
            try context.save()
        } catch {
            print("Error while saving category")
        }
        
        arrCategories.append(category)
        tableView.reloadData()
    }

    @IBAction func onTapAddCategory(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add Category", message: "", preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "Enter category name"
        }
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(actionCancel)
        
        let actionCreate = UIAlertAction(title: "Create", style: .default) { (action) in
            if let categoryStr = alert.textFields?.first?.text, categoryStr.count > 0 {
                self.saveCategory(categoryStr)
            } else {
                print("Please enter category name")
            }
        }
        alert.addAction(actionCreate)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrCategories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = arrCategories[indexPath.row].name
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let todoListController = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            todoListController.selectedCateogry = arrCategories[indexPath.row]
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
