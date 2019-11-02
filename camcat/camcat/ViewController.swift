//
//  ViewController.swift
//  camcat
//
//  Created by Sophia Zhu on 2019-10-29.
//  Copyright © 2019 Sophia Zhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{

    @IBOutlet var photo: UIImageView!
//    @IBOutlet var takePhotoButton: UIButton!
    @IBOutlet var calculateButton: UIButton!
    @IBOutlet var libraryButton: UIButton!
    @IBOutlet var cameraButton: UIButton!
    
    
//    @IBAction func takePhoto(_ sender: Any) {
//        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
//            print("inside")
//            let imagePicker = UIImagePickerController()
//            imagePicker.delegate = self
//            imagePicker.sourceType = UIImagePickerController.SourceType.camera
//            imagePicker.allowsEditing = false
//            present(imagePicker, animated: true, completion: nil)
//        }
//        print("out")
//    }
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        self.dismiss(animated: true, completion: nil)
//        photo.image = info[.originalImage] as? UIImage
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp(){
//        takePhotoButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
//        takePhotoButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        takePhotoButton.layer.cornerRadius = takePhotoButton.frame.size.width/2
        calculateButton.layer.borderWidth = 2
        calculateButton.layer.cornerRadius = 10
        calculateButton.layer.borderColor = UIColor.gray.cgColor
        libraryButton.layer.borderWidth = 2
        libraryButton.layer.cornerRadius = 10
        libraryButton.layer.borderColor = UIColor.gray.cgColor
        cameraButton.layer.borderWidth = 2
        cameraButton.layer.cornerRadius = 10
        cameraButton.layer.borderColor = UIColor.gray.cgColor

    }
}

