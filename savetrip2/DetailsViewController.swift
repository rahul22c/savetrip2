//
//  DetailsViewController.swift
//  savetrip2
//
//  Created by Rahul Chandrawanshi on 9/29/16.
//  Copyright © 2016 Rahul Chandrawanshi. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController, UITextFieldDelegate , UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    // MARK: Variables
    
    var datasave: dataSave?
    var tempname: String!
    var temptripname:String!
    var coordinates: Coordinates!      // used to get values acquired in main view controller
    var selectedImage : UIImage! // image for actionsheet view control
    
    var finalimage = UIImage(named: "Trip") // image to save in datatrip after save is clicked in actionsheetview controller

    
    //MARK: Properties
    
    @IBOutlet weak var nameByUser: UITextField!
    
    @IBOutlet weak var tripName: UITextField!
    
    @IBOutlet weak var placeLabel: UILabel! // !@!@! use text field in case the place is unlnown should have option to edit

    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        saveButton.isEnabled = false
        self.placeLabel.text = coordinates.place
        nameByUser.delegate = self
        tripName.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        // Disable the Save button while editing.
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // hides keyboard
        
        textField.resignFirstResponder()
        return true
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        switch(textField)
            
        {case nameByUser :
            tempname = textField.text
        case tripName:
            temptripname = textField.text!
            saveButton.isEnabled = true          // enables savebutton
        default:
            print("error")
        }
        
        
    }
    
    
    // ActionSheet
    
    @IBAction func openActionSheet(_ sender: AnyObject) {
        let actionsheet = UIAlertController(title: "", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        
        
        actionsheet.addAction(UIAlertAction(title: "Take Perfect Photo", style: UIAlertActionStyle.default, handler:{ action in
            switch action.style{
            case .default: self.getimage(from: "camera")
                
            default:
                print("error")
            } } ))
        
        actionsheet.addAction(UIAlertAction(title: "Already have a Photo", style: UIAlertActionStyle.default, handler:{ action in
            switch action.style{
            case .default: self.getimage( from: "gallery")
                
                
                
            default:
                print("error1")
                
            } } ))
        actionsheet.addAction(UIAlertAction(title: "Add information", style: UIAlertActionStyle.default, handler:{ action in
            switch action.style{
            case .default:
                print("addInformation")
                self.performSegue(withIdentifier: "addinformationSegue", sender: nil)
                
            default:
                print("error2")
            } } ))
        
        actionsheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler:nil))
        self.present(actionsheet, animated: true, completion: nil)
        
        
    }
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        // Dismiss the picker if the user canceled.
        
        dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        // The info dictionary contains multiple representations of the image, and this uses the original.
        self.selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display the selected image.
        // photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
        
        self.performSegue(withIdentifier: "imageSegue", sender: nil)
        
    }
    //MARK: Actions
    
    
    
    @IBAction func save(_ sender: AnyObject) {
        
        
        // initiates datatrip constructor and saves it in database
        
        // calling main data class to store information
        datasave = dataSave(nameByUser: tempname , tripName: temptripname , place: coordinates.place , latitude : coordinates.latitude , longitude: coordinates.longitude)
        
        
        // saving the information
        
        // saveTrip()
        
        print(datasave?.latitude!)
        print(datasave?.place)
        print(datasave?.longitude)
        print(datasave?.tripName)
        print(datasave?.nameByUser)
        
        
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        
        if isPresentingInAddMealMode {
            dismiss(animated: true, completion: nil)
        }
        else {
            navigationController!.popViewController(animated: true)
        }
        
    }

   // MARK: Extras
    
     func saveTrip() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(datasave!, toFile: dataSave.ArchiveURL.path)
        if !isSuccessfulSave {
            print("Failed to save meals...")
        }
    }
    
    func getimage( from : String)
    {
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        if (from == " gallery")
        {
            imagePickerController.sourceType = .photoLibrary
        }
        if (from == "camera")
        {
            imagePickerController.sourceType = .camera
        }
        
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        
        dismiss(animated: true, completion: nil)
        
        
        self.present(imagePickerController, animated: true, completion: nil)
        
        
        
        print("getimage")
        
    }
    

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 //Get the new view controller using segue.destinationViewController.
 //Pass the selected object to the new view controller.
 if (segue.identifier == "imageSegue"){
 
 let actionsheetimage = segue.destination as! imageViewerViewController
 
 actionsheetimage.tempimage = self.selectedImage
 
 
 }
 //Pass the selected object to the new view controller.
 if (segue.identifier == "addinformationSegue")
 {
 
 let addinformation = segue.destination as! addInformationViewController
 
 addinformation.tripimage = finalimage
 
 }
 }
}
