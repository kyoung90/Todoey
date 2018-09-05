//
//  ViewController.swift
//  Todoey
//
//  Created by SkillsUSA on 8/30/18.
//  Copyright © 2018 Kenneth Young. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [item]()
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let newItem = item()
        newItem.title = "Find Mike";
        itemArray.append(newItem);
        
        let newItem2 = item()
        newItem2.title = "Buy Eggos";
        itemArray.append(newItem2);
        
        let newItem3 = item()
        newItem3.title = "Destroy Demogorgon";
        itemArray.append(newItem3);
        

        
        if let item = defaults.array(forKey: "TodoListArray") as? [item]{
            itemArray = item
        }
        
    }
    
    //Mark - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row].title
        
//        if (tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark){
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        }
//        else{
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }

        cell.accessoryType = itemArray[indexPath.row].done == true ? .checkmark : .none
        
        return cell
    }
    
    //Mark - Tableview Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(itemArray[indexPath.row])
        
            itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
//        if (itemArray[indexPath.row].done){
//            itemArray[indexPath.row].done = false;
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        }
//        else{
//            itemArray[indexPath.row].done = true;
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }

        
//        if (tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark){
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        }
//        else{
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //Mark - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //What will happen once the user clicks on the Add Item button on our UIAlert
            
            let newItem = item()
            newItem.title = textField.text!;
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    


}

