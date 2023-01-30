//
//  MyIDViewController.swift
//  Setting_Clone_App
//
//  Created by 이상도 on 2023/01/29.
//

import UIKit

class MyIDViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    
        nextButton.isEnabled = false
    }
    
    @objc func textFieldDidChange(sender: UITextField) {
        
        // 글자가 없으면
        // if sender.text?.isEmpty == true
        if sender.text?.count == 0 {
            nextButton.isEnabled = false // 활성화 상태 = false
        } else {
            nextButton.isEnabled = true
        }
        
    }
    
}
