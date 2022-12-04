//
//  MealViewController.swift
//  MyFoodJournal
//
//  Created by IACD 013 on 2022/12/02.
//

import UIKit
import CoreData

class MealViewController: UIViewController {

    var selectedMeal: FoodItem? = nil
    
    @IBOutlet var mealImage: UIImageView!
    @IBOutlet var deleteButton: UIButton!
    @IBOutlet var infoTextEdit: UITextView!
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet weak var addPhotoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureMealViews()
        
        
        if selectedMeal != nil {
            
            mealImage.image = UIImage(data: selectedMeal!.foodImage)
            infoTextEdit.text = selectedMeal!.foodInfo
            dateLabel.text = selectedMeal!.dateCreated.wordForm
            deleteButton.isHidden = false
            addPhotoLabel.isHidden = true
        }

    }
    
    func configureMealViews() {
        deleteButton.layer.cornerRadius = 8
        deleteButton.layer.masksToBounds = true
        mealImage.layer.cornerRadius = 8
        mealImage.layer.masksToBounds = true
        mealImage.layer.borderWidth = 0.5
        
        
        infoTextEdit.layer.cornerRadius = 8
        infoTextEdit.layer.borderWidth = 0.5
        infoTextEdit.layer.masksToBounds = true
        
        deleteButton.isHidden = true
        addPhotoLabel.isHidden = false
        
        mealImage.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self,
                                             action: #selector(didTapChangeMealPic))
        mealImage.addGestureRecognizer(gesture)
        title = "Food"
        
    }
    
    @objc func didTapChangeMealPic() {
        presentPhotoActionSheet()
    }
    
    @IBAction func deleteMeal(_ sender: Any) {
        let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FoodItem")
        
        do {
            let results: NSArray = try context.fetch(request) as NSArray
            var meal: FoodItem
            for result in results {
                
                meal = result as! FoodItem
                
                if meal == selectedMeal {
                    meal.dateDeleted = Date()
                    try context.save()
                    navigationController?.popViewController(animated: true)
                    
                }
                
            }
            
        } catch {
            print("Fetching Food Failed. I guess you'll have to try and remember all the food you ate 😭")
        }
        
        
    }
    
    
    
    @IBAction func saveMeal(_ sender: Any) {
        let appDelegate = (UIApplication.shared.delegate as! AppDelegate)
        let context = appDelegate.persistentContainer.viewContext
        
        if selectedMeal == nil { //Enter new Meal
        
            let entity = NSEntityDescription.entity(forEntityName: "FoodItem", in: context)
            let newMeal = FoodItem(entity: entity!, insertInto: context)
            newMeal.id = meals.count as NSNumber
            newMeal.foodInfo = infoTextEdit.text
            newMeal.foodImage = mealImage.image?.pngData()
            newMeal.dateCreated = Date()
            
            do {
                try context.save()
                meals.append(newMeal)
                navigationController?.popViewController(animated: true)
                
            } catch {
                print("Context couldn't be saved")
            }
        } else {
            
           //Edit An Existing Meal
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FoodItem")
            
            do {
                let results: NSArray = try context.fetch(request) as NSArray
                var meal: FoodItem
                for result in results {
                    
                    meal = result as! FoodItem
                    
                    if meal == selectedMeal {
                        meal.foodImage = mealImage.image?.pngData()
                        meal.foodInfo = infoTextEdit.text
                        try context.save()
                        navigationController?.popViewController(animated: true)
                        
                    }
                }
                
            } catch {
                print("Fetching Food Failed. I guess you'll have to try and remember all the food you ate 😭")
            }
            
        }
        
    }
    
}



extension MealViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func presentPhotoActionSheet() {
        let alertList = UIAlertController(title: "Food Journal",
                                            message: "Select an image of the Food/Meal",
                                            preferredStyle: .actionSheet)
   
        alertList.addAction(UIAlertAction(title: "Take Photo",
                                            style: .default,
                                            handler: { [weak self] _ in
            print("Opps: use a phone that has a camera")
            self?.presentCamera()
        }))
        alertList.addAction(UIAlertAction(title: "Choose a Photo",
                                            style: .default,
                                            handler: { [weak self] _ in
            self?.presentPhotoPicker()
        }))
        
        alertList.addAction(UIAlertAction(title: "Cancel",
                                            style: .cancel,
                                            handler: nil))
        present(alertList, animated: true)
    }
    
    func presentCamera() {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.sourceType = .camera
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func presentPhotoPicker() {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.sourceType = .photoLibrary
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        print(info)
        
        guard let selectedImage = info[.editedImage] as? UIImage else {
            return
        }
        
        self.mealImage.image = selectedImage
        addPhotoLabel.isHidden = true
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

