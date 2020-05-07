//
//  ViewController.swift
//  ImagePicker
//
//  Created by Mehul Jadav on 06/05/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController {

    @IBOutlet weak var imgView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnPhoto(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "MEDIA", message: "Please select media", preferredStyle: UIAlertController.Style.actionSheet)
        alert.addAction(UIAlertAction(title: "Capture Image", style: UIAlertAction.Style.default, handler: { action in
                self.showCameraForImage()
        }))
        alert.addAction(UIAlertAction(title: "Select From Gallery", style: UIAlertAction.Style.default, handler: { action in
                self.openGalleryView()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.destructive, handler: { action in
            print("Cancel")
        }))
        self.present(alert, animated: true, completion: nil)
        
    }

}

//MARK:- Select Image, Audio & Video
extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        picker.dismiss(animated: true) {
            
            if (picker.mediaTypes == [kUTTypeImage as String]){
                
                
                if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                    self.imgView.image = image
                } else if let image = info[UIImagePickerController.InfoKey.cropRect] as? UIImage {
                    self.imgView.image = image
                }
                
            } else if (picker.mediaTypes == [kUTTypeMovie as String]) {
                
            }
        }
    }
    
    func showCameraForImage() -> Void {
        let imagePicker = UIImagePickerController();
        imagePicker.delegate = self
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
        }
        else {
            imagePicker.sourceType = .photoLibrary
        }
        imagePicker.mediaTypes = [kUTTypeImage as String]
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func openGalleryView() -> Void {
        let imagePicker = UIImagePickerController();
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = [kUTTypeImage as String]
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    
    func showCameraForVideo() -> Void {
        let imagePicker = UIImagePickerController();
        imagePicker.delegate = self
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
        }
        else {
            imagePicker.sourceType = .photoLibrary
        }
        imagePicker.mediaTypes = [kUTTypeMovie as String]
        self.present(imagePicker, animated: true, completion: nil)
    }
    func openGalleryViewForVideo() -> Void {
        let imagePicker = UIImagePickerController();
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = [kUTTypeMovie as String]
        self.present(imagePicker, animated: true, completion: nil)
    }
}
