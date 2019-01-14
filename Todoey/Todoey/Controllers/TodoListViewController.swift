//
//  ViewController.swift
//  Todoey
//
//  Created by Aaryan Garg on 12/01/19.
//  Copyright © 2019 Robin Garg. All rights reserved.
//

import UIKit
import CoreData

class TodoListViewController: UITableViewController {
    let itemsKey = "TodoListItemsKey"
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var itemArray = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
        loadData()
    }

    @IBAction func onTapAddItem(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Create new item"
        }
        let actionAdd = UIAlertAction(title: "Add Item", style: .default) { (action) in
            if let itemText = alert.textFields?[0].text {
                let item = Item(context: self.context)
                item.title = itemText
                
                self.itemArray.append(item)
                self.saveData()
                
                self.tableView.reloadData()
            }
        }
        alert.addAction(actionAdd)
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(actionCancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    func loadData() {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        
        do {
            itemArray = try context.fetch(request)
        } catch {
            print("Error in fetching data \(error)")
        }
    }
    
    func saveData() {
        do {
            try context.save()
        } catch {
            print("Error in saving data to database")
        }
    }
}

extension TodoListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListItem", for: indexPath)
        cell.accessoryType = .none
        
        cell.textLabel?.text = itemArray[indexPath.row].title
        if itemArray[indexPath.row].completed {
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        
        let item = itemArray[indexPath.row]
        item.completed = !item.completed
        saveData()
        
        tableView.reloadData()
    }
}
