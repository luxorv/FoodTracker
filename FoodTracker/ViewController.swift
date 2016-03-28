//
//  ViewController.swift
//  FoodTracker
//
//  Created by Victor Manuel Polanco on 3/18/16.
//  Copyright © 2016 Victor Manuel Polanco. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field's user input through delegate callbacks.
        
        nameTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
    
        // Hide the keyboard
        
        nameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library
        
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        
        imagePickerController.sourceType = .PhotoLibrary
        
        // Make sure ViewController is notified when the user picks an image.
        
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func setDefaultLabelText(sender: UIButton) {
        
        mealNameLabel.text = "Default Text"
    }
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        // Dismiss the picker if user canceled.
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        // Set photoImageView to display the selected image.
        
        photoImageView.image = image
        
        // Dismiss the picker.
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        // Hide the keyboard
        
        textField.resignFirstResponder()
        
        return true
        
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        mealNameLabel.text = textField.text
        
    }
    
    
}

