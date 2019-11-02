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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
