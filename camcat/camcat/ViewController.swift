//
//  ViewController.swift
//  camcat
//
//  Created by Sophia Zhu on 2019-10-29.
//  Copyright © 2019 Sophia Zhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{

    @IBOutlet var imgPreview: UIImageView!
    @IBOutlet var calculateButton: UIButton!
    @IBOutlet var libraryButton: UIButton!
    @IBOutlet var cameraButton: UIButton!
    var imgData:UIImage?
    
    @IBAction func useCamera(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func useLibrary(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        self.dismiss(animated: true, completion: nil)
        imgPreview.contentMode = UIView.ContentMode.scaleAspectFit
        imgPreview.image = info[.originalImage] as? UIImage
        imgData = info[.originalImage] as? UIImage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    func setUp() {

        if(imgPreview.image == nil){
            imgPreview.contentMode = UIView.ContentMode.center;
            imgPreview.image = UIImage(named: "no_img_indicator.png")!
        }
        calculateButton.layer.borderWidth = 2
        calculateButton.layer.cornerRadius = 10
        calculateButton.layer.borderColor = UIColor.gray.cgColor
        libraryButton.layer.borderWidth = 1
        libraryButton.layer.cornerRadius = 5
        libraryButton.layer.borderColor = UIColor.gray.cgColor
        cameraButton.layer.borderWidth = 1
        cameraButton.layer.cornerRadius = 5
        cameraButton.layer.borderColor = UIColor.gray.cgColor

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Hide the Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

}

