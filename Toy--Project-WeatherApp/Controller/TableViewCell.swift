//
//  TableViewCell.swift
//  Toy--Project-WeatherApp
//
//  Created by 정덕호 on 2022/01/16.
//

import UIKit


class TableViewCell: UITableViewCell {
    
    
    
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
}
