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
    
    var expressionBar:UILabel!
    var operatorBarItem:[UIButton]! //Order: 0.Plus, 1.Minus, 2.Multiply, 3.Divide, 4.Undo
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        prepareGestureRecog()
    }
    
    func prepareView(){
        let pickedImage = PickedImage.instance.get()
        imgData = pickedImage.data
        drawImageView()
        
        drawOperatorBar()
        drawExpressionBar()
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
        expressionBar = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.size.width-CGFloat(50), height: 20))
        expressionBar.center = CGPoint(x: view.frame.size.width/2, y: 50)
        expressionBar.layer.cornerRadius=10;
        expressionBar.layer.borderWidth=1;
        expressionBar.layer.borderColor=UIColor.black.cgColor
        expressionBar.textAlignment = .center
        expressionBar.text = "Equal: 0"
        self.view.addSubview(expressionBar)
    }
    
    func prepareGestureRecog(){
        print("prepareGestureRecog Called")
        imgView.isUserInteractionEnabled = true
        let pinchMethod = UIPinchGestureRecognizer(target: self, action: #selector(pinchImage(sender:)))    //Zoom in/out
        let panMethod = UIPanGestureRecognizer(target: self, action: #selector(handlePan(sender:)))         //Move img with two fingers
        let tapMethod = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))         //Tap to select boxes
        panMethod.minimumNumberOfTouches = 2       //Two finger! Not one
        imgView.addGestureRecognizer(pinchMethod)
        imgView.addGestureRecognizer(panMethod)
        imgView.addGestureRecognizer(tapMethod)

        let edgePan = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screenEdgeSwiped))   //Swipe Screenedge to pop Mainview
        edgePan.edges = .left
        view.addGestureRecognizer(edgePan)
    }
    
    //---Gesture Recognition Methods Start---
    @objc func pinchImage(sender: UIPinchGestureRecognizer) {                                                //Zoom in / out
        if let scale = (sender.view?.transform.scaledBy(x: sender.scale, y: sender.scale)) {
            print("Pinch Detected")
            print("The size of imgView is \(imgView.frame.size)")
            guard scale.a > 1.0 else {return}
            guard scale.d > 1.0 else {return}
            sender.view?.transform = scale
            sender.scale = 1.0
        }
    }
    
    @objc func handlePan(sender: UIPanGestureRecognizer) {                                                     //Move image with two fingers
        print("2-finger Pan Detedted")
        print("The center of imgView is \(imgView.center)")
        print("The coordinator of imgView is \(imgView.frame.origin)")
        let gview = sender.view
        if sender.state == .began || sender.state == .changed {
            let translation = sender.translation(in: gview?.superview)
            gview?.center = CGPoint(x: (gview?.center.x)! + translation.x, y: (gview?.center.y)! + translation.y)
            sender.setTranslation(CGPoint.zero, in: gview?.superview)
        }
    }
    
    @objc func handleTap(sender: UIPanGestureRecognizer) {                                                     //Tap to select boxes
        guard sender.view != nil else { return }
        if sender.state == .ended {
            print("Tap Detected")
            print("You are tapping \(sender.location(in: self.view))")
        }
    }
    
    @objc func screenEdgeSwiped(_ recognizer: UIScreenEdgePanGestureRecognizer) {
        print("Screenedge-swipe Detected")
        if recognizer.state == .recognized {
            self.navigationController?.popViewController(animated: true) //Pop current page
        }
    }
    
    //---Gesture Recognition Methods End---

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
