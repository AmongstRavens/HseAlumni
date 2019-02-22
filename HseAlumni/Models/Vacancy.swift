//
//  Vacancy.swift
//  HseAlumni
//
//  Created by Sergey on 2/22/19.
//  Copyright © 2019 Бизнес в стиле .RU. All rights reserved.
//

import Foundation

struct Vacancy : Codable{
    var image: Data?
    var title: String? = "Серверный администратор"
    var organization: String? = "Styleru"
    var timestamp: Int64?
    
    //Main info
    var salary: String? = "50 000 ₽"
    var city: String? = "Мосвка"
    var metro: String? = "Марьина роща"
    var experience: String? = "1 год"
    var workType: String? = "Частичная, гибкий график"
    
    //Additional info
    var requirements: String? = "-Опыт установки, настройки, администрирования Git, GitLab;\n-Знание ПО (установка, конфигурирование, обслуживание): Apache, Nginx, PostgreSQL"
    var charges: String? = "Be smart"
    var conditions: String? = "Tough"
    
    //Contact info
    var phone: String? = "8-962-932-24-19"
    var email: String? = "klimenko@styleru.net"
    
    //JSON keys
    enum CodingKeys: String, CodingKey {
        case title = "TITLE"
    }
}
