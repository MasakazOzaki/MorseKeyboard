//
//  KeyboardViewController.swift
//  CustomKeyboard
//
//  Created by Yuji Sasaki on 2019/05/29.
//  Copyright © 2019 Yuji Sasaki. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    @IBOutlet var dashButton: UIButton!
    @IBOutlet var dotButton: UIButton!
    @IBOutlet var spaceButton: UIButton!
    @IBOutlet var buttonStack: UIStackView!
    @IBOutlet var backButton: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        
        self.buttonStack = UIStackView(arrangedSubviews:[])
        self.buttonStack.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.buttonStack)
        self.buttonStack.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 16).isActive = true
        self.buttonStack.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -16).isActive = true
        self.buttonStack.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16).isActive = true
        self.buttonStack.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16).isActive = true
        self.buttonStack.heightAnchor.constraint(equalToConstant: 80).isActive = true
        self.buttonStack.distribution = .fillEqually
        self.buttonStack.spacing = 8
        
        //bs button
        self.backButton = UIButton(type: .system)
        
        self.backButton.setTitle("BS", for: [])
        self.backButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        self.backButton.translatesAutoresizingMaskIntoConstraints = false
        self.backButton.addTarget(self, action: #selector(pushBack), for: .touchDown)
        
        self.backButton.backgroundColor = UIColor.white
        self.backButton.layer.cornerRadius = 16
        
        self.buttonStack.addArrangedSubview(self.backButton)
        
        //dash button
        self.dashButton = UIButton(type: .system)
        
        self.dashButton.setTitle("-", for: [])
         self.dashButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        self.dashButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.dashButton.addTarget(self, action: #selector(pushDash), for: .touchUpInside)
        
        self.dashButton.backgroundColor = UIColor.white
        self.dashButton.layer.cornerRadius = 16
        
        self.buttonStack.addArrangedSubview(self.dashButton)
        
        
        //dash button
        self.dotButton = UIButton(type: .system)
        
        self.dotButton.setTitle(".", for: [])
        self.dotButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        self.dotButton.translatesAutoresizingMaskIntoConstraints = false
        
         self.dotButton.addTarget(self, action: #selector(pushDot), for: .touchUpInside)
        
        self.dotButton.backgroundColor = UIColor.white
        self.dotButton.layer.cornerRadius = 16
        
        self.buttonStack.addArrangedSubview(self.dotButton)
        
        //dash button
        self.spaceButton = UIButton(type: .system)
        
        self.spaceButton.setTitle("SP", for: [])
         self.spaceButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        self.spaceButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.spaceButton.addTarget(self, action: #selector(pushSpace), for: .touchUpInside)
        
        self.spaceButton.backgroundColor = UIColor.white
        self.spaceButton.layer.cornerRadius = 16
        
        self.buttonStack.addArrangedSubview(self.spaceButton)
        
    }
    
    @objc func pushSpace() {
        self.textDocumentProxy.insertText("　")
    }
    
    @objc func pushDot() {
        self.textDocumentProxy.insertText("•")
    }
    
    @objc func pushDash() {
        self.textDocumentProxy.insertText("ー")
    }
    
    @objc func pushBack() {
        self.textDocumentProxy.deleteBackward()
    }
    
    override func viewWillLayoutSubviews() {
        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }

}
