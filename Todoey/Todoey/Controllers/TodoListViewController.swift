//
//  ViewController.swift
//  Todoey
//
//  Created by Aaryan Garg on 12/01/19.
//  Copyright © 2019 Robin Garg. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework

class TodoListViewController: SwipeableTableViewController {
	let itemsKey = "TodoListItemsKey"
	
	@IBOutlet weak var searchBar: UISearchBar!
	
	let realm = try! Realm()
	
	var selectedCateogry: Category? {
		didSet {
			reloadData()
		}
	}
	var itemArray: Results<Item>?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		tableView.rowHeight = 60
		tableView.separatorStyle = .none
		
	}
	
	override func viewWillAppear(_ animated: Bool) {
		title = selectedCateogry?.name
		
		if let color = selectedCateogry?.bgHexColor {
			updateNavigation(withHexColor: color)
		}
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		updateNavigation(withHexColor: "FF9300")
	}
	
	func updateNavigation(withHexColor colorHexCode: String) {
		guard let navBar = navigationController?.navigationBar else { fatalError() }
		
		guard let navBarColor = UIColor(hexString: colorHexCode) else { fatalError() }
		
		navBar.barTintColor = navBarColor
		navBar.tintColor = ContrastColorOf(navBarColor, returnFlat: true)
		navBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: ContrastColorOf(navBarColor, returnFlat: true)]
		
		searchBar.barTintColor = navBarColor
	}
	
	@IBAction func onTapAddItem(_ sender: UIBarButtonItem) {
		let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
		alert.addTextField { (textField) in
			textField.placeholder = "Create new item"
		}
		let actionAdd = UIAlertAction(title: "Add Item", style: .default) { (action) in
			guard let itemText = alert.textFields?[0].text else {
				return
			}
			if let category = self.selectedCateogry {
				do {
					try self.realm.write {
						let item = Item()
						item.title = itemText
						item.createdAt = Date()
						category.items.append(item)
					}
				} catch {
					print("Error saving item")
				}
				self.tableView.reloadData()
			}
		}
		alert.addAction(actionAdd)
		let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
		alert.addAction(actionCancel)
		
		present(alert, animated: true, completion: nil)
	}
	
	func reloadData() {
		itemArray = selectedCateogry?.items.sorted(byKeyPath: "createdAt", ascending: true)
		
		tableView.reloadData()
	}
	
	override func delete(at indexPath: IndexPath) {
		if let item = itemArray?[indexPath.row] {
			do {
				try realm.write {
					realm.delete(item)
				}
			} catch {
				print("Error updating item")
			}
		}
	}
}

extension TodoListViewController {
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return itemArray?.count ?? 1
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = super.tableView(tableView, cellForRowAt: indexPath)
		cell.accessoryType = .none
		
		if let item = itemArray?[indexPath.row] {
			cell.textLabel?.text = item.title
			if let color = UIColor(hexString: selectedCateogry!.bgHexColor)?.darken(byPercentage: (CGFloat(indexPath.row) / CGFloat(itemArray!.count))) {
				cell.backgroundColor = color
				cell.textLabel?.textColor = ContrastColorOf(color, returnFlat: true)
			}
			if item.completed {
				cell.accessoryType = .checkmark
			}
		} else {
			cell.textLabel?.text = "No Items added yet"
		}
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
		return .delete
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView .deselectRow(at: indexPath, animated: true)
		
		if let item = itemArray?[indexPath.row] {
			do {
				try realm.write {
					//                    realm.delete(item)
					item.completed = !item.completed
				}
			} catch {
				print("Error updating item")
			}
		}
		tableView.reloadData()
	}
}

extension TodoListViewController: UISearchBarDelegate {
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		
		itemArray = itemArray?.filter("title CONTAINS[cd] %@", searchBar.text!).sorted(byKeyPath: "createdAt", ascending: true)
		
	}
	
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		if searchText.count == 0 {
			reloadData()
			
			DispatchQueue.main.async {
				searchBar.resignFirstResponder()
			}
		}
	}
}
