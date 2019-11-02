//
//  MainViewController.swift
//  camcat
//
//  Created by Zilin Ye on 2019-11-01.
//  Copyright © 2019 Sophia Zhu. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var imgData:UIImage!
    var imgView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        prepareGestureRecog()
    }
    
    func prepareView(){
        let pickedImage = PickedImage.instance.get()
        imgData = pickedImage.data
        drawImageView()
    }
    
    func drawImageView(){
        imgView = UIImageView(image: imgData)
        imgView.contentMode = UIView.ContentMode.scaleAspectFit
        imgView.frame = CGRect(x: 0, y: 20, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        view.addSubview(imgView)

    }
    
    func drawOperatorBar(){
        
    }
    
    func drawExpressionBar(){
        
    }
    
    func prepareGestureRecog(){
        print("prepareGestureRecog Called")
        imgView.isUserInteractionEnabled = true
        let pinchMethod = UIPinchGestureRecognizer(target: self, action: #selector(pinchImage(sender:)))    //Zoom in/out
        let panMethod = UIPanGestureRecognizer(target: self, action: #selector(handlePan(sender:)))         //Move img with two fingers
        panMethod.minimumNumberOfTouches = 2
        imgView.addGestureRecognizer(pinchMethod)
        imgView.addGestureRecognizer(panMethod)
    }
    
    //---Gesture Recognition Methods Start---
    @objc func pinchImage(sender: UIPinchGestureRecognizer) {                                                //Zoom in / out
        if let scale = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale)) {
            print("Pinch Detected")
            guard scale.a > 1.0 else {return}
            guard scale.d > 1.0 else {return}
            sender.view?.transform = scale
            sender.scale = 1.0
        }
    }
    
    @objc func handlePan(sender: UIPanGestureRecognizer) {                                                     //Move img with two fingers
        let gview = sender.view
        if sender.state == .began || sender.state == .changed {
            let translation = sender.translation(in: gview?.superview)
            gview?.center = CGPoint(x: (gview?.center.x)! + translation.x, y: (gview?.center.y)! + translation.y)
            sender.setTranslation(CGPoint.zero, in: gview?.superview)
        }
    }
    
    //---Gesture Recognition Methods End---

    func drawImage(){   //Draw blue rectangle on
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
