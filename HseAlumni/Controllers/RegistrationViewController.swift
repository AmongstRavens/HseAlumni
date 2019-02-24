//
//  RegistrationViewController.swift
//  HseAlumni
//
//  Created by Sergey on 2/11/19.
//  Copyright © 2019 Бизнес в стиле .RU. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    var registrationViewModel = RegistrationViewModel()
    
    @IBOutlet weak var serialNumberLabel: UILabel!
    @IBOutlet weak var diplomaNumberTextFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        diplomaNumberTextFiled.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if registrationViewModel.isUserAuthorized(){
            performSegue(withIdentifier: "Present Main TabBar Controller", sender: nil)
        }
    }
    
    @IBAction func enterButtonPressed(_ sender: UIButton) {
        if registrationViewModel.isDiplomaNumberCorrect(enteredNumber: diplomaNumberTextFiled.text!){
            registrationViewModel.setDiplomaNumber(diplomaNumberTextFiled.text!)
            performSegue(withIdentifier: "Present Main TabBar Controller", sender: nil)
        } else{
            showDefaultAlertController(message: "Неверно указаны данные о номере диплома.", title: "Ошибка авторизации")
        }
    }
}

//MARK: -UITextFieldDelegate
extension RegistrationViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
