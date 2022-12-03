//
//  MealViewController.swift
//  MyFoodJournal
//
//  Created by IACD 013 on 2022/11/30.
//

import UIKit

class MealTableViewCell: UITableViewCell {

    @IBOutlet var mealDescription: UILabel!
    @IBOutlet var mealImage: UIImageView!
    @IBOutlet var dateLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()

        
        mealImage.layer.cornerRadius = 8
        mealImage.layer.masksToBounds = true
        
        contentView.backgroundColor = UIColor(named: "cellColor")
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
                

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10))
        
    }
    
    
}
