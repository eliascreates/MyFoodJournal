//
//  MealViewController.swift
//  MyFoodJournal
//
//  Created by IACD 013 on 2022/11/30.
//

import UIKit

class MealCell: UITableViewCell {

    
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var mealPhoto: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()

        configureMealCellViews()
    }
    
    
    func configureMealCellViews() {
        mealPhoto.layer.cornerRadius = 8
        mealPhoto.layer.masksToBounds = true
        mealPhoto.layer.borderWidth = 0.5
        contentView.backgroundColor = UIColor(named: "cellColor")
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
                
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10))
    }
    
    
}
