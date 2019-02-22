//
//  VacancyViewModel.swift
//  HseAlumni
//
//  Created by Sergey on 2/22/19.
//  Copyright © 2019 Бизнес в стиле .RU. All rights reserved.
//

import Foundation
import UIKit

protocol VacancyViewModelDelegate : class{
    func didRecieveVacancies(_ vacancies: [Vacancy])
}

class VacancyViewModel{
    private var fetchedVacancies = [Vacancy]()
    weak var delegate : VacancyViewModelDelegate?
    
    func fetchVacancies(){
        DispatchQueue.global(qos: .userInitiated).async {
            sleep(1)
            DispatchQueue.main.async { [weak self] in
                self?.fetchedVacancies = Array(repeating: Vacancy(), count: 10)
                self?.delegate?.didRecieveVacancies(self?.fetchedVacancies ?? [])
            }
        }
    }
}
