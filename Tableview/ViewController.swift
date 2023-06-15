//
//  ViewController.swift
//  Tableview
//
//  Created by 邢海斌 on 2023-06-14.
//

import UIKit

class ViewController: UIViewController {
    let data = [["General","Accessibility","Privacy & Security"],["Passwords","Battery"]]
    let icon = [["gear","figure.wave.circle.fill","hand.raised.fill"],["key.fill","battery.100"]]
    @IBOutlet weak var tableData: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableData.delegate = self
        tableData.dataSource = self
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))

        let label = UILabel(frame: header.bounds)
        label.text = "Setting"
        label.textAlignment = .center
        label.font =  UIFont.systemFont(ofSize: 25.0, weight: .bold)
        header.addSubview(label)
        tableData.tableHeaderView = header
        // Do any additional setup after loading the view.
   }


}
extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "SecondViewController")as?SecondViewController{
            vc.lableName = data[indexPath.section][indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
   
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10.0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath)as!CustomTableViewCell
        cell.lbl_Name.text = data[indexPath.section][indexPath.row]
        cell.img_View.image = UIImage(systemName: icon[indexPath.section][indexPath.row])
        return cell
    }
}
