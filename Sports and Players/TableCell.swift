//
//  TableCell.swift
//  Sports and Players
//
//  Created by R on 25/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {
    
    var buttonTouchedClosure : (()->Void)? //closure
    let vc = ViewController()
    var sport:Sport?

    
    static let Identifier = "TableCell"

    @IBOutlet weak var photo: UIButton!
    
    @IBOutlet weak var name: UILabel!

    //MARK:-addPhoto

    @IBAction func addPhoto(_ sender: UIButton) {
        self.buttonTouchedClosure?()

    }
    
    
}
