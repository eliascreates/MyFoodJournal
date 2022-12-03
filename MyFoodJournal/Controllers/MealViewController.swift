//
//  MealViewController.swift
//  MyFoodJournal
//
//  Created by IACD 013 on 2022/12/02.
//

import UIKit

class MealViewController: UIViewController {

    private var meals = Meal.meals
    var indexPos = 0
    
    @IBOutlet var mealImage: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mealImage.image = meals[indexPos].image
        descriptionLabel.text = meals[indexPos].description
        dateLabel.text = meals[indexPos].date.wordForm
        
        title = "Food"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose,
                                                            target: self,
                                                            action: nil)
        self.navigationItem.backButtonTitle = "Main Page"
        
    }
    
    
    private func addFood(food: Meal) {
        
        Meal.meals.append(food)
    }
    


}
