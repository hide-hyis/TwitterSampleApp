//
//  ViewController.swift
//  TwitterSampleApp3
//
//  Created by 高橋真悟 on 2023/10/05.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var twitterDataList: [TwitterDataModel] = []
    
    override func viewDidLoad() {
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        setTwitterData()
    }
    
    func setTwitterData() {
        for i in 1...5 {
            let twitterDataModel = TwitterDataModel(text: "このツイートは\(i)番目のメモです。", recordDate: Date())
            twitterDataList.append(twitterDataModel)
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection seion: Int) -> Int {
        return twitterDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let twitterDataModel: TwitterDataModel = twitterDataList[indexPath.row]
        cell.textLabel?.text = twitterDataModel.text
        cell.detailTextLabel?.text = "\(twitterDataModel.recordDate)"
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboad = UIStoryboard(name: "Main", bundle: nil)
        let twitterDetailViewController = storyboad.instantiateViewController(identifier: "TwitterDetailViewController") as!TwitterDetailViewController
        navigationController?.pushViewController(twitterDetailViewController, animated: true)
    }
}

