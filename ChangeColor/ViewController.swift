//
//  ViewController.swift
//  ChangeColor
//
//  Created by Dennis Lin on 2021/5/11.
//

import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var headFurView: UIView!
    @IBOutlet weak var bodyFurView: UIView!
    @IBOutlet weak var tailFurView: UIView!
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet var controllerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // create head fur imageview
        let headFurImageView = UIImageView(image: UIImage(named: "headfur.png"))
        headFurImageView.contentMode = .scaleAspectFit
        headFurImageView.frame = headFurView.bounds
        headFurView.mask = headFurImageView
       
        //  create body fur imageview
        let bodyFurImageView = UIImageView(image: UIImage(named: "bodyfur.png"))
        bodyFurImageView.contentMode = .scaleAspectFit
        bodyFurImageView.frame = bodyFurView.bounds
        bodyFurView.mask = bodyFurImageView
        
        //create tail fur imageview
        let tailFurImageView = UIImageView(image: UIImage(named: "tailfur.png"))
        tailFurImageView.contentMode = .scaleAspectFit
        tailFurImageView.frame = tailFurView.bounds
        tailFurView.mask = tailFurImageView
        
       //load default color
        loadDefaultFurColor()
    
        let gradientLayer = CAGradientLayer();
        gradientLayer.frame = controllerView.bounds
        gradientLayer.colors = [UIColor.black.cgColor, UIColor.orange.cgColor, UIColor.black.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y:0)
        gradientLayer.endPoint = CGPoint(x: 1,y: 1)

        //insert gardientlayer
        controllerView.layer.insertSublayer(gradientLayer, at: 0)
        //set backgroundbiew is transparent
        backGroundView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
    }

   
    @IBAction func redValueChange(_ sender: UISlider) {
        redValueLabel.text = String(format: "%.0f", sender.value * 255)
        changeFurColor()
    }
    
    @IBAction func greenValueChange(_ sender: UISlider){
        greenValueLabel.text = String(format: "%.0f", sender.value * 255)
        changeFurColor()
    }
    @IBAction func blueValueChange(_ sender: UISlider) {
        blueValueLabel.text = String(format: "%0.f", sender.value * 255)
        changeFurColor()
    }
   
    
    @IBAction func randomButton(_ sender: Any) {
        radnomColor()
    }
    
    @IBAction func defaultButton(_ sender: Any) {
        loadDefaultFurColor()
    }
    
    //change 3 views background color (headFurView, bodyFurView and tailFurView)
    func changeFurColor()->(){
        headFurView.backgroundColor = UIColor(red:  CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        bodyFurView.backgroundColor = UIColor(red:  CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        tailFurView.backgroundColor = UIColor(red:  CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        
        //synchronize labe text
        redValueLabel.text = String(format: "%.0f", redSlider.value * 255)
        greenValueLabel.text = String(format: "%.0f", greenSlider.value * 255)
        blueValueLabel.text = String(format: "%.0f", blueSlider.value * 255)
    }
    
    func loadDefaultFurColor()->(){
        redSlider.value = 244/255
        greenSlider.value = 226/255
        blueSlider.value = 192/255
        changeFurColor()
    }
    
    func radnomColor()->(){
        redSlider.value = Float.random(in: 0...1)
        greenSlider.value = Float.random(in: 0...1)
        blueSlider.value = Float.random(in: 0...1)
        changeFurColor()
    }
}

