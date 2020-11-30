//
//  ViewController.swift
//  Egret
//
//  Created by Thisismy0312 on 10/22/2020.
//  Copyright (c) 2020 Thisismy0312. All rights reserved.
//

import UIKit
import Egret

class ViewController: HeaderViewController {
    
    let phoneInput = EgretInputView()
    let codeInput = EgretInputView()
    let button = EgretButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        contentView.addSubview(phoneInput)
        contentView.addSubview(codeInput)
        contentView.addSubview(button)
        
        needArrow = false
        arrowAction = {
            print("GA GA GA !!!")
        }
        
        rightAction = {
            print("LA LA LA !!!")
        }
        
        setInputGroup()
    }
    
    func setInputGroup() {
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false //他妈的点击屏蔽
        view.addGestureRecognizer(tap)
        
        phoneInput.translatesAutoresizingMaskIntoConstraints = false
        phoneInput.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        phoneInput.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50).isActive = true
        phoneInput.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.893).isActive = true
        phoneInput.heightAnchor.constraint(equalToConstant: 37).isActive = true
        phoneInput.title = "手机"
        phoneInput.haveCodeSelect = true
        phoneInput.keyboardType = .numberPad
        phoneInput.layoutIfNeeded()
        
        codeInput.translatesAutoresizingMaskIntoConstraints = false
        codeInput.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        codeInput.topAnchor.constraint(equalTo: phoneInput.bottomAnchor, constant: 10).isActive = true
        codeInput.widthAnchor.constraint(equalTo: phoneInput.widthAnchor).isActive = true
        codeInput.heightAnchor.constraint(equalTo: phoneInput.heightAnchor).isActive = true
        codeInput.title = "验证码"
        codeInput.haveSubmit = true
        codeInput.keyboardType = .numberPad
        codeInput.counter = 120
        codeInput.submitActoin = {
            
        }
        codeInput.layoutIfNeeded()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.topAnchor.constraint(equalTo: codeInput.bottomAnchor, constant: 20).isActive = true
        button.colorHead = UIColor(hex: 0xEDCC99)
        button.colorTail = UIColor(hex: 0xC4925A)
        button.title = "Hello!"
        button.titleColor = .white
        button.backAction = { self.button.isEnabled = false }
        button.startPoint = CGPoint(x: 0, y: 1)
        button.endPoint = CGPoint(x: 1, y: 1)
        button.radius = 20
        button.layoutIfNeeded()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController {
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIColor {
    convenience init(hex:Int, alpha:CGFloat = 1.0) {
        self.init(
            red:   CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8)  / 255.0,
            blue:  CGFloat((hex & 0x0000FF) >> 0)  / 255.0,
            alpha: alpha
        )
    }
}
