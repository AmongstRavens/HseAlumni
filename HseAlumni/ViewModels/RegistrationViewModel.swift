//
//  RegistrationViewModel.swift
//  HseAlumni
//
//  Created by Sergey on 2/11/19.
//  Copyright © 2019 Бизнес в стиле .RU. All rights reserved.
//

import Foundation

class RegistrationViewModel{
    func isDiplomaNumberCorrect(enteredNumber: String) -> Bool{
        //TODO: Check number
        return enteredNumber.count != 0
    }
    
    func setDiplomaNumber(_ number: String){
        UserDefaults.standard.set(number, forKey: "diplomaNumber")
    }
    
    func isUserAuthorized() -> Bool{
        //return UserDefaults.standard.value(forKey: "diplomaNumber") as? String != nil
        return false
    }
}
