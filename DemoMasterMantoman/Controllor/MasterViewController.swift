//
//  ViewController.swift
//  DemoMasterMantoman
//
//  Created by Anh vũ on 5/14/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit
enum PushIdentifier : String {
    case DetailVc = "DetaiVC"
    case ShowWeb  = "ShowWeb"
}
class MasterViewController: UIViewController {
    @IBOutlet weak var callPhone: DesignableButton!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet var outletButton: [Button]!
    @IBOutlet weak var popupView: PopupView!
    var listJob = [Job]()
    override func viewDidLoad() {
        super.viewDidLoad()
        DataSevice.shared.makeRequestJson(comlethander: { (data) in
            self.listJob = data
            self.tableView.reloadData()
        })
        
//    lay data bang notifocation
        
//        registernotification()
//        DataSevice.shared.requestJson()
    }
//    func registernotification () {
//        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: .key, object: nil)
//    }
//    deinit {
//        NotificationCenter.default.removeObserver(self)
//    }
//
//    @objc func reloadData (){
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//        }
//    }
    
    @IBAction func onMenu(_ sender: Button) {
            outletButton.forEach{$0.isSelected = false}
            sender.isSelected = !sender.isSelected
            addpopupView()
            popupView.layoutNeckView(sender)
        
        }
    
    private func addpopupView(){
        view.addSubview(popupView)
        popupView.fill(left: 0, top: nil, right: 0, bottom: -100)
        popupView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
    }
    
}

extension MasterViewController: Delegate {
    func checkWebView(indexPath: Int) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let webView = sb.instantiateViewController(withIdentifier: PushIdentifier.ShowWeb.rawValue) as? WebViewController else {return}
        webView.listJob  = listJob[indexPath]
//            DataSevice.shared.jobs[indexPath]
        navigationController?.pushViewController(webView, animated: true)
    }
    
    func onClickCell(indexPath: Int) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let detailVc = sb.instantiateViewController(withIdentifier: PushIdentifier.DetailVc.rawValue ) as? DetailTableViewController else { return }
        detailVc.listJob = listJob[indexPath]
//            DataSevice.shared.jobs[indexPath]
        navigationController?.pushViewController(detailVc, animated: true)
    }
}

extension MasterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listJob.count
//            DataSevice.shared.jobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.cellDelegate = self
        cell.indexPath = indexPath
        var listJobs = listJob[indexPath.row]
//            DataSevice.shared.jobs[indexPath.row]
//        cell.title.text = listJobs.title
        cell.salary.text = listJobs.salary
        cell.jobs.text = listJobs.jobs
        cell.status.text = listJobs.status
        cell.listJobs = listJobs
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
        
    }
    
}
