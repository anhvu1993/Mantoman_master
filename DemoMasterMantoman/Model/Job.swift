//
//  Job.swift
//  DemoMasterMantoman
//
//  Created by Anh vũ on 5/21/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit

class Job: Codable {
    var title: String?
    var salary: String?
    var jobs: String?
    var location: String?
    var status: String?
    var showJobDetail: String?
    var showWeb: String?
    var phone: String?
    init(title: String, salary: String, jobs: String, location: String, status: String, showJobDetail: String, showWeb: String, phone: String) {
        self.title = title
        self.salary = salary
        self.jobs = jobs
        self.location = location
        self.status = status
        self.showJobDetail = showJobDetail
        self.showWeb = showWeb
        self.phone = phone
    }
//    private enum CodingKeys: String, CodingKey {
//        case title
//        case salary
//        case jobs
//        case location
//        case status
//        case showJobDetail
//        case showWeb
//        case phone
//    }
    
}
class DetailJob {
    var name:String?
    var value: String?
    init(name: String, value: String) {
        self.name = name
        self.value = value
        
    }
}
