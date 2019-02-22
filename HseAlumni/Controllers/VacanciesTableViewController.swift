//
//  VacanciesTableViewController.swift
//  HseAlumni
//
//  Created by Sergey on 2/22/19.
//  Copyright © 2019 Бизнес в стиле .RU. All rights reserved.
//

import UIKit

class VacanciesTableViewController: UITableViewController {
    
    private struct DesignConstants{
        static var cellHeight : CGFloat = 170
    }
    private var vacancies = [Vacancy]()
    private var vacancyViewModel = VacancyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vacancyViewModel.delegate = self
        vacancyViewModel.fetchVacancies()
        tableView.register(VacancyTableViewCell.self)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vacancies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(VacancyTableViewCell.self, forIndexPath: indexPath)
        cell.vacancyImageView.image = UIImage(data: vacancies[indexPath.row].image ?? Data()) ?? UIImage(named: "alfa")
        cell.companyNameLabel.text = vacancies[indexPath.row].organization
        cell.salaryLabel.text = vacancies[indexPath.row].salary
        cell.dateTimeLabel.text = "21 сентября"
        cell.vacancyTitleLabel.text = vacancies[indexPath.row].title
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return DesignConstants.cellHeight
    }
}

extension VacanciesTableViewController : VacancyViewModelDelegate{
    func didRecieveVacancies(_ vacancies: [Vacancy]) {
        self.vacancies = vacancies
        tableView.reloadData()
    }
}
