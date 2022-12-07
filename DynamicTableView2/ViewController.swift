//
//  ViewController.swift
//  DynamicTableView2
//
//  Created by ricko caesar putra on 06/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var academyTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        academyTableView.dataSource = self
        
        academyTableView.register(
          UINib(nibName: "AcademyTableViewCell", bundle: nil), // Isi dengan nama file XIB
          forCellReuseIdentifier: "AcademyCell" // Isi dengan Identifier Cell yang telah ditentukan
        )
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyAcademyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(
          withIdentifier: "AcademyCell",
          for: indexPath
        ) as? AcademyTableViewCell {
            let academy = dummyAcademyData[indexPath.row]
            cell.academyLabel.text = academy.name
            cell.academyImageView.image = academy.image// Mencari UITableViewCell berdasarkan Identifier.
          return cell
        } else {
          return UITableViewCell() // Mengembalikan UITableViewCell jika tidak ditemukan.
        }
    }
}
