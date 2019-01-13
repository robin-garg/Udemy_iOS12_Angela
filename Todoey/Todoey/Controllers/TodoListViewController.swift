//
//  ViewController.swift
//  Todoey
//
//  Created by Aaryan Garg on 12/01/19.
//  Copyright © 2019 Robin Garg. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    let itemsKey = "TodoListItemsKey"
    
    let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("TodoList.plist")
    
    var itemArray = [TodoItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadData()
    }

    @IBAction func onTapAddItem(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.placeholder = "Create new item"
        }
        let actionAdd = UIAlertAction(title: "Add Item", style: .default) { (action) in
            if let item = alert.textFields?[0].text {
                self.itemArray.append(TodoItem(title: item))
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
        if let data = try? Data(contentsOf: filePath!) {
            let decoder = PropertyListDecoder()
            do {
                itemArray = try decoder.decode([TodoItem].self, from: data)
            } catch {
                print("No items saved!")
            }
        }
    }
    
    func saveData() {
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(self.itemArray)
            try data.write(to: filePath!)
        } catch {
            print("Error in saving data")
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        
        let item = itemArray[indexPath.row]
        item.completed = !item.completed
        saveData()
        tableView.reloadData()
    }
}
