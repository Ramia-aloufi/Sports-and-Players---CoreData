//
//  extensions.swift
//  Sports and Players
//
//  Created by R on 25/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//

import Foundation
import UIKit

extension ViewController{
    
    func create(name: String){
        let sportItem = Sport(context: context) // important
        sportItem.name = name
        sportItem.photo = nil
        sportItem.id = UUID()
            do {
                try context.save()
                print("create() Success")
                read()
            } catch {
                print("\(error)")
        }
    }
    
    func read(){
        do {
            arr = try context.fetch(Sport.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            print("getTask() Success")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func update(sport:Sport,newname:String,photo:Data?){
        sport.name = newname
        sport.photo = photo
        do {
              try context.save()
              print("upd() Success")
               read()
                       
            } catch {
               print("\(error)")
        }
    }
    
    func delete(sport:Sport){
        context.delete(sport)
        
            do {
                try context.save()
                print("del() Success")
                read()
                
            } catch {
                print("\(error)")
        }

    }
    

    
}

extension PlayerTableViewController{

    func create(name: String,age:Double,height:Double){
    let playerItem = Player(context: context) // important
    playerItem.name = name
    playerItem.age = age
    playerItem.height = height
    playerItem.id = UUID()
        playerarr?.addToSportToPlayer(playerItem)
      //  let vc = ViewController()
        do {
            try context.save()
            print("create() Success")
         //   vc.read()
        } catch {
            print("\(error)")
    }
}

func update(playerItem:Player,name: String,age:Double,height:Double){
    playerItem.name = name
    playerItem.age = age
    playerItem.height = height
   // let vc = ViewController()

    do {
          try context.save()
          print("upd() Success")
     //   vc.read()
        } catch {
           print("\(error)")
    }
}
    
    func delete(player:Player){
        playerarr?.removeFromSportToPlayer(player)
        
            do {
                try context.save()
                print("del() Success")                
            } catch {
                print("\(error)")
        }

    }


}


extension TableCell:UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let tempImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        photo.setImage(tempImage, for: .normal)
        picker.dismiss(animated: true, completion: nil)
        vc.update(sport: sport!, newname: sport!.name!,photo:tempImage.pngData() as Data?)

    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
        

}
