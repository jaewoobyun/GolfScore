//
//  HoleCell.swift
//  GolfScore
//
//  Created by JaewooByun on 2021/04/23.
//

import UIKit


class HoleCell: UITableViewCell {
    
    @IBOutlet weak var holeNumberLabel: UILabel!
    
    @IBOutlet weak var parTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCell()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell() {
        self.holeNumberLabel.text = "1"
        self.parTextField.text = "4"
        parTextField.allowsEditingTextAttributes = false
    }
    
}

