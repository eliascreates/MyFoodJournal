//
//  MealTableView.swift
//  MyFoodJournal
//
//  Created by IACD 013 on 2022/12/03.
//

import UIKit
import CoreData

var meals = [FoodItem]()

class MealTableViewController: UITableViewController {

    var firstLoad = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (firstLoad) {
            firstLoad = false
            fetchFood()
        }
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
    }
    
    func existingMeals() -> [FoodItem] {
     var mealList = [FoodItem]()
        
        for meal in meals {
            if meal.dateDeleted == nil {
                mealList.append(meal)
            }
        }
        return mealList
    }
    
    private func fetchFood() {
        let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FoodItem")
        do {
            let results: NSArray = try context.fetch(request) as NSArray
            var meal: FoodItem
            for result in results {
                meal = result as! FoodItem
                meals.append(meal)
            }
        } catch {
            print("Fetching Food Failed. I guess you'll have to try and remember all the food you ate 😭")
        }
    }
    
    //Tables Views - Displaying Data on the UI
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "mealCell", for: indexPath) as! MealCell
        let meal = existingMeals()[indexPath.row]
        
        cell.dateLabel.text = meal.dateCreated.wordForm
        cell.descLabel.text = meal.foodInfo
        cell.mealPhoto.image = UIImage(data: meal.foodImage)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return existingMeals().count
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "editMeal", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "editMeal" {
            let indexPath = tableView.indexPathForSelectedRow!
            let editMeal = segue.destination as? MealViewController
            let selectedMeal: FoodItem!
            selectedMeal = existingMeals()[indexPath.row]
            editMeal!.selectedMeal = selectedMeal
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
}
