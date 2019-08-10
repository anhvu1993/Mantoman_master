//
//  DetailTableViewController.swift
//  DemoMasterMantoman
//
//  Created by Anh vũ on 5/22/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    var listJob:Job?
    var dataJob = [DetailJob]()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupTableView()
        if let listJob = listJob {
            dataJob = [DetailJob(name: "title", value: listJob.title!),
                       DetailJob(name: "salary", value: listJob.salary!),
                       DetailJob(name: " jobs", value: listJob.jobs!),
                       DetailJob(name: "locations", value: listJob.location!),
                       DetailJob(name: "status", value: listJob.status!),
                       DetailJob(name: "showJobDetail", value: listJob.showJobDetail!),
                       DetailJob(name: "phone", value: listJob.phone!)
            ]

//            jobs = [Job(title: listJob.title!, salary: listJob.salary!, jobs: listJob.jobs!, location: listJob.location!, status: listJob.status!, showJobDetail: listJob.showJobDetail!, showWeb: listJob.showWeb!, phone: listJob.phone!)]
        }
    }
    func setupTableView() {
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.backgroundColor = UIColor.white
        tableView.isScrollEnabled = true
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataJob.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellDetail", for: indexPath)
        cell.textLabel?.text = dataJob[indexPath.row].name
        cell.detailTextLabel?.text = dataJob[indexPath.row].value
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
        
        
    }
}
