//
//  ViewController.swift
//  MyFoodJournal
//
//  Created by IACD 013 on 2022/11/30.
//

import UIKit

class MainViewController: UIViewController {
    
    private var meals = Meal.meals
    
    @IBOutlet var mealTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        configureMainNav()
        
        mealTableView.delegate = self
        mealTableView.dataSource = self
        
        mealTableView.separatorStyle = .none
        mealTableView.showsVerticalScrollIndicator = false
    }

    
    private func configureMainNav() {
        self.title = "My Food Journal"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(didTapCompose))
        self.navigationItem.backButtonTitle = "Main Page"
        
    }
    
    
    private func pushView(vc: UIViewController, title: String?) {
        
        if let title = title {
            vc.title = title
        }
        navigationController?.pushViewController(vc, animated: true)
        
        
        
    }
    
    
    
    @objc func didTapCompose() {
        let vc = AddMealViewController()
        
        
        
        navigationController?.pushViewController(vc, animated: true)
    }

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mealTableView.dequeueReusableCell(withIdentifier: "mealCell", for: indexPath) as! MealTableViewCell
        
        cell.mealImage.image = meals[indexPath.row].image
        cell.mealDescription.text = meals[indexPath.row].description
        cell.dateLabel.text = meals[indexPath.row].date.wordForm
                
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "viewMeal") as? MealViewController else {
            return
        }
        vc.indexPos = indexPath.row
        
        navigationController?.pushViewController(vc, animated: true)
    
        mealTableView.deselectRow(at: indexPath, animated: true)
        
        
        
//        let vc = MealViewController()
//        vc.title = "Add Meal"
//        vc.navigationItem.largeTitleDisplayMode = .never
//        //navigationController?.pushViewController(vc, animated: true)
//        vc.modalPresentationStyle = .currentContext
//
//        vc.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: nil)
//
//        present(vc, animated: true)
    }
    
    
    
    
}
