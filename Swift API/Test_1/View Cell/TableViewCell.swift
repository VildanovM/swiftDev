//
//  TableViewCell.swift
//  Test_1
//
//  Created by Максим Вильданов on 08.06.2018.
//  Copyright © 2018 Максим Вильданов. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var imageSwift: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        circleImageCreate()
        // Configure the view for the selected state
    }
    
    func circleImageCreate() {
        imageSwift.layer.cornerRadius = imageSwift.frame.size.width / 2
        imageSwift.clipsToBounds = true
    }
    
    
    
    
}
