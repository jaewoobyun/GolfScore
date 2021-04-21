//
//  RoundsCell.swift
//  GolfScore
//
//  Created by JaewooByun on 2021/04/21.
//

import UIKit

class RoundsCell: UITableViewCell {
    
    let cellID = "roundCellID"
    
    @IBOutlet weak var courseLabel: UILabel!
    
    @IBOutlet weak var holesLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var playersLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setupCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell() {
        self.courseLabel.text = "A"
        self.holesLabel.text = "18"
        self.dateLabel.text = "2021.04.21"
        self.playersLabel.text = "B"
    }
    
}
