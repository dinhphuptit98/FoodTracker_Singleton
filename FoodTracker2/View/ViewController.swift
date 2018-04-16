//
//  ViewController.swift
//  FoodTracker2
//
//  Created by dinhphu98 on 4/9/18.
//  Copyright © 2018 dinhphu98. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate , UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var ratingControll: RatingControl!
    @IBOutlet var saveControll: UIBarButtonItem!
    
    var meal : Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let meal = meal {
            navigationItem.title = meal.name
            nameTextField.text = meal.name
            photoImageView.image = meal.photo
            ratingControll.rating = meal.rating!
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // chon anh
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present( imagePickerController , animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // nut cancel
    @IBAction func cancel (_ sender : UIBarButtonItem) {
        let isPresentingInAddMealMode = presentingViewController as? UINavigationController
        dismiss(animated: true, completion: nil)
        if (isPresentingInAddMealMode != nil) {
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController {
            owningNavigationController.popViewController(animated: true)
        }
    }

    //truyen du lieu
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        let button = sender as? UIBarButtonItem == saveControll
        let name = nameTextField.text ?? ""
        let photo = photoImageView.image
        let rating = ratingControll.rating
        
        meal = Meal(name: name, photo: photo!, rating: rating)
    }
}

