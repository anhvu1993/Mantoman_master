//
//  DataSevice.swift
//  DemoMasterMantoman
//
//  Created by Anh vũ on 5/21/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit
extension Notification.Name {
    static let key = Notification.Name("key")
   
}
//class DataSevice {
//    var jobs  = [Job]()
//    static let shared : DataSevice = DataSevice()
//    func makeRequestJson {
//        guard let url = URL(string: urlString) else {return}
//      let task =  URLSession.shared.dataTask(with: url) { (data, reponse, error) in
//        guard error == nil else {
//            print(error!.localizedDescription)
//            return}
//        guard data != nil else {return}
//            do {
//                let jobs = try? JSONDecoder().decode([Job].self, from: data!)
//                self.jobs = jobs!
//                NotificationCenter.default.post(name: .key, object: nil, userInfo: nil)
//            }
//            catch let error {
//                print(error.localizedDescription)
//            }
//        }
//        task.resume()
//
//
//    }
//
//}

class DataSevice {
//var jobs  = [Job]()
    static let shared : DataSevice = DataSevice()
    func makeRequestJson(comlethander: @escaping ([Job]) -> ()){
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, reponse, error) in
            guard error == nil else {return}
            guard (reponse as? HTTPURLResponse)?.statusCode == 200 else {return}
            guard let data = data else {return}
            do {
                 let job = try? JSONDecoder().decode([Job].self, from: data)
//                self.jobs = job!
                DispatchQueue.main.async {
                    comlethander(job!)
                }
            }catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
