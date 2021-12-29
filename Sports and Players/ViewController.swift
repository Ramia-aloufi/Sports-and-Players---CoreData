//
//  ViewController.swift
//  Sports and Players
//
//  Created by R on 24/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    let context = (UIApplication.shared.delegate as!AppDelegate).persistentContainer.viewContext

    var arr = [Sport]()

    override func viewDidLoad() {
        super.viewDidLoad()
        read()
        tableView.register(UINib(nibName: "TableCell", bundle: nil), forCellReuseIdentifier: TableCell.Identifier)
    }
    
    //MARK:-addSport

    @IBAction func addSport(_ sender: UIBarButtonItem) {
        showAlert(title: nil)
    }    
    
    //MARK:-TableDatasource
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: TableCell.Identifier, for: indexPath) as! TableCell
        cell.name.text = arr[indexPath.row].name
        if let img = arr[indexPath.row].photo{
        cell.photo.setImage(UIImage(data:img), for: .normal)
        }
        cell.buttonTouchedClosure = { [weak self] in
               print("Button Touched")
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let imagePickerController = UIImagePickerController()
                imagePickerController.sourceType = .photoLibrary
                imagePickerController.delegate = cell.self
                self?.present(imagePickerController, animated: true, completion: nil)
            }
            }
        cell.sport = arr[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 132
    }
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        showAlert(title: arr[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [UIContextualAction(
            style: .destructive,
            title: "Delete",
            handler: { (action, view, nil) in
                self.delete(sport: self.arr[indexPath.row])
        })])
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondVC = storyboard?.instantiateViewController(identifier: "PlayerTableViewController") as! PlayerTableViewController
        navigationController?.pushViewController(secondVC, animated: true)
        secondVC.playerarr = arr[indexPath.row]
    }
    
    //MARK:-showAlert
    
    func showAlert(title:Sport?){
        let titlefound = title?.name
        var tf = UITextField()
        let alert  = UIAlertController(
            title: "Add new Sport",
            message: "",
            preferredStyle: .alert)
        alert.addTextField { (tf1) in
            tf1.placeholder = "add sport"
            tf1.text = title?.name
            tf = tf1
        }
        alert.addAction(UIAlertAction(title: "add", style: .default, handler: { (action) in
            if titlefound == nil{
            self.create(name: tf.text!)
            }else{
                self.update(sport: title!, newname: tf.text!,photo:nil)
            }
            self.tableView.reloadData()

        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    

}




