//
//  Meal.swift
//  MyFoodJournal
//
//  Created by IACD 013 on 2022/12/02.
//

import Foundation
import UIKit

struct Meal {
    var description: String
    var date: Date
    var image: UIImage?
}


// Converting to desired format.
extension Date {
    var wordForm: String {
        self.formatted(.dateTime
            .month(.abbreviated)
            .day(.twoDigits)
            .year())
    }
}


#if DEBUG
extension Meal {
    
//    static var meals = [
//        Meal(description: "Chicken mushroom", image: UIImage(named: "img1")),
//        Meal(description: "Noodles, ham, eggs and soup", image: UIImage(named: "img2")),
//        Meal(description: "Rice, wors with masala tantori, gravy", image: UIImage(named: "img3")),
//        Meal(description: "Chicken sweetelicious", image: UIImage(named: "img4")),
//        Meal(description: "Tomato base", image: UIImage(named: "img5"))
//    ]
}
#endif
