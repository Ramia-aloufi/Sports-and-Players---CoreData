//
//  PlayerTableViewController.swift
//  Sports and Players
//
//  Created by R on 25/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//

import UIKit

class PlayerTableViewController: UITableViewController {
    var playerarr :Sport?
    let context = (UIApplication.shared.delegate as!AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TableCell", bundle: nil), forCellReuseIdentifier: TableCell.Identifier)
              }
    //MARK:-addPlayer
    @IBAction func addPlayer(_ sender: UIBarButtonItem) {
        showAlert(title: nil)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (playerarr?.sportToPlayer!.count)!
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.Identifier, for: indexPath) as! TableCell
        let playerRow = (playerarr!.sportToPlayer!.allObjects as! [Player])[indexPath.row]
        print(playerRow)
        cell.name.text = "name:\(playerRow.name!),age:\(playerRow.age),height:\(playerRow.height)"
        print("name:\(playerRow.name!),age:\(playerRow.age),height:\(playerRow.height)")
        cell.photo.isHidden = true
        return cell
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
       let playerRow = (playerarr!.sportToPlayer!.allObjects as! [Player])[indexPath.row]
        showAlert(title: playerRow)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let playerRow = (playerarr!.sportToPlayer!.allObjects as! [Player])[indexPath.row]
        return UISwipeActionsConfiguration(actions: [UIContextualAction(
            style: .destructive,
            title: "Delete",
            handler: { (action, view, nil) in
                self.delete(player: playerRow)
                self.tableView.reloadData()

        })])
    }

    // MARK: - TshowAlert

    func showAlert(title:Player?){
        let titlefound = title?.name
        var name = UITextField()
        var age = UITextField()
        var height = UITextField()

        let alert  = UIAlertController(
            title: "Add new Sport",
            message: "",
            preferredStyle: .alert)
        alert.addTextField { (tf1) in
            tf1.placeholder = "add sport"
            tf1.text = title?.name
            name = tf1
        }
        alert.addTextField { (tf1) in
            tf1.placeholder = "add sport"
            tf1.text = title?.name
            age = tf1
        }
        alert.addTextField { (tf1) in
            tf1.placeholder = "add sport"
            tf1.text = title?.name
            height = tf1
        }
        alert.addAction(UIAlertAction(title: "add", style: .default, handler: { (action) in
            if titlefound == nil{
                if let name = name.text,let age = Double(age.text!) ,let height = Double(height.text!){
                    self.create(name: name, age: age , height:height)
                }
            }else{
                if let name = name.text,let age = Double(age.text!) ,let height = Double(height.text!){
                self.update(playerItem: title!,name: name, age: age , height:height)
                }
            }
            self.tableView.reloadData()

        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}
