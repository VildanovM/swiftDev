//
//  TableTableViewController.swift
//  Test_1
//
//  Created by Максим Вильданов on 07.06.2018.
//  Copyright © 2018 Максим Вильданов. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var items = [Items]()
    var names = [String]()
    var forks = [Int]()
    var viewes = [Int]()
    var stars = [Int]()
    var index = 0
    var curdata : Data?
    fileprivate func getData() {
        //        let item = Model(name: "Alamofire", description: "Lorem Ipsum sgashg ghjsa dghajs dghja sgdgh jasjgdhas gdgasghjd gjhasghjdashj gdgjhasghjd ghjasghjdh asghdas ghdghjas dgashhg ajsdghjsad hjgasd jgh")
        //        itemArray.append(item)
        let session = URLSession.shared
        let url = URL(string: "https://api.github.com/search/repositories?q=swift+language:swift&sort=stars")!
        let task = session.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                print("DataTask error: \(error!.localizedDescription)")
                return
            }
            if let curdata = data, self.curdata != curdata {
                do {
                    let dictionary = try JSONDecoder().decode(Model.self, from: curdata)
                    self.items = dictionary.items
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
        print(self.items)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        self.tableView.addSubview(self.refreshTable)
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        let item = items[indexPath.row]
        cell.nameLabel.text = item.full_name
        cell .descriptionLabel.text = item.description
        cell.starsLabel.text = "★" + String(item.stargazers_count!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "push" {
            if let index = tableView.indexPathForSelectedRow?.row {
                let itemsDetailTVC = segue.destination as! SecondViewController
                itemsDetailTVC.name = items[index].full_name
                itemsDetailTVC.stars = items[index].stargazers_count
                itemsDetailTVC.forks = items[index].forks_count
                itemsDetailTVC.views = items[index].watchers_count
            }
        }
    }
    
    
    

    
    var refreshTable: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh(refreshControl:)), for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.orange
        
        return refreshControl
    }()
    
    @objc func handleRefresh(refreshControl: UIRefreshControl) {
        getData()
        
        refreshControl.endRefreshing()
    }
}
