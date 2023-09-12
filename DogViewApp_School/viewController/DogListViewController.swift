//
//  DogListViewController.swift
//  DogViewApp_School
//
//  Created by user on 2023/09/12.
//

import UIKit

class DogListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let navigationBarTitile = "ホーム"

    var dogList = ["dog", "chees"]
    
    @IBOutlet weak var dogListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dogListTableView.delegate = self
        dogListTableView.dataSource = self
        
        self.navigationItem.title = navigationBarTitile

    }
    
    @IBAction func randumBarButtonTapped(_ sender: Any) {
        print("tappled randum")
        // ここでAPI実施
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = dogListTableView.dequeueReusableCell(withIdentifier: "dogListCell", for: indexPath) as? DogListTableViewCell else {
            // 例外:とりあえず空で返す
            let cell = UITableViewCell()
            return cell
        }

        // Configure the cell...
        
        return cell
    }

}
