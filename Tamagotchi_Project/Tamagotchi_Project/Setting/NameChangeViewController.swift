//
//  NameChangeViewController.swift
//  Tamagotchi_Project
//
//  Created by 최형민 on 2022/07/25.
//

import UIKit
import Toast

class NameChangeViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigation()
    }
    
    func configureNavigation() {
        self.navigationItem.title = "\(UserDefaults.standard.string(forKey: "userName")!)님 이름 정하기"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButtonClicked))
    }
    
    @objc func saveButtonClicked() {
        let newName = userNameTextField.text
        let characterCount = (newName?.count)!
        
        if characterCount >= 2 && characterCount <= 6 {
            UserDefaults.standard.set(newName, forKey: "userName")
            self.navigationItem.title = "\(UserDefaults.standard.string(forKey: "userName")!)님 이름 정하기"
        } else {
            view.makeToast("두 글자 이상 여섯 글자 이하의 이름을 정해주세요!")
        }
        
    }
    
}
