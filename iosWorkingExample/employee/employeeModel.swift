//
//  employeeModel.swift
//  iosWorkingExample
//
//  Created by burak cakir on 24.11.2021.
//





//Employee => Bu ana view olacak. Add Employee ve EmployeeList bu view içerisinde alt alta olacak.
//AddEmployee => Employee ekleyen bir form olacak
//EmployeeList => Employee listeleyen bir liste olacak
//
//Employee eklediğim an diğer view e düşmeli ( environmentObject kullancağız)

import Foundation
struct employee{
    var employeeModel : [EmployeeModel] = [EmployeeModel]()
    
}

struct EmployeeModel{
    
    var name : String
    var surname : String
    var city : String
    var country : String
    
}
