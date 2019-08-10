//
//  TableViewCell.swift
//  DemoMasterMantoman
//
//  Created by Anh vũ on 5/21/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit
protocol Delegate {
    func onClickCell(indexPath: Int)
    func checkWebView(indexPath:Int)
}

class TableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var salary: UILabel!
    @IBOutlet weak var jobs: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var status: UILabel!
    var listJobs: Job?
    var cellDelegate: Delegate?
    var indexPath:IndexPath?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func showWeb(_ sender: Any) {
        cellDelegate?.checkWebView(indexPath: indexPath!.row)
        
    }
    @IBAction func callPhone(_ sender: Any) {
        if let listJobs = listJobs {
            dialNumber(number: listJobs.phone!)
            
        }
    }
    
    //    quay số
    func dialNumber(number : String) {
        if let url = URL(string: "tel://\(number)"),
            UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler:nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        } else {
            // add error message here
            print("Sai so")
        }
    }
    @IBAction func checkDetail(_ sender: UIButton) {
        cellDelegate?.onClickCell(indexPath: indexPath!.row)
    }
}
