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
        configureMainNav()
        

    }

    
    private func configureMainNav() {
        self.title = "My Food Journal"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(didTapCompose))
        self.navigationItem.backButtonTitle = "Main Page"
        
    }
    
    
    
    @objc func didTapCompose() {
        let vc = AddMealViewController()

        navigationController?.pushViewController(vc, animated: true)
        
        
    }

}

