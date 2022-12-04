//
//  ViewController.swift
//  MyFoodJournal
//
//  Created by IACD 013 on 2022/11/30.
//

import UIKit

class MainViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    
    private func configureMainNav() {
        self.title = "My Food Journal"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(didTapCompose))
        self.navigationItem.backButtonTitle = "Main Page"
        
    }
    
    
    @objc func didTapCompose() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "viewMeal") as? MealViewController else {
            return
        }
        
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    


}

