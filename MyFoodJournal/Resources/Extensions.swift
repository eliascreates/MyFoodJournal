//
//  Extensions.swift
//  MyFoodJournal
//
//  Created by IACD 013 on 2022/12/02.
//

import Foundation
import UIKit


// Converting to desired format.
extension Date {
    var wordForm: String {
        self.formatted(.dateTime
            .month(.abbreviated)
            .day(.twoDigits)
            .year().minute(.twoDigits).hour(.conversationalDefaultDigits(amPM: .abbreviated)))
    }
}
